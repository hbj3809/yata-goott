package com.yata.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.ui.Model;

import com.yata.vo.MemberVO;

@Mapper
public interface MemberMapper {
//	<!-- 1.13 수정 -->
	void insertMember(MemberVO member);

	MemberVO selectMemberByEmailAndPasswd(MemberVO member);

	int approval_member(MemberVO member) throws Exception;

	void updateMember(MemberVO member);

	List<MemberVO> findMember(MemberVO member);

	void insertPoint(int newUserNum);

	void deleteUser(MemberVO member);
	
	MemberVO findPoint(MemberVO member);
}