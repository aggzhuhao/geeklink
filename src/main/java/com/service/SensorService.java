package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.dao.mapper.SensorMapper;
import com.entity.Device;
import com.entity.Sensor;
import com.entity.SensorAction;
import com.service.intface.SensorServiceIntface;
@Service
public class SensorService implements SensorServiceIntface {

	@Autowired
	private SensorMapper sensorMapper;
	
	@Override
	public List<Sensor> querySensorByDeviceId(int deviceId) {
		
		List<Sensor> sensorList = sensorMapper.querySensorByDeviceId(deviceId);
		
		
		return sensorList;
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		ApplicationContext ac = new ClassPathXmlApplicationContext("spring/spring-mvc.xml");
		SensorServiceIntface s = (SensorServiceIntface) ac.getBean("sensorService");
		//System.out.println(s.querySensorByDeviceId(1002));
		Device device = new Device();
		device.setDeviceId(1002);
		device.setName("%器%");
		//System.out.println(s.likeQuerySensorByDeviceId(device));
		Sensor sensor = new Sensor();
		sensor.setSensorId(1111);
		sensor.setName("传感器");
		//System.out.println(s.updateSensorBySensorId(sensor));
		System.out.println(s.queryAllSensorAction(5735));
	}

	@Override
	public List<Sensor> likeQuerySensorByDeviceId(Device device) {
		List<Sensor> sensorList = sensorMapper.likeQuerySensorByDeviceId(device);	
		return sensorList;
	}

	@Override
	public Sensor querySensorBySensorId(int sensorId) {
		// TODO Auto-generated method stub
		Sensor sensor = sensorMapper.querySensorBySensorId(sensorId);
		return sensor;
	}

	@Override
	public boolean updateSensorBySensorId(Sensor sensor) {
		
		int a = sensorMapper.updateSensorBySensorId(sensor);
		if(a > 0){
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteSensorBySenSorId(Integer sensorId) {
		int a = sensorMapper.deleteSensorBySenSorId(sensorId);
		if(a > 0){
			return true;
		}
		return false;
	}

	@Override
	public List<SensorAction> queryAllSensorAction(Integer sensorId) {
		List<SensorAction> sensorActionList = sensorMapper.queryAllSensorAction(sensorId);
		
		return sensorActionList;
	}

	@Override
	public boolean insertSensor(Sensor sensor) {
		int a = sensorMapper.insertSensor(sensor);
		if(a > 0){
			return true;
		}
		return false;
	}

}
