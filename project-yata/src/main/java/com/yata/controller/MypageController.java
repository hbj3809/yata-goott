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
import org.springframework.web.bind.annotation.RequestParam;

import com.yata.service.MemberService;
import com.yata.service.ReserveService;
import com.yata.vo.MemberVO;
import com.yata.vo.ReserveVO;

@Controller // @Component + spring mvc 기능 추가
@RequestMapping(path = { "/mypage" })
public class MypageController {
	
	@Autowired
	@Qualifier("memberService")
	private MemberService memberService;
	
	@Autowired
	@Qualifier("reserveService")
	private ReserveService reserveService;
	
	@GetMapping(path = { "mypage-main" })
	public String mypage(Locale locale, Model model) {

		return "mypage/mypage-main";
	}
	
	@GetMapping(path = { "/point" })
	public String point(HttpSession session,MemberVO member) {
		return "mypage/mypage-point";
	}
	
	@GetMapping(path = { "/qna" })
	public String qna(Locale locale, Model model) {

		return "mypage/mypage-qna";
	}
	@GetMapping(path = { "/reservationlist" })
	public String reservationlist(Model model, int user_num) {
		ReserveVO reserve = reserveService.findReserveByUser_num(user_num);
		if (reserve == null) {
		return "mypage/mypage-reservationlist";
	}
		model.addAttribute("reserve", reserve);			
		return "mypage/mypage-reservationlist";
	}
		
	@GetMapping(path = { "/reviewlist" })
	public String reviewlist(Locale locale, Model model) {

		return "mypage/mypage-reviewlist";
	}
	
	@GetMapping(path = { "/update" })
	public String update(Locale locale, Model model) {
			
		return "mypage/mypage-update";
	}
		
	@GetMapping(path = { "/delete-user" })
	public String showdeleteuser(Locale locale, Model model) {
					
		return "mypage/delete-user";
	}
	
	@GetMapping(path = { "/delete-user-form" })
	public String showdeleteuserform(MemberVO member, Model model) {
						
		return "mypage/delete-user-form";
	}
	
	@PostMapping(path = { "/delete-user-form" })
		public String deleteuser(MemberVO member,HttpSession session) {
			MemberVO member2 = memberService.selectMemberByEmailAndPasswd(member);
			if (member2 == null) {
			} else {
			memberService.deleteUser(member);
			session.removeAttribute("loginuser");
			}	
			return "redirect:/";
	}
	
	@GetMapping(path = {"/return_car"})
		public String returnCar(@RequestParam("resNum") int res_num, @RequestParam("userNum") int user_num) {
		
		reserveService.returnCar(res_num);
		
		return "redirect:/mypage/reservationlist?user_num="+user_num;
	}
		
	
}
