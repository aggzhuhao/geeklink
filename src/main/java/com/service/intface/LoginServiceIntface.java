package com.service.intface;

import java.util.List;

import com.entity.User;
import com.entity.UserMessage;

public interface LoginServiceIntface {
	
	public User selectUserByIdPsw(User user);
	
	public boolean selectUserByName(String name);
	
	public boolean createUser(User user);
	
	public boolean updateUserStats(User user);
	
	public List<UserMessage> selectMessageList(Integer receiverId);
	
	public boolean updateMessagestatus(int userId);
	
	public boolean updateUser(User user);
}
