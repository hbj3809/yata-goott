package com.yata.vo;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class CarVO {

	private int car_num;
	private String car_fuel;
	private String car_manual;
	private String car_content;
	private int car_price;
	private Date car_date;
	
	private CarTypeVO carType;
	private List<CarPhotoVO> carPhotos;
	
}
