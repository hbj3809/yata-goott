package com.yata.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(path = { "/admin" })
public class DashBoardController {

	@GetMapping(path = { "/dashboard" })
	public String adminPage() {
		
		return "admin/dashboard";
	}
	
	@GetMapping(path = { "/reg-car" })
	public String regCarPage() {
		
		return "admin/reg-car";
	}
	
	@GetMapping(path = { "/return-list" })
	public String returnList() {
		
		return "admin/return-list";
	}
	
	@GetMapping(path = { "/car-list" })
	public String carList() {
		
		return "admin/car-list";
	}
	
	@GetMapping(path = { "/member-list" })
	public String memberList() {
		
		return "admin/member-list";
	}
	
}
