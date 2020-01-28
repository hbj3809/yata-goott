package com.yata.service;


import java.util.List;

import com.yata.mapper.MemberMapper;
import com.yata.mapper.ReserveMapper;
import com.yata.vo.ReserveVO;
import com.yata.vo.ReturnVO;

import lombok.Setter;

public class ReserveServiceImpl implements ReserveService {
//	<!-- 1.13 수정  -->
	@Setter
	private ReserveMapper reserveMapper;
	@Setter
	private MemberMapper memberMapper;

	@Override
	public ReserveVO findReserveByUser_num(int user_num) {
		
		return reserveMapper.findReserveByUser_num(user_num);
	}

	@Override
	public List<ReserveVO> findReserves() {
		return reserveMapper.findReserves();
	}

	@Override
	public void addReserve(ReserveVO res, int res_point) {
		
		reserveMapper.insertReserve(res);
		memberMapper.updateActivePoint(res.getUser_num(), res_point);
		
	}

	@Override
	public void returnCar(int res_num) {
		reserveMapper.returnCar(res_num);
		reserveMapper.returnCar2(res_num);
		
	}

	@Override
	public int searchNotReturnMemberByUserNum(int user_num) {
		return reserveMapper.selectNotReturnHistory(user_num);
		
	}

	@Override
	public List<ReturnVO> findReturnList() {

		return reserveMapper.selectReturnList();
	}

	@Override
	public void setReturnAccept(int res_num) {
		reserveMapper.updateResAccept(res_num);
		
	}

}
