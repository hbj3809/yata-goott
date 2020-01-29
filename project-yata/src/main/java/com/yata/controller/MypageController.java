package com.yata.controller;

import java.io.File;
import java.util.Locale;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.yata.service.MemberService;
import com.yata.service.ReserveService;
import com.yata.service.ReviewService;
import com.yata.vo.MemberVO;
import com.yata.vo.ReserveVO;
import com.yata.vo.ReviewVO;

@Controller // @Component + spring mvc 기능 추가
@RequestMapping(path = { "/mypage" })
public class MypageController {

	@Autowired
	@Qualifier("memberService")
	private MemberService memberService;

	@Autowired
	@Qualifier("reserveService")
	private ReserveService reserveService;

	@Autowired
	@Qualifier("reviewService")
	private ReviewService reviewService;
	
	@GetMapping(path = { "mypage-main" })
	public String mypage(Locale locale, Model model) {

		return "mypage/mypage-main";
	}

	@GetMapping(path = { "/point" })
	public String point(HttpSession session, MemberVO member) {
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
	public String reviewlist(Model model, int user_num) {
		
	ReviewVO review = reviewService.findReviewByUser_num(user_num);	
	System.out.printf("d%-d%-d$\n",review.getRev_num(),review.getUser_num(),review.getCar_num());
	if (review == null) {
		return "mypage/mypage-main";
	}
		model.addAttribute("review", review);			
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
	public String deleteuser(MemberVO member, HttpSession session) {
		MemberVO member2 = memberService.selectMemberByEmailAndPasswd(member);
		if (member2 == null) {
		} else {
			memberService.deleteUser(member);
			session.removeAttribute("loginuser");
		}
		return "redirect:/";
	}

	@GetMapping(path = { "/return_car" })
	public String returnCar(@RequestParam("resNum") int res_num, @RequestParam("userNum") int user_num) {

		reserveService.returnCar(res_num);

		return "redirect:/mypage/reservationlist?user_num=" + user_num;
	}

	@GetMapping(path = { "/review-write" }) // res_num 받아오면 그때 작업
	public String showReviewWriteForm(
			@RequestParam("resNum")int res_num, @RequestParam("userNum")int user_num, @RequestParam("carNum")int car_num,
			Model model) { // 글쓰기 화면 보기
		model.addAttribute("user_num", user_num);
		model.addAttribute("car_num", car_num);
		model.addAttribute("res_num", res_num);
		return "mypage/mypage-reviewwrite";
	}
	
	@PostMapping(path = { "/review-write" })
	public String showReviewWriteForm(@RequestParam("rev_photo2") MultipartFile rev_photo,ReviewVO review,HttpServletRequest req) throws Exception{ // 글쓰기 화면 보기
	
	ServletContext application = req.getServletContext();
	String path = application.getRealPath("resources/file/review-photo");
	String fileName = rev_photo.getOriginalFilename();
	
	try {				
		File file = new File(path, fileName);
		rev_photo.transferTo( file );
	} catch (Exception ex) {
		ex.printStackTrace();
	}
	System.out.println("후기 사진 : " + fileName);
	review.setRev_photo(fileName);
	
	reviewService.writeReview(review);
		
	if (review == null) {
		return "mypage/mypage-main";
	} else {
		return "mypage/mypage-reviewlist";
	}
	
	}
	
	@GetMapping(path = { "/review-detail" })
	public String reviewDetail(MemberVO member, Model model) {
						
		return "mypage/mypage-reviewdetail";
	}
}
