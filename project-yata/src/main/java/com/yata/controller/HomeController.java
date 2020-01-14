package com.yata.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller // @Component + spring mvc 湲곕뒫 異붽�
public class HomeController {
	
	//@RequestMapping : �슂泥�怨� 硫붿꽌�뱶瑜� 留ㅽ븨
	@RequestMapping(path = { "/" }, method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		return "home";
	}
	
}
