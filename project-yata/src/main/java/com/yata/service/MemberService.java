package com.yata.service;

import com.yata.vo.MemberVO;

public interface MemberService {
//	<!-- 1.13 수정 -->
	void registerMember(MemberVO member);

	MemberVO findMemberByEmailAndPasswd(MemberVO member);

}
