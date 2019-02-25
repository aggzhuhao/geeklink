package com.service;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import com.dao.mapper.UserDaoMapper;
import com.entity.User;
import com.entity.UserMessage;
import com.service.intface.LoginServiceIntface;
@Service
public class LoginService implements LoginServiceIntface {
	@Autowired
	private UserDaoMapper userDaoMapper;
	
	public User selectUserByIdPsw(User user) {

		User user1 = userDaoMapper.selectUserByIdPsw(user);
		
		return user1;
	}

	
	public static void main(String[] args) {
		ApplicationContext ac = new ClassPathXmlApplicationContext("spring/spring-mvc.xml");
		LoginServiceIntface loginService = (LoginServiceIntface) ac.getBean("loginService");
		User user = new User();
		user.setName("a123456");
		user.setPassword("123");
		//System.out.println(loginService.selectUserByIdPsw(user));
		//String uuid = UUID.randomUUID().toString().replace("-", "").toLowerCase();
		//System.out.println(uuid);
		//System.out.println(loginService.selectUserByName("acc"));
		//System.out.println(loginService.createUser(user));
		user.setUserId(7612);
		user.setActivationStatus((byte)0);
		user.setApiKey("7297a5b3d7b6451e9d99976f4b87ef56");
		//System.out.println(loginService.updateUserStats(user));
		//System.out.println(loginService.selectMessageList(7349));
		//loginService.updateMessagestatus(1);
		loginService.updateUser(user);
	}


	@Override
	public boolean selectUserByName(String name) {
		User user = userDaoMapper.selectUserByName(name);
		if(user != null){
			return false;
		}else{
			return true;
		}
		
	}


	@Override
	public boolean createUser(User user) {
		//user = new User(1003, "admsAS", "123", "ss", "ddddd", "sasd", (byte)0, "asdsad", (byte)2);
		int a = userDaoMapper.createUser(user);
		if(a > 0){
			return true;
		}else{
			return false;
		}
	}


	@Override
	public boolean updateUserStats(User user) {
		int a = userDaoMapper.updateUserStats(user);
		if(a > 0){
			return true;
		}else{
			return false;
		}
	}


	@Override
	public List<UserMessage> selectMessageList(Integer receiverId) {
		List<UserMessage> e = new ArrayList<UserMessage>();
		e = userDaoMapper.selectMessageList(receiverId);
		
		return e;
	}


	@Override
	public boolean updateMessagestatus(int userId) {
		userDaoMapper.updateMessagestatus(7349);
		return false;
	}


	@Override
	public boolean updateUser(User user) {
		userDaoMapper.updateUser(user);
		return false;
	}


	


}
