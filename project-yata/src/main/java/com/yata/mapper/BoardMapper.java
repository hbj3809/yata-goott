package com.yata.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.yata.vo.BoardVO;

@Mapper
public interface BoardMapper {

	void insertBoard(BoardVO board);

	List<BoardVO> showList();

	BoardVO selectBoardByBrd_num(int brd_num);

	void deleteBoard(int brd_num);

	void updateBoard(BoardVO board);

	
}
