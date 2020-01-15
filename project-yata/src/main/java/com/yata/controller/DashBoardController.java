package com.yata.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yata.service.MemberService;
import com.yata.vo.MemberVO;

@Controller
@RequestMapping(path = { "/admin" })
public class DashBoardController {
	
	@Autowired
	@Qualifier("memberService")
	private MemberService memberService;
	
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
	public String memberList(MemberVO member,Model model) {
		
		List<MemberVO> members = memberService.findMember(member);
		model.addAttribute("members", members);
		return "admin/member-list";
	}
}
