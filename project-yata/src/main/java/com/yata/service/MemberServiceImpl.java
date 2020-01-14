package com.yata.service;

import com.yata.mapper.MemberMapper;
import com.yata.vo.MemberVO;

import lombok.Setter;

public class MemberServiceImpl implements MemberService {
//	<!-- 1.13 수정  -->
	@Setter
	private MemberMapper memberMapper;
	
	@Override
	public void registerMember(MemberVO member) {

		memberMapper.insertMember(member);
		
	}

	@Override
	public MemberVO findMemberByEmailAndPasswd(MemberVO member) {

		return memberMapper.selectMemberByEmailAndPasswd(member);
		
	}

}
