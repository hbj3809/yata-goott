package com.yata.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.yata.vo.ReviewVO;

@Mapper
public interface ReviewMapper {

	void writeReview(ReviewVO review);

	ReviewVO findReviewByUser_num(int user_num);

	int selectAllReviews();

}