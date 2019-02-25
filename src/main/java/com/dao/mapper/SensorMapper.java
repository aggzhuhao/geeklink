package com.dao.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.entity.Device;
import com.entity.Sensor;
import com.entity.SensorAction;
import com.entity.User;

@Repository
public interface SensorMapper {
	
	public List<Sensor> querySensorByDeviceId(int deviceId);


	public List<Sensor> likeQuerySensorByDeviceId(Device device);

	
	public Sensor querySensorBySensorId(int sensorId);
	
	public int updateSensorBySensorId(Sensor sensor);
	
	public int deleteSensorBySenSorId(Integer sensorId);
	
	public List<SensorAction> queryAllSensorAction(Integer sensorId);

	public int insertSensor(Sensor sensor);

}
