package com.dao.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.entity.DeviceAction;
import com.entity.SensorAction;

@Repository
public interface ActionMapper {

	public List<DeviceAction> queryAllDevicetion();
	
	public List<SensorAction> querySensorAction(int sensorActionId);
	
	public List<DeviceAction> likeQueryDevice(String name);
	
	public int deleteDeviceAction(int deviceId);
	
	public int insertDeviceAction(DeviceAction deviceAction);
	
	public int updateSensorAction(SensorAction sensorAction);
	
	public int insertSensorAction(SensorAction sensorAction);
	
	public int deleteSensorActionById(int sensorActionId);
	
	public SensorAction querySensorActionById(int sensorActionId);
	
	public DeviceAction queryDeviceActionById(int actionId);
	
	public int updateActionById(DeviceAction deviceAction);
}
