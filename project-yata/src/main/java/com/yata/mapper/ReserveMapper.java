package com.yata.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.yata.vo.ReserveVO;
import com.yata.vo.ReturnVO;

@Mapper
public interface ReserveMapper {

	ReserveVO findReserveByUser_num(int user_num);

	List<ReserveVO> findReserves();
	
	void insertReserve(ReserveVO res);

	void returnCar(int res_num);

	int selectNotReturnHistory(int user_num);

	void returnCar2(int res_num);

	List<ReturnVO> selectReturnList();

	void updateResAccept(int res_num);

	int selectAllReserves();

}