package com.yata.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller // @Component + spring mvc 기능 추가
public class MypageController {
	
	//@RequestMapping : 요청과 메서드를 매핑
	@RequestMapping(path = { "/mypage" }, method = RequestMethod.GET)
	public String mypage(Locale locale, Model model) {

		return "mypage/mypage-main"; // viewname -> /WEB-INF/views/ + home + .jsp
	}
	
	//@RequestMapping : 요청과 메서드를 매핑
	@RequestMapping(path = { "/point" }, method = RequestMethod.GET)
	public String point(Locale locale, Model model) {

		return "mypage/mypage-point"; // viewname -> /WEB-INF/views/ + home + .jsp
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
}
