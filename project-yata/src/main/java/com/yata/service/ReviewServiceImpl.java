package com.yata.service;


import com.yata.mapper.ReviewMapper;
import com.yata.vo.ReviewVO;

import lombok.Setter;


public class ReviewServiceImpl implements ReviewService {

	@Setter
	private ReviewMapper reviewMapper;

	@Override
	public void writeReview(ReviewVO review) {
		reviewMapper.writeReview(review);
		
	}

	@Override
	public ReviewVO findReviewByUser_num(int user_num) {
		return reviewMapper.findReviewByUser_num(user_num);
	}

}
