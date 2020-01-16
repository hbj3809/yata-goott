package com.yata.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.yata.service.CarService;
import com.yata.service.MemberService;
import com.yata.vo.CarPhotoVO;
import com.yata.vo.CarTypeVO;
import com.yata.vo.CarVO;
import com.yata.vo.MemberVO;
import com.yata.vo.PointVO;

@Controller
@RequestMapping(path = { "/admin" })
public class DashBoardController {
	
	@Autowired
	@Qualifier("memberService")
	private MemberService memberService;
	
	@Autowired
	@Qualifier("carService")
	private CarService carService;

	@GetMapping(path = { "/dashboard" })
	public String adminPage() {
		
		return "admin/dashboard";
	}
	
	@GetMapping(path = { "/reg-car" })
	public String regCarPage() {
		
		return "admin/reg-car";
	}
	
	@PostMapping(path = { "/reg-car" })
	public String regCar(@RequestParam("car_picture") MultipartFile[] pics, @RequestParam("car_manualx") MultipartFile manual, HttpServletRequest req, CarVO car, CarTypeVO carType) {
		
		ArrayList<CarPhotoVO> carPhotos = new ArrayList<CarPhotoVO>();
		
		ServletContext application = req.getServletContext();
		String path = application.getRealPath("resources/file/carPic");
		
		for(MultipartFile pic : pics) {
			CarPhotoVO carPhoto = new CarPhotoVO();
			
			String fileName = pic.getOriginalFilename();
			System.out.println("사진: " + fileName);
			
			try {				
				File f = new File(path, fileName);
				pic.transferTo( f ); //파일 저장
			} catch (Exception ex) {
				ex.printStackTrace();
			}
			carPhoto.setCar_picture(fileName);
			carPhotos.add(carPhoto);
		}
		
		String path2 = application.getRealPath("resources/file/carManual");
		String fileName2 = manual.getOriginalFilename();

		try {				
			File f2 = new File(path2, fileName2);
			manual.transferTo( f2 ); //파일 저장
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		System.out.println("매뉴얼: " + fileName2);
		car.setCar_manual(fileName2);
		
		carService.registerCar(car, carPhotos, carType);
		
		return "redirect:/admin/car-list";
	}
	
	@GetMapping(path = { "/return-list" })
	public String returnList() {
		
		return "admin/return-list";
	}
	
	@GetMapping(path = { "/car-list" })
	public String carList() {
		return "admin/car-list";
	}
	
	@GetMapping(path = { "/member-list" })
	public String memberList(MemberVO member,PointVO point,Model model) {
		List<MemberVO> members = memberService.findMember(member);
		model.addAttribute("members", members);
		return "admin/member-list";
	}
}
