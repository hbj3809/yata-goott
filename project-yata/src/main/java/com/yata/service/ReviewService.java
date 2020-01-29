package com.yata.service;

import com.yata.vo.ReviewVO;

public interface ReviewService {
	
	void writeReview(ReviewVO review);

	ReviewVO findReviewByUser_num(int user_num);

}
