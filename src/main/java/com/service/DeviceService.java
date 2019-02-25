package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import com.dao.mapper.DeviceMapper;
import com.entity.Device;
import com.entity.Sensor;
import com.entity.User;
import com.service.intface.DeviceServiceIntface;
@Service
public class DeviceService implements DeviceServiceIntface {
	
	@Autowired
	private DeviceMapper deviceMapper;
	
	
	@Override
	public List<Device> queryDeviceByUserId(User user) {
		List<Device> deviceList = deviceMapper.queryDeviceByUserId(user);
		System.out.println(deviceList);
		return deviceList;
	}
	
	public static void main(String[] args) {
		ApplicationContext ac = new ClassPathXmlApplicationContext("spring/spring-mvc.xml");
		DeviceServiceIntface deviceService = (DeviceServiceIntface) ac.getBean("deviceService");
		User user = new User();
		user.setUserId(7349);
		//System.out.println(user);
		//deviceService.queryDeviceByUserId(user);
		Device device = new Device();
		//device.setDeviceId(1001);
		//deviceService.queryDeviceById(1001);
		//System.out.println(deviceService.deleteDeviceById(12));
	//	user.setName("%远程%");
		//.out.println(deviceService.likeQueryDeviceByName(user));
		System.out.println(deviceService.querySensorByDeviceId(1002));
		
	}

	@Override
	public Device queryDeviceById(int deviceId) {
		Device device1 = deviceMapper.queryDeviceById(deviceId); 
		System.out.println(device1);
		return device1;
	}

	@Override
	public boolean deleteDeviceById(int deviceId) {
		int a = deviceMapper.deleteDeviceById(deviceId);
		if(a >0){
			return true;
		}
		return false;
	
	}

	@Override
	public List<Device> likeQueryDeviceByName(User user) {
		return deviceMapper.likeQueryDeviceByName(user);
	}

	@Override
	public boolean insertDevice(Device device) {
		int a = deviceMapper.insertDevice(device);
		if(a >0){
			return true;
		}
		return false;
	}

	@Override
	public List<Sensor> querySensorByDeviceId(int deviceId) {
		List<Sensor> sensorList = deviceMapper.querySensorByDeviceId(deviceId);
		return sensorList;
	}

	@Override
	public boolean updateDeviceById(Device device) {
		int a = deviceMapper.updateDeviceById(device);
		if(a>0){
			return true;
		}
		return false;
	}
}
