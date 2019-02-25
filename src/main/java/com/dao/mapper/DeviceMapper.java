package com.dao.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ResponseBody;

import com.entity.*;

@Repository
public interface DeviceMapper {
	
	public List<Device> queryDeviceByUserId(User user);
	
	public List<Sensor> querySensorByDeviceId(int deviceId);
	
	public Device queryDeviceById(int deviceId);
	
	public int deleteDeviceById(int deviceId);
	
	public List<Device> likeQueryDeviceByName(User user);
	
	public int insertDevice(Device device);
	
	public int updateDeviceById(Device device);

}
