package com.dao.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.entity.Device;
import com.entity.User;
import com.entity.UserMessage;
@Repository
public interface UserDaoMapper {
	
	public User selectUserByIdPsw(User user);
	
	public User selectUserByName(String name);
	
	public int createUser(User user);
	
	public int updateUserStats(User user);
	
	public List<UserMessage> selectMessageList(Integer receiverId);
	
	public User selectimgSrc(int userId);
	
	public int updateMessagestatus(int userId);
	
	public int updateUser(User user); 
	
}
