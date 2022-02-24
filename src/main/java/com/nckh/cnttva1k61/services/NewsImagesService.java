package com.nckh.cnttva1k61.services;

import org.springframework.stereotype.Service;

import com.nckh.cnttva1k61.entities.NewsImages;

@Service
public class NewsImagesService extends BaseService<NewsImages> {

	@Override
	protected Class<NewsImages> clazz() {
		// TODO Auto-generated method stub
		return NewsImages.class;
	}

}
