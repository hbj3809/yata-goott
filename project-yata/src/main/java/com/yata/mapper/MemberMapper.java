package com.yata.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.yata.vo.MemberVO;

@Mapper
public interface MemberMapper {
//	<!-- 1.13 수정 -->
	void insertMember(MemberVO member);

	MemberVO selectMemberByEmailAndPasswd(MemberVO member);

	int approval_member(MemberVO member) throws Exception;

	void updateMember(MemberVO member);

	List<MemberVO> findMember(MemberVO member);

	void insertPoint(MemberVO member);
	
	void updatePoint(MemberVO member);

	void deleteUser(MemberVO member);
	
	MemberVO findPoint(MemberVO member);

	MemberVO findEmail(MemberVO member);

	MemberVO findPhone(MemberVO member);

	void updatePasswd(MemberVO member);

	void updateActivePoint(int user_num, int res_point);

}