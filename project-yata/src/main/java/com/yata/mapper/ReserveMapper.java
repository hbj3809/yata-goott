package com.yata.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.yata.vo.ReserveVO;

@Mapper
public interface ReserveMapper {

	ReserveVO findReserveByUser_num(int user_num);
	
}