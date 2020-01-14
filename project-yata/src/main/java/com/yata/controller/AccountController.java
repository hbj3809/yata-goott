package com.yata.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yata.service.MemberService;
import com.yata.vo.MemberVO;

@Controller // @Component + spring mvc 기능 추가
@RequestMapping(path = { "/account/" })
public class AccountController {
	
	@Autowired
	@Qualifier("memberService")
	private MemberService memberService;
	
	@GetMapping(path = { "/regAccpt"})
	public String showRegAccptForm() {
		return "account/regAccpt";
	}
	
	
	@GetMapping(path = { "/register"})
	public String showRegisterForm() {
		return "account/register";
	}
	
	@GetMapping(path = { "/forgot-password"})
	public String showFindPasswordForm() {
		return "account/forgot-password";
	}
	
	@PostMapping(path = { "/register" })
	public String register(MemberVO member) throws Exception {
		
		memberService.registerMember(member);
		
		return "redirect:/account/login";
	}
	
	
	@PostMapping(path = { "/approval_member" })
	public void approval_member(@ModelAttribute MemberVO member, HttpServletResponse resp, HttpSession session) throws Exception {
		
		memberService.approval_member(member, resp);
		session.removeAttribute("loginuser");
		
	}
	
	@GetMapping(path = { "/login"})
	public String showLoginForm() {
		return "account/login";
	}
	
	
	@PostMapping(path = { "/login" })
	public String login(MemberVO member, HttpSession session) {
				
		MemberVO member2 = memberService.findMemberByEmailAndPasswd(member);
		if (member2 == null) {
			
			return "redirect:/account/login";
		} else {
			// 로그인 처리 -> session에 데이터 저장
			session.setAttribute("loginuser", member2);
			
			return "redirect:/";
		}
	}
	
	@GetMapping(path = { "/logout" })
	public String logout(HttpSession session) {
		
		session.removeAttribute("loginuser");
		
		return "redirect:/";
	}
}
