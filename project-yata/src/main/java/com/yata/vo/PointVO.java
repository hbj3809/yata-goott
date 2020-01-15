package com.yata.vo;

import java.util.Date;

import lombok.Data;

@Data
public class PointVO {

	private int user_num;
	private String user_grade;
	private int active_point;
	private int total_point;
	private Date point_date;	
	
}
