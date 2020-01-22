package com.yata.controller;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
	
	@GetMapping(path = { "/forgot-password"})
	public String showFindPasswordForm() {
		
		return "account/forgot-password";
	}
	
	//@PostMapping(path = { "/forgot-password"})
	@PostMapping(path = { "/email-confirm"})
	@ResponseBody
	public String confirmEmail(Model model, MemberVO member) {
		
		MemberVO member1 = memberService.findEmail(member);
		if (member1 == null) {	
			return "not available";
		}	
		else {
			return "available";	
		}
	}
	
	//@PostMapping(path = { "/forgot-password2"})
	@PostMapping(path = { "/phone-confirm"})
	@ResponseBody
	public String findPhone(Model model, MemberVO member) {
		
		MemberVO member2 = memberService.findPhone(member);
		if (member2 == null) {
			return "not available";
		} else {
			return "available";
		}
	}
	
	//@PostMapping(path = { "/forgot-password3"})
	@PostMapping(path = { "/change-passwd"})
	@ResponseBody
	public String updatePasswd(Model model, MemberVO member) {
				
		memberService.updatePasswd(member);		
		
		return "success";
	}
	
	@GetMapping(path = { "/register"})
	public String showRegisterForm(@RequestParam(required = false) String c1, @RequestParam(required = false) String c2, @RequestParam(required = false) String c3) {
				
		if( c1 == null || c2 == null || c3 ==null) {
			return "account/regAccpt";
		}
				
		return "account/register";
	}
	
	@PostMapping(path = { "/register" })
	public String register(@RequestParam("myfile") MultipartFile user_photo, HttpServletRequest req, MemberVO member) throws Exception {
		
		ServletContext application = req.getServletContext();
		String path = application.getRealPath("resources/file/user-profile-photo");
		String fileName = user_photo.getOriginalFilename();

		try {				
			File file = new File(path, fileName);
			user_photo.transferTo( file );
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		System.out.println("프로필 사진 : " + fileName);
		member.setUser_photo(fileName);
		
		memberService.registerMember(member);
		memberService.updatePoint(member);
		
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
	public String login(MemberVO member, HttpSession session, HttpServletRequest req, HttpServletResponse resp) {

		Cookie[] getCookies = req.getCookies();

		if (member == null) {

			return "redirect:/account/login";

		} else {
			
			MemberVO member2 = memberService.selectMemberByEmailAndPasswd(member);

			if (getCookies != null) {
				
								
				for (Cookie cookie : getCookies) {

					if (cookie.getName().equals("loginPoint")) {

						// 로그인 처리 -> session에 데이터 저장
						session.setAttribute("loginuser", member2);

						return "redirect:/";

					}

				}

			}

			Cookie cookie = new Cookie("loginPoint", "1");
			
			cookie.setMaxAge(60*60*24);
			int tPoint = member2.getPoint().getTotal_point() + 1000;
			int aPoint = member2.getPoint().getActive_point() + 1000;
			member2.getPoint().setTotal_point(tPoint);
			member2.getPoint().setActive_point(aPoint);
			memberService.updatePoint(member2);

			// 로그인 처리 -> session에 데이터 저장
			session.setAttribute("loginuser", member2);
			resp.addCookie(cookie);

			return "redirect:/";
		}
	}
	
	@GetMapping(path = { "/logout" })
	public String logout(HttpSession session) {
		
		session.removeAttribute("loginuser");
		
		return "redirect:/";
	}
	
	@PostMapping(path = { "/modify" })
	public String modify(HttpSession session,MemberVO member) {
		
		memberService.modifyMember(member);
		MemberVO member2 = memberService.selectMemberByEmailAndPasswd(member);
		
		if (member2 == null) {
		} else {
			// 로그인 처리 -> session에 데이터 저장
			session.setAttribute("loginuser", member2);			
		}
		return "mypage/mypage-main";
	}
	
}
