package com.entity;

public class SensorAction {
    private Integer sensorActionId;

    private String triggerOption;

    private String triggerValue;

    private String message;

    private Integer actionId;

    private Integer sensorId;

	public Integer getSensorActionId() {
		return sensorActionId;
	}

	public void setSensorActionId(Integer sensorActionId) {
		this.sensorActionId = sensorActionId;
	}

	public String getTriggerOption() {
		return triggerOption;
	}

	public void setTriggerOption(String triggerOption) {
		this.triggerOption = triggerOption;
	}

	public String getTriggerValue() {
		return triggerValue;
	}

	public void setTriggerValue(String triggerValue) {
		this.triggerValue = triggerValue;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Integer getActionId() {
		return actionId;
	}

	public void setActionId(Integer actionId) {
		this.actionId = actionId;
	}

	public Integer getSensorId() {
		return sensorId;
	}

	public void setSensorId(Integer sensorId) {
		this.sensorId = sensorId;
	}

	@Override
	public String toString() {
		return "SensorAction [sensorActionId=" + sensorActionId
				+ ", triggerOption=" + triggerOption + ", triggerValue="
				+ triggerValue + ", message=" + message + ", actionId="
				+ actionId + ", sensorId=" + sensorId + "]";
	}

	

	public SensorAction(Integer sensorActionId, String triggerOption,
			String triggerValue, String message, Integer actionId,
			Integer sensorId) {
		super();
		this.sensorActionId = sensorActionId;
		this.triggerOption = triggerOption;
		this.triggerValue = triggerValue;
		this.message = message;
		this.actionId = actionId;
		this.sensorId = sensorId;
	}

	public SensorAction() {
		super();
		// TODO Auto-generated constructor stub
	}


    

	
    
  
    
}