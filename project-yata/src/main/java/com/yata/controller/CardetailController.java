package com.yata.controller;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.yata.service.CarService;
import com.yata.vo.CarVO;

@Controller // @Component + spring mvc 湲곕뒫 異붽�
public class CardetailController {
	
	@GetMapping(path = { "/cardetail" })
	public String carDetail(Model model) {
	
		
		return "cardetail/cardetail";
	}
	
}
