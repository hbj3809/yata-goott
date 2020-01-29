package com.yata.controller;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yata.vo.BoardVO;
import com.yata.vo.ReviewVO;
import com.yata.service.BoardService;
import com.yata.service.CarService;
//import com.yata.service.BoardServiceImpl;
import com.yata.ui.ThePager;
import com.yata.ui.ThePager2;
//import com.yata.vo.BoardVO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(path = { "/board" })
@Log4j // lombok이 log 변수를 자동으로 생성
public class BoardController {

	@Autowired
	@Qualifier("boardService")
	private BoardService boardService;

	@GetMapping(path = { "/review-list" })
	public String reviewlist(Model model) { // 목록보기

		
		List<ReviewVO> review = boardService.reviewList();
		model.addAttribute("review", review);

		return "board/review-list"; 
	}
	
	@GetMapping(path= {"/review-detail"})
	public String reviewDetail(@RequestParam("revNum") int rev_num, Model model) {
				
		ReviewVO review = boardService.reviewDetail(rev_num);
		model.addAttribute("review", review);
		
		return "board/review-detail";
	}


	@GetMapping(path = { "/free-list" })
	public String freelist(Model model) { // 목록보기

		List<BoardVO> board = boardService.showList();
		model.addAttribute("board", board);

		return "board/free-list"; // /WEB-INF/views/ + board/list + .jsp
	}

	@GetMapping(path = { "/write.action" })
	public String showWriteForm() { // 글쓰기 화면 보기

		return "board/write";
	}

	@PostMapping(path = { "/write.action" })
	public String write(BoardVO board, RedirectAttributes attr) { // 글쓰기 처리

		int newBoardNo = boardService.writeBoard(board);

		// 2. 스프링의 기능을 사용해서 데이터 전달
		attr.addFlashAttribute("newbrd_num", newBoardNo); // session에 저장
		return "redirect:free-list.action";
	}

	@GetMapping(path = { "/detail" })
	public String showDetail(int brd_num, Model model, HttpServletRequest req, HttpServletResponse resp) {
		// 1-1. brd_num를 사용해서 게시물 조회
		BoardVO board = boardService.findBoardByBrd_num(brd_num);
		if (board == null) {
			return "redirect:free-list";
		}

		// 1-2. 기존에 읽은 글번호 목록을 Cookie에서 읽기
		String bnoRead = "";
		Cookie[] cookies = req.getCookies();
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals("brd_num_read")) {
				bnoRead = cookie.getValue();
			}
		}

		// 2. 조회된 데이터를 View에서 사용할 수 있도록 저장
		model.addAttribute("board", board);

		// 3. View로 이동
		return "board/free-detail";
	}
	
	@GetMapping(path = { "/delete.action" })
	public String delete(int brd_num) {
		
		boardService.deleteBoard(brd_num);
		
		return "redirect:free-list.action";
	}
	
	@GetMapping(path = { "/update.action" })
	public String showUpdateForm(int brd_num, Model model) {
		
		//1. bno를 사용해서 게시물 조회
		BoardVO board = boardService.findBoardByBrd_num(brd_num);
		if (board == null) {
			return "redirect:free-list.action";
		}
		
		//2. 조회된 데이터를 View에서 사용할 수 있도록 저장
		model.addAttribute("board", board);
		
		return "board/free-update";
	}
	
	@PostMapping(path = { "/update.action" })
	public String update(BoardVO board) {
			
		boardService.updateBoard(board);
		
		
		return "redirect:free-list.action";
	}
	

}
