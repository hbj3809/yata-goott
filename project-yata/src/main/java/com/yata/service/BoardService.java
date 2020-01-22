package com.yata.service;

import java.util.HashMap;
import java.util.List;

import com.yata.vo.BoardVO;

public interface BoardService {

	int writeBoard(BoardVO board);

	List<BoardVO> showList();

	BoardVO findBoardByBrd_num(int brd_num);

	void deleteBoard(int brd_num);

	void updateBoard(BoardVO board);

}
