package com.yata.controller;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yata.service.MemberService;
import com.yata.vo.MemberVO;

@Controller // @Component + spring mvc 기능 추가
public class MypageController {
	
	@Autowired
	@Qualifier("memberService")
	private MemberService memberService;
	
	//@RequestMapping : 요청과 메서드를 매핑
	@RequestMapping(path = { "/mypage" }, method = RequestMethod.GET)
	public String mypage(Locale locale, Model model) {

		return "mypage/mypage-main";
	}
	
	//@RequestMapping : 요청과 메서드를 매핑
	@GetMapping(path = { "/point" })
	public String point(HttpSession session,MemberVO member) {
//		memberService.selectMemberByNumAndPasswd(member);
//		session.setAttribute("loginuser", member);
		return "mypage/mypage-point";
	}
	
	//@RequestMapping : 요청과 메서드를 매핑
	@RequestMapping(path = { "/qna" }, method = RequestMethod.GET)
	public String qna(Locale locale, Model model) {

		return "mypage/mypage-qna"; // viewname -> /WEB-INF/views/ + home + .jsp
	}
	//@RequestMapping : 요청과 메서드를 매핑
		@RequestMapping(path = { "/reservationlist" }, method = RequestMethod.GET)
		public String reservationlist(Locale locale, Model model) {

			return "mypage/mypage-reservationlist"; // viewname -> /WEB-INF/views/ + home + .jsp
	}
	//@RequestMapping : 요청과 메서드를 매핑
		@RequestMapping(path = { "/reviewlist" }, method = RequestMethod.GET)
		public String reviewlist(Locale locale, Model model) {

			return "mypage/mypage-reviewlist"; // viewname -> /WEB-INF/views/ + home + .jsp
	}
	//@RequestMapping : 요청과 메서드를 매핑
		@RequestMapping(path = { "/update" }, method = RequestMethod.GET)
		public String update(Locale locale, Model model) {
			
			return "mypage/mypage-update"; // viewname -> /WEB-INF/views/ + home + .jsp
	}
		
	//@RequestMapping : 요청과 메서드를 매핑
		@RequestMapping(path = { "/delete-user" }, method = RequestMethod.GET)
		public String showdeleteuser(Locale locale, Model model) {
					
			return "mypage/delete-user"; // viewname -> /WEB-INF/views/ + home + .jsp
	}
	//@RequestMapping : 요청과 메서드를 매핑
		@GetMapping(path = { "/delete-user-form" })
		public String showdeleteuserform(MemberVO member, Model model) {
						
			return "mypage/delete-user-form"; // viewname -> /WEB-INF/views/ + home + .jsp
	}
	//@RequestMapping : 요청과 메서드를 매핑
		@PostMapping(path = { "/delete-user-form" })
		public String deleteuser(MemberVO member,HttpSession session) {
			MemberVO member2 = memberService.selectMemberByEmailAndPasswd(member);
			if (member2 == null) {
			} else {
			memberService.deleteUser(member);
			session.removeAttribute("loginuser");
			}
			return "redirect:/"; // viewname -> /WEB-INF/views/ + home + .jsp
	}
}
