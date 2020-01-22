package com.yata.service;

import java.util.List;

import com.yata.mapper.BoardMapper;
import com.yata.vo.BoardVO;

import lombok.Setter;

public class BoardServiceImpl implements BoardService {

	@Setter
	private BoardMapper boardMapper;
	
	@Override
	public int writeBoard(BoardVO board) {
		
		boardMapper.insertBoard(board);
		return board.getBrd_num();
		
	}

	@Override
	public List<BoardVO> showList() {
		
		return boardMapper.showList();
		
	}

	@Override
	public BoardVO findBoardByBrd_num(int brd_num) {


		return boardMapper.selectBoardByBrd_num(brd_num);
	}

	@Override
	public void deleteBoard(int brd_num) {
		
		boardMapper.deleteBoard(brd_num);
		
		
	}

	@Override
	public void updateBoard(BoardVO board) {


		boardMapper.updateBoard(board);
		
	}
		


}
