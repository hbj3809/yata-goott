package com.yata.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yata.service.ReserveService;
import com.yata.vo.ReserveVO;

@Controller // @Component + spring mvc 기능 추가
@RequestMapping(path = { "/res" })
public class ResController {
	
	@Autowired
	@Qualifier("reserveService")
	private ReserveService resService;

	@PostMapping(path = { "/" })
	public String home(ReserveVO res) {
		
		resService.addReserve(res);
		
		return "mypage/reservationlist";
	}
	
}
