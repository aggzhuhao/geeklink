package com.entity;

public class Sensor {
    private Integer sensorId;

    private String name;

    private String description;

    private String tag;

    private Byte type;

    private Byte status;

    private Integer deviceId;

    private String datapoint;

    private String apiAddress;

    private String address;

    
    
    public Sensor() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Sensor(Integer sensorId, String name, String description,
			String tag, Byte type, Byte status, Integer deviceId,
			String datapoint, String apiAddress, String address) {
		super();
		this.sensorId = sensorId;
		this.name = name;
		this.description = description;
		this.tag = tag;
		this.type = type;
		this.status = status;
		this.deviceId = deviceId;
		this.datapoint = datapoint;
		this.apiAddress = apiAddress;
		this.address = address;
	}

	public Integer getSensorId() {
        return sensorId;
    }

    public void setSensorId(Integer sensorId) {
        this.sensorId = sensorId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag == null ? null : tag.trim();
    }

    public Byte getType() {
        return type;
    }

    public void setType(Byte type) {
        this.type = type;
    }

    public Byte getStatus() {
        return status;
    }

    public void setStatus(Byte status) {
        this.status = status;
    }

    public Integer getDeviceId() {
        return deviceId;
    }

    public void setDeviceId(Integer deviceId) {
        this.deviceId = deviceId;
    }

    public String getDatapoint() {
        return datapoint;
    }

    public void setDatapoint(String datapoint) {
        this.datapoint = datapoint == null ? null : datapoint.trim();
    }

    public String getApiAddress() {
        return apiAddress;
    }

    public void setApiAddress(String apiAddress) {
        this.apiAddress = apiAddress == null ? null : apiAddress.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

	@Override
	public String toString() {
		return "Sensor [sensorId=" + sensorId + ", name=" + name
				+ ", description=" + description + ", tag=" + tag + ", type="
				+ type + ", status=" + status + ", deviceId=" + deviceId
				+ ", datapoint=" + datapoint + ", apiAddress=" + apiAddress
				+ ", address=" + address + "]";
	}
    
}