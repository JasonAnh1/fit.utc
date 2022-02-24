package com.nckh.cnttva1k61.services;

import org.springframework.stereotype.Service;

import com.nckh.cnttva1k61.entities.Role;



@Service
public class RoleService extends BaseService<Role> {

	@Override
	protected Class<Role> clazz() {
		// TODO Auto-generated method stub
		return Role.class;
	}



}
