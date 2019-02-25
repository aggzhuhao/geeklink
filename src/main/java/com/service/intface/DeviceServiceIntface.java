package com.service.intface;

import java.util.List;

import com.entity.Device;
import com.entity.Sensor;
import com.entity.User;

public interface DeviceServiceIntface {
	
	public List<Device> queryDeviceByUserId(User user);
	
	public List<Sensor> querySensorByDeviceId(int deviceId);
	
	public Device queryDeviceById(int deviceId);
	
	public boolean deleteDeviceById(int deviceId);
	
	public List<Device> likeQueryDeviceByName(User user);
	
	public boolean insertDevice(Device device);
	
	public boolean updateDeviceById(Device device);
	
}
