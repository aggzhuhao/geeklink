package com.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.entity.Device;
import com.entity.Sensor;
import com.entity.SensorAction;
import com.entity.User;
import com.service.SensorService;
import com.service.intface.DeviceServiceIntface;

@Controller
public class SensorController {
	@Autowired
	private SensorService sensorService;
	@Autowired
	private DeviceServiceIntface deviceService;
	
	@RequestMapping("/getSensorsList")
	@ResponseBody
	public Map getSensorsList(@RequestParam(value="deviceId")Integer deviceId,@RequestParam(value="currentpage")Integer currentpage,@RequestParam(value="pagesize")Integer pagesize,HttpSession session){
		if(currentpage != null){
				currentpage++;
			}else{
				currentpage=1;
			}
			System.out.println("getQuerydevicesListgetQuerydevicesListgetQuerydevicesList");
			//List<Device> deviceList = (List<Device>) session.getAttribute("likeQuerydeviceList");
			List<Sensor> sensorList = sensorService.querySensorByDeviceId(deviceId);
			List<Sensor> sensorList1 = new ArrayList<Sensor>();
			Map<String, Object> sensorMap = new HashMap<String, Object>();
			sensorMap.put("pageSize", pagesize);
			int count =0;
			for(Sensor d : sensorList){
				count++;
			}
		
			int begin = (currentpage - 1) * pagesize + 1;
			int end = currentpage * pagesize;
			int i = end - begin;
		
			
			
			if(end>count){
				for(int j = 0;j<=(count-begin);j++){
					sensorList1.add(sensorList.get(begin-1+j));
				}
			}else{
				for(int j = 0;j<=i;j++){
					sensorList1.add(sensorList.get(begin-1+j));
				}
			}
			sensorMap.put("totalSize", count);
			sensorMap.put("list", sensorList1);
		
			return sensorMap;
	}
	
	@RequestMapping("/likeQuerySensorsList")
	@ResponseBody
	public Map likeQuerySensorsList(@RequestParam(value="name",required=false)String name,@RequestParam(value="deviceId",required=false)Integer deviceId,HttpSession session){
		Map<String, Object> sensorMap = new HashMap<String, Object>();
		Device device = new Device();
		String name1 = "%"+name+"%";
		device.setName(name1);
		device.setDeviceId(deviceId);
		List<Sensor> sensorList = sensorService.likeQuerySensorByDeviceId(device);
		session.setAttribute("likeQuerySensorList", sensorList);
		sensorMap.put("list", sensorList);
		sensorMap.put("totalSize", sensorList.size());
		return sensorMap;
	}
	@RequestMapping("/likeQuerySensorsListpages")
	@ResponseBody
	public Map likeQuerySensorsListpages(@RequestParam(value="currentpage",required=false)Integer currentpage,@RequestParam(value="pagesize",required=false)Integer pagesize,HttpSession session){
		if(currentpage != null){
			currentpage++;
		}else{
			currentpage=1;
		}
		//System.out.println("getQuerydevicesListgetQuerydevicesListgetQuerydevicesList");
		List<Sensor> sensorList = (List<Sensor>) session.getAttribute("likeQuerySensorList");
		List<Sensor> sensorList1 = new ArrayList<Sensor>();
		Map<String, Object> sensorMap = new HashMap<String, Object>();
		sensorMap.put("pageSize", pagesize);
		int count =0;
		for(Sensor d : sensorList){
			count++;
		}
	
		int begin = (currentpage - 1) * pagesize + 1;
		int end = currentpage * pagesize;
		int i = end - begin;
	
		
		
		if(end>count){
			for(int j = 0;j<=(count-begin);j++){
				sensorList1.add(sensorList.get(begin-1+j));
			}
		}else{
			for(int j = 0;j<=i;j++){
				sensorList1.add(sensorList.get(begin-1+j));
			}
		}
		sensorMap.put("totalSize", count);
		sensorMap.put("list", sensorList1);
		//session.setAttribute("deviceList1", deviceList1);
		//System.out.println("----------------------------");
		//System.out.println(sensorList1.size());
		return sensorMap;
	
	}
	@RequestMapping("/toeditSensor/{sensorId}")
	public String toeditSensor(@PathVariable(value="sensorId")String sensorId,HttpSession session,RedirectAttributes atts){
		System.out.println("qidong---------------");
		if(sensorId != null && !"".equals(sensorId)){
			int sensorId1 = Integer.parseInt(sensorId.trim());
			Sensor sensor = sensorService.querySensorBySensorId(sensorId1);
			session.setAttribute("sensorId", sensor.getSensorId());
			atts.addFlashAttribute("sensor",sensor);
		}
			
		return "redirect:/goToeditSensor";
	}
	
	@RequestMapping("/deleteSensor")
	@ResponseBody
	public Map deleteSensor(@RequestParam(value="sensorId")Integer sensorId){
		boolean b = sensorService.deleteSensorBySenSorId(sensorId);
		Map<String, Object> sensorMap = new HashMap<String, Object>();
		sensorMap.put("key", b);
		return sensorMap;
	}
	
	@RequestMapping("/goToeditSensor")
	public String goToeditSensor(){

		return "edit_sensor";
	}
	
	@RequestMapping("/updateSensor")
	public String updateSensor(Sensor sensor){
		
		boolean b = sensorService.updateSensorBySensorId(sensor);
		if(b == true){
			return "redirect:/todevice";
		}
		return "redirect:/todevice";
	}
	
	@RequestMapping("/saveNewSensor")
	public String saveNewSensor(Sensor sensor,HttpSession session){
		Integer deviceId = (Integer) session.getAttribute("deviceDeviceId");
		sensor.setDeviceId(deviceId);
		sensor.setStatus((byte)1);
		System.out.println(sensor);
		boolean b = sensorService.insertSensor(sensor);
		
		//System.out.println(b);System.out.println(b);System.out.println(b);System.out.println(b);
		return "redirect:/todevice";
	}
	
	@RequestMapping("/queryAllSensorAction")
	@ResponseBody
	public Map queryAllSensorAction(@RequestParam(value="sensorId")Integer sensorId){
		Map<String, Object> sensorActionMap = new HashMap<String,Object>();
		List<SensorAction> sensorActionList = sensorService.queryAllSensorAction(sensorId);
		sensorActionMap.put("sensorActionList", sensorActionList);
		
		return sensorActionMap;
	}

	@RequestMapping("/tonewSensor/{deviceId}")
	public String tonewSensor(@PathVariable(value="deviceId")Integer deviceId,HttpSession session){
		//System.out.println(deviceId);System.out.println(deviceId);System.out.println(deviceId);System.out.println(deviceId);
		session.setAttribute("deviceDeviceId", deviceId);
		return "redirect:/newSensor";
	}
	
	@RequestMapping("/newSensor")
	public String newSensor(){
		return "new_sensor";
	}
}
