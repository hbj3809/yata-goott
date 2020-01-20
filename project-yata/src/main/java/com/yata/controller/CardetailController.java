package com.yata.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.yata.service.CarService;
import com.yata.vo.CarVO;

@Controller // @Component + spring mvc 湲곕뒫 異붽�
public class CardetailController {
	
	@Autowired
	@Qualifier("carService")
	private CarService carService;
	
	@GetMapping(path = { "/cardetail" })
	public String carDetail(Model model, int car_num) {
		
		CarVO car = carService.findCarNum(car_num);

		model.addAttribute("car", car);		
		return "cardetail/cardetail";
		
		
		
		
		
		
	}
	
}
