package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import com.dao.mapper.ActionMapper;
import com.entity.DeviceAction;
import com.entity.SensorAction;
import com.service.intface.ActionServiceIntface;
import com.service.intface.DeviceServiceIntface;
@Service
public class ActionService implements ActionServiceIntface {
	@Autowired
	private ActionMapper actionMapper;

	@Override
	public List<DeviceAction> queryAllDevicetion() {
		List<DeviceAction> deviceActionList = actionMapper.queryAllDevicetion();
		return deviceActionList;
	}
	
	public static void main(String[] args) {
		ApplicationContext ac = new ClassPathXmlApplicationContext("spring/spring-mvc.xml");
		ActionServiceIntface actionService = (ActionServiceIntface) ac.getBean("actionService");
		//System.out.println(actionService.queryAllDevicetion());
		//System.out.println(actionService.likeQueryDevice("%警报%"));
		//actionService.deleteDeviceAction(1234);
		SensorAction aSensorAction = new SensorAction(1113, "<", "23", "message", 1254, 1112);
		System.out.println(actionService.updateSensorAction(aSensorAction));
	}

	@Override
	public List<DeviceAction> likeQueryDevice(String name) {
		List<DeviceAction> deviceActionList = actionMapper.likeQueryDevice(name);
		return deviceActionList;
	}

	@Override
	public boolean deleteDeviceAction(int deviceId) {
		int a = actionMapper.deleteDeviceAction(deviceId);
		if(a > 0){
			return true;
		}
		return false;
	}

	@Override
	public boolean insertDeviceAction(DeviceAction deviceAction) {
		int a = actionMapper.insertDeviceAction(deviceAction);
		if(a > 0){
			return true;
		}
		return false;
	}

	@Override
	public boolean updateSensorAction(SensorAction sensorAction) {
		int a = actionMapper.updateSensorAction(sensorAction);
		if(a > 0){
			return true;
		}
		return false;
	}

	@Override
	public boolean insertSensorAction(SensorAction sensorAction) {
		int a = actionMapper.insertSensorAction(sensorAction);
		if(a > 0){
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteSensorActionById(int sensorActionId) {
		int a = actionMapper.deleteSensorActionById(sensorActionId);
		if(a > 0){
			return true;
		}
		return false;
	}

	@Override
	public SensorAction querySensorActionById(int sensorActionId) {
		SensorAction s = actionMapper.querySensorActionById(sensorActionId);
		return s;
	}

	@Override
	public DeviceAction queryDeviceActionById(int actionId) {
		DeviceAction da = actionMapper.queryDeviceActionById(actionId);
		return da;
	}

	@Override
	public boolean updateActionById(DeviceAction deiAction) {
		int a = actionMapper.updateActionById(deiAction);
		if(a>0){
			return true;
		}
		return false;
	}
	
	
	
	
	
	
	
	
	
	

}
