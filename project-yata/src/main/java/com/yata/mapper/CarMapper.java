package com.yata.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.yata.vo.CarPhotoVO;
import com.yata.vo.CarTypeVO;
import com.yata.vo.CarVO;

@Mapper
public interface CarMapper {

	void insertCar(CarVO car);

	void insertCarPhoto(CarPhotoVO carPhoto);

	void insertCarType(CarTypeVO carType);

}