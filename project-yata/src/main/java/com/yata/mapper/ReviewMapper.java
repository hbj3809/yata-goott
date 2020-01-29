package com.yata.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.yata.vo.CarTypeVO;
import com.yata.vo.CarVO;
import com.yata.vo.ReviewVO;

@Mapper
public interface ReviewMapper {

	void writeReview(ReviewVO review);

	List<ReviewVO> findReviewByUser_num(int user_num);
	CarVO findCarByCar_num(int car_num);
	CarTypeVO findCarTypeByCar_num(int car_num);

}