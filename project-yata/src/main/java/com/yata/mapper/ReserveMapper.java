package com.yata.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.yata.vo.ReserveVO;

@Mapper
public interface ReserveMapper {

	ReserveVO findReserveByUser_num(int user_num);

	List<ReserveVO> findReserves();
	
	void insertReserve(ReserveVO res);

	void returnCar(int res_num);

	int selectNotReturnHistory(int user_num);

}