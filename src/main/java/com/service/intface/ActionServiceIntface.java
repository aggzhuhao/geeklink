package com.service.intface;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.mapper.ActionMapper;
import com.entity.Device;
import com.entity.DeviceAction;
import com.entity.SensorAction;

public interface ActionServiceIntface {
	public List<DeviceAction> queryAllDevicetion();
	
	public List<DeviceAction> likeQueryDevice(String name);
	
	public boolean deleteDeviceAction(int deviceId);
	
	public boolean insertDeviceAction(DeviceAction deviceAction);
	
	public boolean updateSensorAction(SensorAction sensorAction);
	
	public boolean insertSensorAction(SensorAction sensorAction);

	public boolean deleteSensorActionById(int sensorActionId);
	
	public SensorAction querySensorActionById(int sensorActionId);
	
	public DeviceAction queryDeviceActionById(int actionId);
	
	public boolean updateActionById(DeviceAction deviceAction);
}
