package com.yata.vo;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {
	
	private int user_num;
	private String user_photo;
	private String user_email;
	private String user_passwd;
	private String user_Name;
	private String user_birth;
	private String user_phone;
	private String user_postcode;
	private String user_addr;
	private String user_detailAddr;
	private String user_refAddr;	
	private Date user_regDate;
	private String user_type;
	private String user_driveNum;
	private int user_totalPoint;
	private int user_activePoint;
	private boolean user_active;
	private String user_key;
	
}
