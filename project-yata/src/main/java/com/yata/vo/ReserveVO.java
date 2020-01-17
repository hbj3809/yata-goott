package com.yata.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ReserveVO {
	
	private int res_num;
	private int user_num;	
	private int car_num;
	private String res_term;
	private int res_price;
	private Date res_date;	
	private boolean res_cancel;
	private MemberVO member;
	private CarVO car;
}



