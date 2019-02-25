package com.controller;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.junit.runners.Parameterized.Parameter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dao.mapper.UserDaoMapper;
import com.entity.Device;
import com.entity.DeviceAction;
import com.entity.User;
import com.entity.UserMessage;
import com.service.intface.ActionServiceIntface;
import com.service.intface.DeviceServiceIntface;
import com.service.intface.LoginServiceIntface;
@Controller
public class LoginController {
	@Autowired
	private LoginServiceIntface loginService;
	
	@Autowired
	private DeviceServiceIntface deviceService;
	
	@Autowired
	private ActionServiceIntface actionService;
	@RequestMapping(value="/tologin")
	public String tologin(){
		return "login";
	}
	
	@RequestMapping("/index")
	public String toindex(HttpSession session){
		List<DeviceAction> deviceActionList = actionService.queryAllDevicetion();
		session.setAttribute("deviceActionList", deviceActionList);
		return "index";
	}
	@RequestMapping("/loginuser")
	public String loginUser(User user,@RequestParam(value="zipCode")String checkCode,HttpSession session,HttpServletRequest request){
		//System.out.println(user.getName()+":"+user.getPassssword()+"::"+checkCode);
		if(checkCode != null && !"".equals(checkCode)){
		String code = (String) session.getAttribute("code");
		User user1 = null;
		if(code.equals(checkCode.trim())){
			user1 = loginService.selectUserByIdPsw(user);
			if(user1 != null){
				session.setAttribute("user", user1);
				List<Device> deviceList = deviceService.queryDeviceByUserId(user1);
				
				List<UserMessage> messageList = new ArrayList<UserMessage>();
				
				messageList = loginService.selectMessageList(user1.getUserId());	
				int messages = 0;
				long time1 = System.currentTimeMillis();
				for(UserMessage u : messageList){
					if(u.getReadStatus()!=null){
						if(u.getReadStatus()==0){
							messages+=1;
						}
					}
					Date time2 = u.getSendTime();
					SimpleDateFormat d = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					String time2str = d.format(time2);
					try {
						long time = d.parse(time2str).getTime();
						long l = time1-time;
						u.setTime(l);
					} catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				System.out.println(deviceList.size()+":::::::::::::::::::::::::::");
				session.setAttribute("deviceList",deviceList);
				session.setAttribute("messageList", messageList);
				session.setAttribute("messages", messages);
				return "redirect:/index";
			}else{
				request.setAttribute("userIdMsgmessage", "账号或密码有误");
				return "login";
			}
		}else{
			request.setAttribute("userIdMsgmessage", "验证码有误");
			return "login";
		}
		}
		request.setAttribute("userIdMsgmessage", "请输入验证码");
		return "login";
	}
	
	
	@RequestMapping("/changeCheckCode/{r}")
	public void changeCheckCode(HttpServletRequest request,HttpServletResponse response) throws IOException{
		HttpSession session = request.getSession();
		int width = 78;
		int height = 20;
		//创建图片对象
		BufferedImage bim = new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
		//获取图片绘图对象
		Graphics g = bim.getGraphics();
				
		//随机产生背景颜色并填充整个图片
		Random rm = new Random();
		g.setColor(new Color(rm.nextInt(155),rm.nextInt(220),rm.nextInt(255)));
				g.fillRect(0,0, width, height);
				
		StringBuffer sbf = new StringBuffer("");
		for(int i=0;i<4;i++){//循环输出数字
			g.setColor(new Color(rm.nextInt(88),rm.nextInt(188),rm.nextInt(255)));
			g.setFont(new Font("Dotum",Font.BOLD|Font.ITALIC,22));
			int n = rm.nextInt(10);
			sbf.append(n);
			g.drawString(""+n,i*16+5, 18);
		}
		String code = sbf.toString();
		long i = System.currentTimeMillis();
		session.setAttribute("i", i);
		session.setAttribute("code", code);
		System.out.println(code +"::::第一次");
		/**/
		//System.out.println(i+":::"+code);
		//输出验证码图片
		ImageIO.write(bim, "jpg", response.getOutputStream());
		//System.out.println("生成图片结束---------------------");
	}
	

	@RequestMapping("/toRegister")
	public String toRegister(){
		return "register";
	}
	
	
	
	@RequestMapping("/checkName")
	public void checkName(String name,HttpServletRequest request,HttpServletResponse response){
		if(name != null && !"".equals(name)){
			response.setContentType("text/html;charset=UTF-8");
			boolean b = loginService.selectUserByName(name.trim());
			//User user = new User();
			try {
				PrintWriter out = response.getWriter();
				out.print(b);
				out.flush();
				out.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
	}
	@RequestMapping("/checkCode")
	public void checkCode(String checkCode,HttpServletResponse reponse,HttpSession session) throws IOException{
		if(checkCode != null && !"".equals(checkCode)){
			PrintWriter out = reponse.getWriter();
			String code = (String) session.getAttribute("code");
			int b = 0;
			if(checkCode.trim().equals(code.trim())){
				b = 1;
			}
			
			out.print(b);
			out.flush();
			out.close();
		}
		
	}
	
	@RequestMapping("/Registersuccess")
	public String successRegister(User user,@RequestParam(value="zipCode",required=false)String checkCode,HttpSession session,HttpServletRequest request){
		System.out.println(user);
		System.out.println(checkCode);
		String code = (String) session.getAttribute("code");
		if(checkCode != null && !"".equals(checkCode)){
			if(checkCode.equals(code) && user != null){
				String apiKey = UUID.randomUUID().toString().replace("-", "").toLowerCase();
				user.setApiKey(apiKey);
				user.setActivationStatus((byte)0);
				user.setRole((byte)2);
				user.setAvatar("/resource/images/avatar-default.gif");
				boolean b = loginService.createUser(user);
				if(b == false){
					request.setAttribute("errregistermsg", "验证码输入有错误");
					return "register";
				}else{
					session.setAttribute("apikey", apiKey);
					session.setAttribute("user1", user);
					System.out.println(apiKey);
					return "apikey";
				}
			}
			request.setAttribute("errregistermsg", "验证码输入有错误");
			return "register";
		}
		request.setAttribute("errregistermsg", "请输入验证码");
		return "register";
	}

	@RequestMapping("/changeStatus/{key}")
	public String changeStatus(@PathVariable(value="key")String key,HttpSession session){
		System.out.println(key+"key----------");
		User user = (User) session.getAttribute("user");
		System.out.println(user+"::::");
		String key1 = user.getApiKey();
		if(key != null && !"".equals(key)&&key1 != null && !"".equals(key1)){
			if(key1.equals(key)){
				user.setActivationStatus((byte)1);
				boolean b = loginService.updateUserStats(user);
				System.out.println(b);
				if(b){
					return "redirect:/tologin";
				}
			}
		}
		
		return "register";
	}
	
	@RequestMapping("/tonotifications")
	public String tonotifications(HttpSession session){
		User user = (User) session.getAttribute("user");
		loginService.updateMessagestatus(user.getUserId());
		List<UserMessage> messageList = new ArrayList<UserMessage>();
		messageList = loginService.selectMessageList(user.getUserId());	
		int messages = 0;
		long time1 = System.currentTimeMillis();
		for(UserMessage u : messageList){
			Date time2 = u.getSendTime();
			SimpleDateFormat d = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String time2str = d.format(time2);
			try {
				long time = d.parse(time2str).getTime();
				long l = time1-time;
				u.setTime(l);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		session.setAttribute("messageList", messageList);
		session.setAttribute("messages", messages);
		return "redirect:/notifications";
	}
	@RequestMapping("/notifications")
	public String tonotifications(){
		return "notifications";
	}
	
	@RequestMapping("/touserprofile")
	public String touserprofile(){
		
		return "user_profile";
	}
	@RequestMapping("/toupdateUser")
	public String toupdateUser(User user,HttpSession session){
		User user1 = (User) session.getAttribute("user");
		System.out.println(user);
		if(user !=null && user1!=null){
			user1.setDescription(user.getDescription());
			user1.setEmail(user.getEmail());
			loginService.updateUser(user1);
			return "redirect:/index";
		}else{
			return "redirect:/tologin";
		}
	}
	@RequestMapping("/toChangePassword")
	public String toChangePassword(){
		return "change_password";
	}
	@RequestMapping("/checkOldpassword")
	public void checkOldpassword(String password1,HttpSession session,HttpServletResponse response) throws IOException{
		User user = (User) session.getAttribute("user");
		PrintWriter out = response.getWriter();
		if(password1 !=null &&!"".equals(password1)&&user!=null){
			String password = user.getPassword();
			if(password.equals(password1)){
				out.print(true);
				out.flush();
				out.close();
			}else{
				out.print(false);
				out.flush();
				out.close();
			}
		}
	}
	@RequestMapping("/changePassword")
	public String changePassword(User user,HttpSession session){
		User user1 = (User) session.getAttribute("user");
		if(user != null && user1!=null){
			System.out.println(user);
			user1.setPassword(user.getPassword());
			boolean b = loginService.updateUser(user1);
			return "redirect:/toChangePassword";
			
		}
		
		return "redirect:/toChangePassword";
	}
	
	@RequestMapping("/removeUser")
	public String removeUser(HttpSession session){
		session.removeAttribute("user");
		return "redirect:/tologin";
	}
}
