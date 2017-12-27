package com.user.service;

import com.user.po.Userinfo;

import java.util.List;

public interface UserinfoService {

	public Userinfo logoin(String phonenum, String password);
	
	public void updateUser(Userinfo user);
	
	public List<Userinfo> getAllUsers(int page);
	
	public List<Userinfo> userQuery(String userName,String userPhone);
	
	public int getAllCount();
	
	public void deleteById(int id);
	
	public void insert(Userinfo users);
	
	public Userinfo selectById(int id);

}
