package com.yata.service;

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

}
