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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yata.vo.BoardVO;
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
	public String reviewlist(
			@RequestParam(defaultValue = "1") int pageNo,
			//RequestParam(required=false) : 요청 데이터가 없으면 null로 설정
			@RequestParam(required = false) String searchType,
			@RequestParam(required = false) String searchKey,
			HttpServletRequest req,
			Model model) { // 목록보기
		
//		int pageSize = 3;
//		int pagerSize = 3;
//		HashMap<String, Object> params = new HashMap<>();
//		int beginning = (pageNo - 1) * pageSize + 1;
//		params.put("beginning", beginning);
//		params.put("end", beginning + pageSize);
//		params.put("searchType", searchType);
//		params.put("searchKey", searchKey);
//				
//		//데이터 조회 (서비스에 요청)
//		List<BoardVO> boards = boardService.findBoardWithPaging(params);
//		int boardCount = boardService.findBoardCount(params);//전체 글 개수
		
//		ThePager pager = 
//			new ThePager(boardCount, pageNo, pageSize, pagerSize, 
//						 "list.action");

//		// 진또배기
//		ThePager2 pager = 
//			new ThePager2(boardCount, pageNo, pageSize, pagerSize, 
//						  "list.action", req.getQueryString());
//		
//		//Model 타입 전달인자에 데이터 저장 -> View로 전달
//		//(실제로는 Request 객체에 데이터 저장)
//		model.addAttribute("boards", boards);
//		model.addAttribute("pager", pager);
		
		return "board/review-list"; // /WEB-INF/views/ + board/list + .jsp
	}
	
//	@GetMapping(path = { "/detail.action" })
//	public String showDetail(
//			int bno, @RequestParam(defaultValue = "1")int pageNo, 
//			Model model, 
//			HttpServletRequest req, HttpServletResponse resp) {		
//		//1-1. bno를 사용해서 게시물 조회
//		BoardVO board = boardService.findBoardByBno(bno);
//		if (board == null) {
//			return "redirect:list.action";
//		}
//		
//		//1-2. 기존에 읽은 글번호 목록을 Cookie에서 읽기
//		String bnoRead = "";
//		Cookie[] cookies = req.getCookies();
//		for (Cookie cookie : cookies) {
//			if (cookie.getName().equals("bno_read")) {
//				bnoRead = cookie.getValue();
//			}
//		}
//		
//		//1-2. bno가 기존에 읽은 글 번호 목록에 없다면 조회 수 증가
//		if (!bnoRead.contains(String.format("|%d|", bno))) {			
//			boardService.increaseReadCount(bno);		
//			board.setReadCount(board.getReadCount() + 1);
//			
//			//1-3. 같은 사용자(브라우저)의 조회수 증가를 막기 위해 Cookie에 데이터 저장		 
//			Cookie newCookie = 
//				new Cookie("bno_read", String.format("%s|%d|", bnoRead, bno));
//			resp.addCookie(newCookie);
//		}
//		
//		//2. 조회된 데이터를 View에서 사용할 수 있도록 저장
//		model.addAttribute("board", board);
//		
//		//3. View로 이동
//		return "board/detail";
//	}

	@GetMapping(path = { "/free-list" })
	public String freelist(
			@RequestParam(defaultValue = "1") int pageNo,
			//RequestParam(required=false) : 요청 데이터가 없으면 null로 설정
			@RequestParam(required = false) String searchType,
			@RequestParam(required = false) String searchKey,
			HttpServletRequest req,
			Model model) { // 목록보기
		

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
	

}





























