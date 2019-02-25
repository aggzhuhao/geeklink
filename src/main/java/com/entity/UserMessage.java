package com.entity;

import java.util.Date;

public class UserMessage {
    private Integer msgId;

    private Integer receiverId;

    
    private User senderUser;

    private String type;

    private String msg;

    private Date sendTime;

    private String subject;

    private Byte readStatus;

    private long time;

	public Integer getMsgId() {
		return msgId;
	}

	public void setMsgId(Integer msgId) {
		this.msgId = msgId;
	}

	public Integer getReceiverId() {
		return receiverId;
	}

	public void setReceiverId(Integer receiverId) {
		this.receiverId = receiverId;
	}

	public User getSenderUser() {
		return senderUser;
	}

	public void setSenderUser(User senderUser) {
		this.senderUser = senderUser;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Date getSendTime() {
		return sendTime;
	}

	public void setSendTime(Date sendTime) {
		this.sendTime = sendTime;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public Byte getReadStatus() {
		return readStatus;
	}

	public void setReadStatus(Byte readStatus) {
		this.readStatus = readStatus;
	}

	public long getTime() {
		return time;
	}

	public void setTime(long time) {
		this.time = time;
	}

	public UserMessage(Integer msgId, Integer receiverId, User senderUser,
			String type, String msg, Date sendTime, String subject,
			Byte readStatus, long time) {
		super();
		this.msgId = msgId;
		this.receiverId = receiverId;
		this.senderUser = senderUser;
		this.type = type;
		this.msg = msg;
		this.sendTime = sendTime;
		this.subject = subject;
		this.readStatus = readStatus;
		this.time = time;
	}

	public UserMessage() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "UserMessage [msgId=" + msgId + ", receiverId=" + receiverId
				+ ", senderUser=" + senderUser + ", type=" + type + ", msg="
				+ msg + ", sendTime=" + sendTime + ", subject=" + subject
				+ ", readStatus=" + readStatus + ", time=" + time + "]";
	}
    
	
	
    
    
}