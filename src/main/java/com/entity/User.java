package com.entity;

public class User {
    public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	private Integer userId;

    private String name;

    private String password;

    private String email;

    private String description;

    private String apiKey;

    private Byte activationStatus;

    private String avatar;

    private Byte role;

    public User(Integer userId, String name, String password, String email,
			String description, String apiKey, Byte activationStatus,
			String avatar, Byte role) {
		super();
		this.userId = userId;
		this.name = name;
		this.password = password;
		this.email = email;
		this.description = description;
		this.apiKey = apiKey;
		this.activationStatus = activationStatus;
		this.avatar = avatar;
		this.role = role;
	}

	public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public String getApiKey() {
        return apiKey;
    }

    public void setApiKey(String apiKey) {
        this.apiKey = apiKey == null ? null : apiKey.trim();
    }

    public Byte getActivationStatus() {
        return activationStatus;
    }

    public void setActivationStatus(Byte activationStatus) {
        this.activationStatus = activationStatus;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar == null ? null : avatar.trim();
    }

    public Byte getRole() {
        return role;
    }

    public void setRole(Byte role) {
        this.role = role;
    }

	@Override
	public String toString() {
		return "User [userId=" + userId + ", name=" + name + ", password="
				+ password + ", email=" + email + ", description="
				+ description + ", apiKey=" + apiKey + ", activationStatus="
				+ activationStatus + ", avatar=" + avatar + ", role=" + role
				+ "]";
	}
    
}