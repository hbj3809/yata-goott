package com.yata.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.yata.vo.MemberVO;

//public class AuthIntercepter implements HandlerInterceptor {
public class AuthIntercepter extends HandlerInterceptorAdapter {
	
	// Controller 실행 (호출) 전에 호출
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		String uri = request.getRequestURI();
		// System.out.println("in interceptor : " + request.getRequestURI());
		HttpSession session = request.getSession();
	
		if(uri.contains("/admin/") || uri.contains("/mypage/")) {
			if (session.getAttribute("loginuser") == null) {
				response.sendRedirect("/project-yata/account/login");
				return false; // Controller 로 요청을 넘기지 마세요, 
			}
		}
		// return HandlerInterceptor.super.preHandle(request, response, handler);
		return true; // true는 전달하세요
	}
	// Controller 실행 (호출) 후에 호출	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

		// HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}
	// 요청 처리 후(View 처리 후)에 호출
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {

		// HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
	}
	
}
