package com.nckh.cnttva1k61.services;

import java.io.File;
import java.io.IOException;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.nckh.cnttva1k61.components.Utilities;
import com.nckh.cnttva1k61.dto.EventSearchModel;
import com.nckh.cnttva1k61.dto.NewsSearchModel;
import com.nckh.cnttva1k61.entities.Events;
import com.nckh.cnttva1k61.entities.News;
import com.nckh.cnttva1k61.entities.NewsImages;

@Service
public class NewsService extends BaseService<News> {
	@Autowired
	NewsImagesService newsImagesService;

	@Override
	protected Class<News> clazz() {
		// TODO Auto-generated method stub
		return News.class;
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
	public News add(News p, MultipartFile newsAvatar, MultipartFile[] newsPictures)
			throws IllegalStateException, IOException {

		// kiểm tra xem admin có đẩy avatar lên không ???
		if (!isEmptyUploadFile(newsAvatar)) {
			// tạo đường dẫn tới folder chứa avatar
			String pathToFile = UPLOAD_FOLDER_ROOT + "/news/avatar/" + newsAvatar.getOriginalFilename();

			// lưu avatar vào đường dẫn trên
			newsAvatar.transferTo(new File(pathToFile));

			p.setAvatar("news/avatar/" + newsAvatar.getOriginalFilename());
		}

		// có đẩy pictures(product_images) ???
		if (!isEmptyUploadFile(newsPictures)) {

			// nếu admin đẩy lên thì duyệt tất cả file đẩy lên và lưu trên server
			for (MultipartFile pic : newsPictures) {
				// lưu ảnh admin đẩy lên vào server
				pic.transferTo(new File(UPLOAD_FOLDER_ROOT + "/news/pictures/" + pic.getOriginalFilename()));

				// tạo mới 1 bản ghi product_images
				NewsImages pi = new NewsImages();
				pi.setPath("news/pictures/" + pic.getOriginalFilename());
				pi.setTitle(pic.getOriginalFilename());

				p.addNewsImages(pi);
			}
		}
		p.setSeo(Utilities.slugify(p.getTitle()));
		// lưu vào database
		return super.saveOrUpdate(p);
	}

	@Transactional
	public News update(News p, MultipartFile newsAvatar, MultipartFile[] newsPictures)
			throws IllegalStateException, IOException {

		// lấy thông tin cũ của product theo id
		News newsInDb = super.getById(p.getId());

		// có đẩy avartar ??? => xóa avatar cũ đi và thêm avatar mới
		if (!isEmptyUploadFile(newsAvatar)) {
			// xóa avatar trong folder lên
			new File(UPLOAD_FOLDER_ROOT + newsInDb.getAvatar()).delete();

			// add avartar moi
			newsAvatar.transferTo(new File(UPLOAD_FOLDER_ROOT + "news/avatar/" + newsAvatar.getOriginalFilename()));
			p.setAvatar("news/avatar/" + newsAvatar.getOriginalFilename());
		} else {
			// su dung lai avatar cu
			p.setAvatar(newsInDb.getAvatar());
		}

		// có đẩy pictures ???
		if (!isEmptyUploadFile(newsPictures)) {

			// xóa pictures cũ
			if (newsInDb.getNewsImages() != null && newsInDb.getNewsImages().size() > 0) {
				for (NewsImages opi : newsInDb.getNewsImages()) {
					// xóa avatar trong folder lên
					new File(UPLOAD_FOLDER_ROOT + opi.getPath()).delete();

					newsImagesService.delete(opi);
				}
			}

			// thêm pictures mới
			for (MultipartFile pic : newsPictures) {
				pic.transferTo(new File(UPLOAD_FOLDER_ROOT + "news/pictures/" + pic.getOriginalFilename()));

				NewsImages pi = new NewsImages();
				pi.setPath("news/pictures/" + pic.getOriginalFilename());
				pi.setTitle(pic.getOriginalFilename());

				p.addNewsImages(pi);
			}
		}
		p.setSeo(Utilities.slugify(p.getTitle()));
		// lưu vào database
		return super.saveOrUpdate(p);

	}
	
	public PagerData<News> search(NewsSearchModel searchModel) {
		String sql = "SELECT * FROM tbl_news p WHERE 1=1 ";

		if (searchModel != null) {
			if (searchModel.categoryId != null && searchModel.categoryId > 0) {
				sql += " and category_id =' " + searchModel.categoryId + " '";
			}

			if (!StringUtils.isEmpty(searchModel.seo)) {
				sql += " and p.seo ='" + searchModel.seo + "'";
			}
			if (!StringUtils.isEmpty(searchModel.keyword)) {
				sql += " and (p.title like '%" + searchModel.keyword + "%'" + " or p.detail_description like '%"
						+ searchModel.keyword + "%' " + " or p.short_description like '%" + searchModel.keyword + "%')";
			}
			if (searchModel.isHot != null) {
				sql += " and p.is_hot = '" + searchModel.isHot + "'";
			}
		}
                sql += "ORDER BY p.created_date DESC";
        
		return runTransactQuerySQL(sql, searchModel == null ? 0 : searchModel.page);
	}

	public PagerData<News> searchList(NewsSearchModel searchModel) {
		String sql = "SELECT * FROM tbl_news p WHERE 1=1 " + "ORDER BY p.created_date DESC";
		if (searchModel != null) {
			if (searchModel.categoryId != null && searchModel.categoryId > 0) {
				sql += " and category_id = " + searchModel.categoryId;
			}
			if (!StringUtils.isEmpty(searchModel.seo)) {
				sql += " and p.seo ='" + searchModel.seo + "'";
			}
		}
		return runTransactQuerySQL(sql, searchModel == null ? 0 : searchModel.page);
	}

	public PagerData<News> listSeo(NewsSearchModel searchModel) {
		String sql = "SELECT * FROM tbl_news p WHERE p.seo ='" + searchModel.seo + "'";
		return runTransactQuerySQL(sql, searchModel == null ? 0 : searchModel.page);
	}
	public PagerData<News> listByCategoryId(NewsSearchModel searchModel) {
		String sql = "SELECT * FROM tbl_news p WHERE p.category_id ='" + searchModel.categoryId + "'";
		return runTransactQuerySQL(sql, searchModel == null ? 0 : searchModel.page);
	}
	public PagerData<News> FourLastNews(NewsSearchModel searchModel) {
		String sql = "SELECT * FROM tbl_news P WHERE NOT P.category_id = 132 XOR P.category_id = 133 ORDER BY created_date DESC LIMIT 4";
		return runTransactQuerySQL(sql, searchModel == null ? 0 : searchModel.page);
	}

	public PagerData<News> FourLastEvents(NewsSearchModel searchModel) {
		String sql = "SELECT * FROM tbl_news  JOIN tbl_category  ON tbl_category.id = tbl_news.category_id  WHERE tbl_category.name = 'Sự Kiện' ORDER BY tbl_news.created_date DESC LIMIT 4";
		return runTransactQuerySQL(sql, searchModel == null ? 0 : searchModel.page);
	}

	public PagerData<News> TwoLastEducateNews(NewsSearchModel searchModel) {
		String sql = "SELECT * FROM tbl_news  JOIN tbl_category  ON tbl_category.id = tbl_news.category_id  WHERE tbl_category.name = 'Hệ đại Học' OR tbl_category.name = 'Hệ tiến sỹ'  OR tbl_category.name = 'Đào Tạo' OR tbl_category.name = 'Hệ Thạc Sỹ'  ORDER BY tbl_news.created_date DESC LIMIT 2";
		return runTransactQuerySQL(sql, searchModel == null ? 0 : searchModel.page);
	}
	public PagerData<News> OldStudent(NewsSearchModel searchModel) {
		String sql = "SELECT * FROM tbl_news  JOIN tbl_category  ON tbl_category.id = tbl_news.category_id  WHERE tbl_category.name = 'Cựu Sinh Viên'  ORDER BY tbl_news.created_date DESC ";
		return runTransactQuerySQL(sql, searchModel == null ? 0 : searchModel.page);
	}
	public PagerData<News> TwoLastContactNews(NewsSearchModel searchModel) {
		String sql = "SELECT * FROM tbl_news  JOIN tbl_category  ON tbl_category.id = tbl_news.category_id  WHERE tbl_category.name = 'Hợp tác đối ngoại' OR tbl_category.name = 'Hợp tác với khối Doanh nghiệp' OR tbl_category.name = 'Hợp tác với khối hàn lâm'  ORDER BY tbl_news.created_date DESC LIMIT 2";
		return runTransactQuerySQL(sql, searchModel == null ? 0 : searchModel.page);
	}

}
