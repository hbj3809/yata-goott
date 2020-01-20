package com.yata.service;

import java.util.List;

import com.yata.vo.CarPhotoVO;
import com.yata.vo.CarTypeVO;
import com.yata.vo.CarVO;

public interface CarService {

	void registerCar(CarVO car, List<CarPhotoVO> carPhotos, CarTypeVO carType);

	List<CarVO> findCar();

	void deleteCar(int car_num);

	CarVO findCarNum(int car_num);

}
