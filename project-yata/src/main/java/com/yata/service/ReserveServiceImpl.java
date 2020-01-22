package com.yata.service;


import java.util.List;

import com.yata.mapper.ReserveMapper;
import com.yata.vo.ReserveVO;

import lombok.Setter;

public class ReserveServiceImpl implements ReserveService {
//	<!-- 1.13 수정  -->
	@Setter
	private ReserveMapper reserveMapper;

	@Override
	public ReserveVO findReserveByUser_num(int user_num) {
		
		return reserveMapper.findReserveByUser_num(user_num);
	}

	@Override
	public List<ReserveVO> findReserves() {
		return reserveMapper.findReserves();
	}

	@Override
	public void addReserve(ReserveVO res) {
		
		reserveMapper.insertReserve(res);
		
	}

	@Override
	public void returnCar(int res_num) {
		reserveMapper.returnCar(res_num);
		
	}

}
