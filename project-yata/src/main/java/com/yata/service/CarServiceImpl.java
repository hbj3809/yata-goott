package com.yata.service;

import java.util.List;

import com.yata.mapper.CarMapper;
import com.yata.vo.CarPhotoVO;
import com.yata.vo.CarTypeVO;
import com.yata.vo.CarVO;

import lombok.Setter;

public class CarServiceImpl implements CarService {
	
	@Setter
	private CarMapper carMapper;

	@Override
	public void registerCar(CarVO car, List<CarPhotoVO> carPhotos, CarTypeVO carType) {

		carMapper.insertCar(car);
		int newNum = car.getCar_num();
		
		for (CarPhotoVO carPhoto : carPhotos) {
			carPhoto.setCar_num(newNum);
			carMapper.insertCarPhoto(carPhoto);
		}
		
		carType.setCar_num(newNum);
		carMapper.insertCarType(carType);
		
	}

	@Override
	public List<CarVO> findCar() {
		
		return carMapper.findCar();
	}

	@Override
	public void deleteCar(int car_num) {
		
		carMapper.deleteCar(car_num);
		
	}

	@Override
	public CarVO findCarNum(int car_num) {
		
		return carMapper.findCarNum(car_num);
	}


}
