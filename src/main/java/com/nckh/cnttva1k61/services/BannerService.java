package com.nckh.cnttva1k61.services;

import java.io.File;
import java.io.IOException;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.nckh.cnttva1k61.components.Utilities;
import com.nckh.cnttva1k61.dto.BannerSearchModel;
import com.nckh.cnttva1k61.entities.Banner;
import com.nckh.cnttva1k61.entities.BannerImages;

@Service
public class BannerService extends BaseService<Banner> {
	@Autowired
	BannerImagesService bannerImagesService;

	@Override
	protected Class<Banner> clazz() {
		// TODO Auto-generated method stub
		return Banner.class;
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
	public Banner add(Banner p, MultipartFile bannerAvatar, MultipartFile[] bannerPictures)
			throws IllegalStateException, IOException {

		// kiểm tra xem admin có đẩy avatar lên không ???
		if (!isEmptyUploadFile(bannerAvatar)) {
			// tạo đường dẫn tới folder chứa avatar
			String pathToFile = UPLOAD_FOLDER_ROOT + "/banner/avatar/" + bannerAvatar.getOriginalFilename();

			// lưu avatar vào đường dẫn trên
			bannerAvatar.transferTo(new File(pathToFile));

			p.setAvatar("banner/avatar/" + bannerAvatar.getOriginalFilename());
		}

		// có đẩy pictures(product_images) ???
		if (!isEmptyUploadFile(bannerPictures)) {

			// nếu admin đẩy lên thì duyệt tất cả file đẩy lên và lưu trên server
			for (MultipartFile pic : bannerPictures) {
				// lưu ảnh admin đẩy lên vào server
				pic.transferTo(new File(UPLOAD_FOLDER_ROOT + "/banner/pictures/" + pic.getOriginalFilename()));

				// tạo mới 1 bản ghi product_images
				BannerImages pi = new BannerImages();
				pi.setPath("banner/pictures/" + pic.getOriginalFilename());
				pi.setTitle(pic.getOriginalFilename());

				p.addBannerImages(pi);
			}
		}
		p.setSeo(Utilities.slugify(p.getTitle()));
		// lưu vào database
		return super.saveOrUpdate(p);
	}
	@Transactional
	public Banner update(Banner p, MultipartFile bannerAvatar, MultipartFile[] bannerPictures)
			throws IllegalStateException, IOException {

		// lấy thông tin cũ của product theo id
		Banner BannerInDb = super.getById(p.getId());

		// có đẩy avartar ??? => xóa avatar cũ đi và thêm avatar mới
		if (!isEmptyUploadFile(bannerAvatar)) {
			// xóa avatar trong folder lên
			new File(UPLOAD_FOLDER_ROOT + BannerInDb.getAvatar()).delete();

			// add avartar moi
			bannerAvatar
					.transferTo(new File(UPLOAD_FOLDER_ROOT + "/banner/avatar/" + bannerAvatar.getOriginalFilename()));
			p.setAvatar("banner/avatar/" + bannerAvatar.getOriginalFilename());
		} else {
			// su dung lai avatar cu
			p.setAvatar(BannerInDb.getAvatar());
		}

		// có đẩy pictures ???
		if (!isEmptyUploadFile(bannerPictures)) {

			// xóa pictures cũ
			if (BannerInDb.getBannerImages() != null && BannerInDb.getBannerImages().size() > 0) {
				for (BannerImages opi : BannerInDb.getBannerImages()) {
					// xóa avatar trong folder lên
					new File(UPLOAD_FOLDER_ROOT + opi.getPath()).delete();

					bannerImagesService.delete(opi);
				}
			}

			// thêm pictures mới
			for (MultipartFile pic : bannerPictures) {
				pic.transferTo(new File(UPLOAD_FOLDER_ROOT + "banner/pictures/" + pic.getOriginalFilename()));

				BannerImages pi = new BannerImages();
				pi.setPath("banner/pictures/" + pic.getOriginalFilename());
				pi.setTitle(pic.getOriginalFilename());

				p.addBannerImages(pi);
			}
		}
		p.setSeo(Utilities.slugify(p.getTitle()));
		// lưu vào database
		return super.saveOrUpdate(p);

	}
	public PagerData<Banner> search(BannerSearchModel searchModel) {
		String sql = "SELECT * FROM tbl_banner p WHERE 1=1";

		if (searchModel != null) {
			if (searchModel.categoryId != null && searchModel.categoryId > 0) {
				sql += " and category_id = " + searchModel.categoryId;
			}

			if (!StringUtils.isEmpty(searchModel.seo)) {
				sql += " and p.seo ='" + searchModel.seo + "'";
			}
			if (!StringUtils.isEmpty(searchModel.keyword)) {
				sql += " and (p.title like '%" + searchModel.keyword + "%'" + " or p.detail_description like '%"
						+ searchModel.keyword + "%' " + " or p.short_description like '%" + searchModel.keyword + "%')";
			}
		}

		return runTransactQuerySQL(sql, searchModel == null ? 0 : searchModel.page);
	}
	
	public PagerData<Banner>FourLastBanner(BannerSearchModel searchModel) {
		String sql = "SELECT * FROM tbl_banner ORDER BY created_date DESC LIMIT 4";
		return runTransactQuerySQL(sql, searchModel == null ? 0 : searchModel.page);
	}
}
