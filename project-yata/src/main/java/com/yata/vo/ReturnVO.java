package com.yata.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ReturnVO {
	
	private int res_num;
	private boolean res_cancel;	
	private Date realtime;
	private boolean accept;
	private boolean revaccept;
	private int inner;	
	private int outer;
	
}



