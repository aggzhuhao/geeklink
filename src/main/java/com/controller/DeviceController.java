package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.entity.Device;
import com.entity.User;
import com.service.intface.DeviceServiceIntface;

@Controller
public class DeviceController {
	@Autowired
	private DeviceServiceIntface deviceService;
	
	@RequestMapping("/todevice")
	public String todevice(HttpSession session){
		User user1 = (User) session.getAttribute("user");
		session.setAttribute("user", user1);
		List<Device> deviceList = deviceService.queryDeviceByUserId(user1);
		session.setAttribute("deviceList", deviceList);
		return "device";
	}
	
	
	@RequestMapping("/device/{deviceId}")
	public String todevice(@PathVariable(value="deviceId")int deviceId,HttpSession session){
		Device device = deviceService.queryDeviceById(deviceId);
		System.out.println(device);
		session.setAttribute("device", device);
		return "redirect:/todevice";
	}
	
	@RequestMapping("/updateeditDevice/{deviceId}")
	public String updateeditDevice(@PathVariable(value="deviceId")String deviceIdstr,HttpSession session){
		Device device = (Device) session.getAttribute("device");
		if(deviceIdstr != null && !"".equals(deviceIdstr)&& device != null){
			int deviceId1 = Integer.parseInt(deviceIdstr);
			int deviceId = device.getDeviceId();
			System.out.println(deviceId +":::::"+deviceId1);
			if(deviceId1 == deviceId){
				return "redirect:/toeditDevice";
			}
		}
		return "redirect:/toeditDevice";
	}
	
	@RequestMapping("/toeditDevice")
	public String toeditDevice(){
		return "edit_device";
	}
	
	@RequestMapping("/todevicesList")
	public String todevicesList(){
		return "devices_list";
	}
	@RequestMapping("/queryAllDevice")
	public String queryAllDevice(HttpSession session){
		User user = (User) session.getAttribute("user");
		List<Device> deviceList = deviceService.queryDeviceByUserId(user);
		session.setAttribute("deviceList", deviceList);
		return "redirect:/todevicesList";
	}
	
	
	@RequestMapping("/getdevicesList")
	@ResponseBody
	public Map<String, Object> getdevicesList(@RequestParam(value="currentpage",required=false)Integer currentpage,@RequestParam(value="pagesize",required=false)Integer pagesize,HttpSession session){
		if(currentpage != null){
			currentpage++;
		}else{
			currentpage=1;
		}
		List<Device> deviceList = (List<Device>) session.getAttribute("deviceList");
		List<Device> deviceList1 = new ArrayList<Device>();
		Map<String, Object> deviceMap = new HashMap<String, Object>();
		deviceMap.put("pageSize", pagesize);
		int count =0;
		for(Device d : deviceList){
			count++;
		}

		int begin = (currentpage - 1) * pagesize + 1;
		int end = currentpage * pagesize;
		int i = end - begin;

		
		
		if(end>count){
			for(int j = 0;j<=(count-begin);j++){
				deviceList1.add(deviceList.get(begin-1+j));
			}
		}else{
			for(int j = 0;j<=i;j++){
				deviceList1.add(deviceList.get(begin-1+j));
			}
		}
		deviceMap.put("totalSize", count);
		deviceMap.put("list", deviceList1);
		//session.setAttribute("deviceList1", deviceList1);
		return deviceMap;
	}
	
	@RequestMapping("/deleteDevice")
	public void deleteDevice(String deviceId1,HttpServletResponse response) throws IOException{
		System.out.println("--------------------------------------====");
		System.out.println(deviceId1);
		PrintWriter out = response.getWriter();
		if(deviceId1 != null&&!"".equals(deviceId1)){
			int deviceId = Integer.parseInt(deviceId1);
			boolean b = deviceService.deleteDeviceById(deviceId);
			if(b == true){
				out.print(b);
				out.flush();
				out.close();
			}
		}
		
	}
	
	@RequestMapping("/searchDevice")
	@ResponseBody
	public Map searchDevice(@RequestParam(value="devicedconditions",required=false)String devicedconditions,HttpSession session){
		System.err.println("启动模糊查询----------------------");
		
		Map<String, Object> deviceMap = new HashMap<String, Object>();
		List<Device> deviceList = new ArrayList<Device>();
		User user = (User) session.getAttribute("user");
		String devicedconditions1 = "%"+devicedconditions.trim()+"%";
		User user1 = new User();
		user1.setUserId(user.getUserId());
		user1.setName(devicedconditions1);
		System.out.println(user);
		deviceList = deviceService.likeQueryDeviceByName(user1);
		session.setAttribute("likeQuerydeviceList", deviceList);
		deviceMap.put("deviceList", deviceList);
		System.out.println(deviceList);
		return deviceMap;
		
	}
	@RequestMapping("/getQuerydevicesList")
	@ResponseBody
	public Map<String, Object> getQuerydevicesList(@RequestParam(value="currentpage",required=false)Integer currentpage,@RequestParam(value="pagesize",required=false)Integer pagesize,HttpSession session){
		//System.out.println("getQuerydevicesListgetQuerydevicesList"+currentpage);
		if(currentpage != null){
				currentpage++;
			}else{
				currentpage=1;
			}
			//System.out.println("getQuerydevicesListgetQuerydevicesListgetQuerydevicesList");
			List<Device> deviceList = (List<Device>) session.getAttribute("likeQuerydeviceList");
			List<Device> deviceList1 = new ArrayList<Device>();
			Map<String, Object> deviceMap = new HashMap<String, Object>();
			deviceMap.put("pageSize", pagesize);
			int count =0;
			for(Device d : deviceList){
				count++;
			}
		
			int begin = (currentpage - 1) * pagesize + 1;
			int end = currentpage * pagesize;
			int i = end - begin;
		
			
			
			if(end>count){
				for(int j = 0;j<=(count-begin);j++){
					deviceList1.add(deviceList.get(begin-1+j));
				}
			}else{
				for(int j = 0;j<=i;j++){
					deviceList1.add(deviceList.get(begin-1+j));
				}
			}
			deviceMap.put("totalSize", count);
			deviceMap.put("list", deviceList1);
			//session.setAttribute("deviceList1", deviceList1);
			System.out.println("----------------------------");
			System.out.println(deviceList1.size());
			return deviceMap;	
	}
	@RequestMapping("/toAdd")
	public String toAdd(){
		return "add";
	}
	@RequestMapping("/addDevice")
	public String addDevice(Device device,HttpSession session){
		User user = (User) session.getAttribute("user");
		if(device != null && user !=null){
			device.setUserId(user.getUserId());
			deviceService.insertDevice(device);
		}
		return "redirect:/queryAllDevice";
	}
	
	@RequestMapping("/updateDevice")
	public String updateDevice(Device device,HttpSession session){
		User user = (User) session.getAttribute("user");
		//System.out.println();
		Device device1 = (Device) session.getAttribute("device");
		device.setUserId(user.getUserId());
		device.setDeviceId(device1.getDeviceId());
		boolean b = deviceService.updateDeviceById(device);
		System.out.println(b);
		return "redirect:/queryAllDevice";
		
	}
	
}
