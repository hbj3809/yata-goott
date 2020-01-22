package com.yata.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.yata.vo.BoardVO;

@Mapper
public interface BoardMapper {

	void insertBoard(BoardVO board);

}
