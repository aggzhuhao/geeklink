package com.entity;

import java.math.BigDecimal;
import java.util.List;

public class Device {
    private Integer deviceId;

    private Byte availability;

    private String description;

    private String address;

    private String apiAddress;

    private String name;

    private String tags;

    private String location;

    private String placement;

    private BigDecimal longitude;

    private BigDecimal latitude;

    private Integer userId;

    private List<Sensor> sensorList;

	public Integer getDeviceId() {
		return deviceId;
	}

	public void setDeviceId(Integer deviceId) {
		this.deviceId = deviceId;
	}

	public Byte getAvailability() {
		return availability;
	}

	public void setAvailability(Byte availability) {
		this.availability = availability;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getApiAddress() {
		return apiAddress;
	}

	public void setApiAddress(String apiAddress) {
		this.apiAddress = apiAddress;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTags() {
		return tags;
	}

	public void setTags(String tags) {
		this.tags = tags;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getPlacement() {
		return placement;
	}

	public void setPlacement(String placement) {
		this.placement = placement;
	}

	public BigDecimal getLongitude() {
		return longitude;
	}

	public void setLongitude(BigDecimal longitude) {
		this.longitude = longitude;
	}

	public BigDecimal getLatitude() {
		return latitude;
	}

	public void setLatitude(BigDecimal latitude) {
		this.latitude = latitude;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public List<Sensor> getSensorList() {
		return sensorList;
	}

	public void setSensorList(List<Sensor> sensorList) {
		this.sensorList = sensorList;
	}

	@Override
	public String toString() {
		return "Device [deviceId=" + deviceId + ", availability="
				+ availability + ", description=" + description + ", address="
				+ address + ", apiAddress=" + apiAddress + ", name=" + name
				+ ", tags=" + tags + ", location=" + location + ", placement="
				+ placement + ", longitude=" + longitude + ", latitude="
				+ latitude + ", userId=" + userId + ", sensorList="
				+ sensorList + "]";
	}


    
}