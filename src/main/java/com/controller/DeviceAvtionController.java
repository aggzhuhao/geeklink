package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.entity.DeviceAction;
import com.entity.Sensor;
import com.entity.SensorAction;
import com.service.intface.ActionServiceIntface;
import com.service.intface.DeviceServiceIntface;
@Controller
public class DeviceAvtionController {

	@Autowired
	private DeviceServiceIntface deviceService;

	@Autowired
	private ActionServiceIntface actionService;
	@RequestMapping("/toAction")
	public String toAction(){
		return "action";
	}
	
	@RequestMapping("/queryAllDeviceAction")
	public String queryAllDeviceAction(HttpSession session){
		List<DeviceAction> deviceActionList = actionService.queryAllDevicetion();
		session.setAttribute("deviceActionList", deviceActionList);
		return "redirect:/toAction";
	}
	@RequestMapping("/likeQueryDeviceAction")
	@ResponseBody
	public Map<String, Object> likeQueryDeviceAction(@RequestParam(value="name")String name1){
		Map<String, Object> deviceActionMap = new HashMap<String, Object>();
		String name = "%"+name1+"%"; 
		List<DeviceAction> deviceActionList = actionService.likeQueryDevice(name);
		deviceActionMap.put("deviceActionList", deviceActionList);
		return deviceActionMap;
	}
	@RequestMapping("/tonewAction")
	public String tonewAction(){
	
		
		
		
		return "new_action";
	}
	
	
	
	
	@RequestMapping("/deleteDeviceAction")
	public void deleteDeviceAction(@RequestParam(value="deleteDeviceAction")String deleteDeviceAction,HttpServletResponse response) throws IOException{
		PrintWriter out = response.getWriter();
		System.out.println(deleteDeviceAction+"---------------==-=-");
		if(deleteDeviceAction !=null &&  !"".equals(deleteDeviceAction)){
			int deviceId = Integer.parseInt(deleteDeviceAction.trim());
			boolean b = actionService.deleteDeviceAction(deviceId);
			out.print(b);
			out.flush();
			out.close();
		}
		
	}
	
	@RequestMapping("/addnewAction")
	public String addnewAction(DeviceAction deviceAction){
		boolean b = actionService.insertDeviceAction(deviceAction);
		System.out.println(b);
		return "redirect:/queryAllDeviceAction";
	}
	@RequestMapping("/editAction/{actionId}")
	public String editAction(@PathVariable(value="actionId")String actionId,RedirectAttributes attr){
		if(actionId !=null && !"".equals(actionId)){
			int a = Integer.parseInt(actionId.trim());
			System.out.println(a+":-=-=-=-==-=-=-");
			DeviceAction da = actionService.queryDeviceActionById(a);
			System.out.println(da+"da");
			attr.addAttribute("actionId", a);
			attr.addFlashAttribute("deviceation",da);
			//System.out.println(da+"da");
			return "redirect:/toeditAction";
		}
		return "redirect:/toeditAction";
	}
	@RequestMapping("/toeditAction")
	public String toeditAction(@RequestParam(value="actionId")Integer actionId,@ModelAttribute("devicetion")DeviceAction da){
		//System.out.println(actionId+":::::::::::");
		//System.out.println("da:::"+da);
		
		return "edit_action";
	}
	
	@RequestMapping("/updateAction")
	public String updateAction(DeviceAction deviceAction){
		boolean b = actionService.updateActionById(deviceAction);
		System.out.println(b);
		return "redirect:/queryAllDeviceAction";
	}
	
	
	@RequestMapping("updateSensorActionById")
	@ResponseBody
	public Map updateSensorActionById(@RequestParam(value="sensorActionId",required=false)Integer sensorActionId,@RequestParam(value="sensorId",required=false)Integer sensorId,  @RequestParam(value="triggerOption")String triggerOption,
			@RequestParam(value="triggerValue")String triggerValue,@RequestParam(value="message")String message,@RequestParam(value="actionId")Integer actionId) throws IOException{

		SensorAction sensorAction = new SensorAction(sensorActionId, triggerOption, triggerValue, message, actionId, sensorId);
		System.out.println("::::::::::updateSensorActionByIdupdateSensorActionById:::::::::::::::::::::::::::::::;");
		System.out.println(sensorAction);
		boolean b = actionService.updateSensorAction(sensorAction);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result",b);
		System.out.println(resultMap);
		return resultMap;
		
	}
	
	@RequestMapping("insertSensorAction")
	@ResponseBody
	public Map insertSensorAction(@RequestParam(value="sensorActionId",required=false)Integer sensorActionId,@RequestParam(value="sensorId",required=false)Integer sensorId,  @RequestParam(value="triggerOption")String triggerOption,
			@RequestParam(value="triggerValue")String triggerValue,@RequestParam(value="message")String message,@RequestParam(value="actionId")Integer actionId) throws IOException{
		//PrintWriter out = response.getWriter();
		SensorAction sensorAction = new SensorAction(sensorActionId, triggerOption, triggerValue, message, actionId, sensorId);
		System.out.println("::::::::::insertSensorActioninsertSensorAction:::::::::::::::::::::::::::::::;");
		System.out.println(sensorAction);
		boolean b = actionService.insertSensorAction(sensorAction);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result",b);
		System.out.println(resultMap);
		return resultMap;
		
	}
	
	@RequestMapping("/deleteSensorActionById")
	@ResponseBody
	public Map deleteSensorActionById(@RequestParam(value="sensorActionId",required=false)Integer sensorActionId) throws IOException{
		System.out.println("deletekaiqi-------------------");
		//PrintWriter out = response.getWriter();
		boolean b = actionService.deleteSensorActionById(sensorActionId);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result",b);
		System.out.println(resultMap);
		return resultMap;
		
		
	}
	
	@RequestMapping("/queryOneSensorActionById")
	@ResponseBody
	public Map queryOneSensorActionById(@RequestParam(value="sensorActionId",required=false)Integer sensorActionId){
		System.out.println(sensorActionId);
		if(sensorActionId == null){
			sensorActionId = -1;
		}
		SensorAction sensorAction = actionService.querySensorActionById(sensorActionId);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("sensorAction",sensorAction);
		System.out.println(sensorAction);
		System.out.println(resultMap);
		return resultMap;
	}
	
}
