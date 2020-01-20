package com.yata.service;

import java.util.List;

import com.yata.vo.ReserveVO;

public interface ReserveService {

	ReserveVO findReserveByUser_num(int user_num);

	List<ReserveVO> findReserves();

}
