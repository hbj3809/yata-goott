package com.yata.vo;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class BoardVO {

	private int brd_num;
	private String brd_title;
	private String brd_writer;
	private String brd_content;
	private Date brd_regDate;
	private int brd_readCount;
	private boolean brd_del;
	private int user_num;


	
}
