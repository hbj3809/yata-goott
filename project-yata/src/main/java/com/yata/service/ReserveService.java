package com.yata.service;

import java.util.List;

import com.yata.vo.ReserveVO;
import com.yata.vo.ReturnVO;

public interface ReserveService {

	ReserveVO findReserveByUser_num(int user_num);

	List<ReserveVO> findReserves();
	
	void addReserve(ReserveVO res, int res_point);

	void returnCar(int res_num);

	int searchNotReturnMemberByUserNum(int user_num);

	List<ReturnVO> findReturnList();

	void setReturnAccept(int res_num);

	int countAllReserves();

	

}
