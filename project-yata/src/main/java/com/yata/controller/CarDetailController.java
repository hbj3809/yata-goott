package com.yata.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller // @Component + spring mvc 湲곕뒫 異붽�
@RequestMapping(path= {"/cardetail/"})
public class CarDetailController {
	

	@GetMapping("/cardetail.action")
	public String showCarBoard(Locale locale, Model model) {
		
			return("cardetail/cardetail");
	 
		}
	}
	

