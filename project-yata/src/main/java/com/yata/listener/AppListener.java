package com.yata.listener;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.DispatcherServlet;

import com.yata.service.CarService;
import com.yata.service.MemberService;
import com.yata.service.ReserveService;
import com.yata.vo.MemberVO;

@WebListener
public class AppListener implements ServletContextListener, HttpSessionListener {

	private MemberService memberService;
	private CarService carService;
	private ReserveService resService;

	// 웹 애플리케이션이 시작 될 때 호출되는 메서드
    public void contextInitialized(ServletContextEvent sce)  { 
    	
    	ServletContext sc =  sce.getServletContext();
    	
    	ApplicationContext appCtx = WebApplicationContextUtils.getWebApplicationContext(sce.getServletContext());
    	memberService = (MemberService)appCtx.getBean("memberService");
    	carService = (CarService)appCtx.getBean("carService");
    	resService = (ReserveService)appCtx.getBean("reserveService");

    	int user_cnt = memberService.countAllUsers();
    	int car_cnt = carService.countAllCars();
    	int res_cnt = resService.countAllReserves();
  	    	
    	sc.setAttribute("user_count", user_cnt);
    	sc.setAttribute("car_count", car_cnt);
    	sc.setAttribute("res_count", res_cnt);
    	
    	
    }

	
}
