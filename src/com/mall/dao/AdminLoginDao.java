package com.mall.dao;

import com.mall.po.Admin;

public interface AdminLoginDao {

	public Admin login(Admin admin);
	public boolean updatePassword(Admin admin);
}
