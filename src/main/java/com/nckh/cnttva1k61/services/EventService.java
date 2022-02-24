package com.nckh.cnttva1k61.services;

import java.io.File;
import java.io.IOException;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.nckh.cnttva1k61.components.Utilities;
import com.nckh.cnttva1k61.dto.EventSearchModel;
import com.nckh.cnttva1k61.entities.Events;

@Service
public class EventService extends BaseService<Events> {

	@Override
	protected Class<Events> clazz() {
		// TODO Auto-generated method stub
		return Events.class;
	}

	private boolean isEmptyUploadFile(MultipartFile[] images) {
		if (images == null || images.length <= 0)
			return true;

		if (images.length == 1 && images[0].getOriginalFilename().isEmpty())
			return true;

		return false;
	}

	private boolean isEmptyUploadFile(MultipartFile image) {
		return image == null || image.getOriginalFilename().isEmpty();
	}

	/**
	 * Dùng để thêm mới sản phẩm
	 * 
	 * @param p
	 * @param productAvatar
	 * @param productPictures
	 * @throws IOException
	 * @throws IllegalStateException
	 */
	@Transactional
	public Events add(Events p, MultipartFile eventsAvatar) throws IllegalStateException, IOException {

		// kiểm tra xem admin có đẩy avatar lên không ???
		if (!isEmptyUploadFile(eventsAvatar)) {
			// tạo đường dẫn tới folder chứa avatar
			String pathToFile = UPLOAD_FOLDER_ROOT + "/events/avatar/" + eventsAvatar.getOriginalFilename();

			// lưu avatar vào đường dẫn trên
			eventsAvatar.transferTo(new File(pathToFile));

			p.setAvatar("events/avatar/" + eventsAvatar.getOriginalFilename());
		}
		p.setSeo(Utilities.slugify(p.getTitle()));
		// lưu vào database
		return super.saveOrUpdate(p);
	}

	@Transactional
	public Events update(Events p, MultipartFile eventsAvatar) throws IllegalStateException, IOException {

		// lấy thông tin cũ của product theo id
		Events EventsInDb = super.getById(p.getId());

		// có đẩy avartar ??? => xóa avatar cũ đi và thêm avatar mới
		if (!isEmptyUploadFile(eventsAvatar)) {
			// xóa avatar trong folder lên
			new File(UPLOAD_FOLDER_ROOT + EventsInDb.getAvatar()).delete();

			// add avartar moi
			eventsAvatar
					.transferTo(new File(UPLOAD_FOLDER_ROOT + "/events/avatar/" + eventsAvatar.getOriginalFilename()));
			p.setAvatar("events/avatar/" + eventsAvatar.getOriginalFilename());
		} else {
			// su dung lai avatar cu
			p.setAvatar(EventsInDb.getAvatar());
		}

		p.setSeo(Utilities.slugify(p.getTitle()));
		// lưu vào database
		return super.saveOrUpdate(p);

	}

	public PagerData<Events> search(EventSearchModel searchModel) {
		String sql = "SELECT * FROM tbl_events p WHERE 1=1 ";

		if (searchModel != null) {

			if (!StringUtils.isEmpty(searchModel.seo)) {
				sql += " and p.seo ='" + searchModel.seo + "'";
			}
			if (!StringUtils.isEmpty(searchModel.keyword)) {
				sql += " and (p.title like '%" + searchModel.keyword + "%'" + " or p.detail_description like '%"
						+ searchModel.keyword + "%' )";
			}

		}
		sql += "ORDER BY p.created_date DESC";
		return runTransactQuerySQL(sql, searchModel == null ? 0 : searchModel.page);
	}

	public PagerData<Events> listEvents(EventSearchModel searchModel) {
		String sql = "SELECT * FROM tbl_events ORDER BY created_date DESC LIMIT 12";
		return runTransactQuerySQL(sql, searchModel == null ? 0 : searchModel.page);
	}

	public PagerData<Events> listSeo(EventSearchModel searchModel) {
		String sql = "SELECT * FROM tbl_events p WHERE p.seo ='" + searchModel.seo + "'";
		return runTransactQuerySQL(sql, searchModel == null ? 0 : searchModel.page);
	}
}
