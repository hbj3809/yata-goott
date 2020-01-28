package com.yata.service;

import java.util.List;

import com.yata.vo.ReserveVO;

public interface ReserveService {

	ReserveVO findReserveByUser_num(int user_num);

	List<ReserveVO> findReserves();
	
	void addReserve(ReserveVO res, int res_point);

	void returnCar(int res_num);

	int searchNotReturnMemberByUserNum(int user_num);

	

}
