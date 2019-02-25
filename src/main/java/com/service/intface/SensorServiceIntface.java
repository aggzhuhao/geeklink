package com.service.intface;

import java.util.List;

import com.entity.Device;
import com.entity.Sensor;
import com.entity.SensorAction;

public interface SensorServiceIntface {
	public List<Sensor> querySensorByDeviceId(int deviceId);

	public List<Sensor> likeQuerySensorByDeviceId(Device device);
	
	public Sensor querySensorBySensorId(int sensorId);
	
	public boolean updateSensorBySensorId(Sensor sensor);
	
	public boolean deleteSensorBySenSorId(Integer sensorId);
	
	public List<SensorAction> queryAllSensorAction(Integer sensorId);
	
	public boolean insertSensor(Sensor sensor);
}
