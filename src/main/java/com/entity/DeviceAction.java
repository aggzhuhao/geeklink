package com.entity;

import java.util.List;

public class DeviceAction {
    private Integer actionId;

    private String name;

    private Byte type;

    private String typeValue;

    private Byte status;

	private List<SensorAction> sensorActionList;

	public Integer getActionId() {
		return actionId;
	}

	public void setActionId(Integer actionId) {
		this.actionId = actionId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Byte getType() {
		return type;
	}

	public void setType(Byte type) {
		this.type = type;
	}

	public String getTypeValue() {
		return typeValue;
	}

	public void setTypeValue(String typeValue) {
		this.typeValue = typeValue;
	}

	public Byte getStatus() {
		return status;
	}

	public void setStatus(Byte status) {
		this.status = status;
	}

	public List<SensorAction> getSensorActionList() {
		return sensorActionList;
	}

	public void setSensorActionList(List<SensorAction> sensorActionList) {
		this.sensorActionList = sensorActionList;
	}

	@Override
	public String toString() {
		return "DeviceAction [actionId=" + actionId + ", name=" + name
				+ ", type=" + type + ", typeValue=" + typeValue + ", status="
				+ status + ", sensorActionList=" + sensorActionList + "]";
	}
	
	
    
    
}