package com.nckh.cnttva1k61.services;

import org.springframework.stereotype.Service;

import com.nckh.cnttva1k61.entities.BannerImages;

@Service
public class BannerImagesService extends BaseService<BannerImages> {

	@Override
	protected Class<BannerImages> clazz() {
		// TODO Auto-generated method stub
		return BannerImages.class;
	}

}
