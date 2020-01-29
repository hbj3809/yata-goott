package com.yata.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewVO {
	
	private int rev_num;
	private int user_num;
	private int car_num;
	private int res_num;
	private String rev_title;
	private String rev_writer;
	private Date rev_regDate;
	private String rev_content;
	private int rev_grade;
	private String rev_photo;
	private boolean rev_del;
	private boolean rev_cancel;
	
}