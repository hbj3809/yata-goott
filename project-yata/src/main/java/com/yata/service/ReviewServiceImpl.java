package com.yata.service;


import java.util.List;

import com.yata.mapper.ReviewMapper;
import com.yata.vo.CarVO;
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
	public List<ReviewVO> findReviewByUser_num(int user_num) {
		List<ReviewVO> reviews = reviewMapper.findReviewByUser_num(user_num);
		for (ReviewVO review : reviews) {
			CarVO car = reviewMapper.findCarByCar_num(review.getCar_num());
			review.setCar(car);
		}
		
		return reviews;
	}

}
