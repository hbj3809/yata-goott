package com.yata.service;

import java.io.PrintWriter;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;

import com.yata.common.Util;
import com.yata.mapper.MemberMapper;
import com.yata.vo.MemberVO;
import com.yata.vo.PointVO;

import lombok.Setter;

public class MemberServiceImpl implements MemberService {
//	<!-- 1.13 수정  -->
	@Setter
	private MemberMapper memberMapper;
	@Setter
	private PointVO point;

	@Override
	public void registerMember(MemberVO member) throws Exception {

		// 비밀번호 암호화 추가
		String plainPasswd = member.getUser_passwd();
		String hashedPasswd = Util.getHashedString(plainPasswd, "SHA-256");
		member.setUser_passwd(hashedPasswd);
		
		member.setUser_key(create_key());
		memberMapper.insertMember(member);
		// 회원가입시 포인트 1000000점 부여 (임시)
		point.setActive_point(1000000);
		point.setTotal_point(1000000);
		member.setPoint(point);
		memberMapper.insertPoint(member);
		
		if (member.getPoint().getTotal_point() < 100000) {
			member.getPoint().setUser_grade("bronze");
		} else if (member.getPoint().getTotal_point() >= 100000 && member.getPoint().getTotal_point() < 500000) {
			member.getPoint().setUser_grade("silver");
		} else if (member.getPoint().getTotal_point() >= 500000 && member.getPoint().getTotal_point() < 1000000) {
			member.getPoint().setUser_grade("gold");
		} else if (member.getPoint().getTotal_point() >= 1000000 && member.getPoint().getTotal_point() < 5000000) {
			member.getPoint().setUser_grade("platinum");
		} else {
			member.getPoint().setUser_grade("diamond");
		}
		
		memberMapper.updatePoint(member);
		
//		send_mail(member);

	}

	@Override
	public String create_key() throws Exception {

		String key = "";
		Random rd = new Random();

		for (int i = 0; i < 8; i++) {
			key += rd.nextInt(10);
		}
		System.out.println(key);
		return key;
	}

	@Override
	public void send_mail(MemberVO member) throws Exception {

		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com";
		String hostSMTPid = "hbj3809@naver.com";
		String hostSMTPpwd = "#";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "hbj3809@naver.com";
		String fromName = "YA TA!";
		String subject = "";
		String msg = "";

		// 회원가입 메일 내용
		subject = "YA TA! 회원가입 인증 메일입니다.";
		msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
		msg += "<h3 style='color: blue;'>";
		msg += member.getUser_Name() + "님 회원가입을 환영합니다.</h3>";
		msg += "<div style='font-size: 130%'>";
		msg += "하단의 인증 버튼 클릭 시 정상적으로 회원가입이 완료됩니다.</div><br/>";
		msg += "<form method='post' action='http://localhost:8081/project-yata/account/approval_member'>";
		msg += "<input type='hidden' name='user_email' value='" + member.getUser_email() + "'>";
		msg += "<input type='hidden' name='user_key' value='" + member.getUser_key() + "'>";
		msg += "<input type='submit' value='인증'></form><br/></div>";

		// 받는 사람 E-Mail 주소
		String mail = member.getUser_email();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(465);

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}

	}

	@Override
	public void approval_member(MemberVO member, HttpServletResponse resp) throws Exception {
		
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		if (memberMapper.approval_member(member) == 0) { // 이메일 인증에 실패하였을 경우
			out.println("<script>");
			out.println("alert('잘못된 접근입니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		} else { // 이메일 인증을 성공하였을 경우
			out.println("<script>");
			out.println("alert('인증이 완료되었습니다. 로그인 후 이용하세요.');");
			out.println("location.href='../';");
			out.println("</script>");
			out.close();
		}
		
	}
	
	@Override
	public void modifyMember(MemberVO member) {
				
		// 비밀번호 암호화 추가
		String plainPasswd = member.getUser_passwd();
		String hashedPasswd = Util.getHashedString(plainPasswd, "SHA-256");
		member.setUser_passwd(hashedPasswd);
		
		memberMapper.updateMember(member);
		
	}

	@Override
	public List<MemberVO> findMember(MemberVO member) {
		
		return memberMapper.findMember(member);
	}

	@Override
	public void deleteUser(MemberVO member) {
		memberMapper.deleteUser(member);
		
	}

	@Override
	public MemberVO selectMemberByEmailAndPasswd(MemberVO member) {
		
		// 비밀번호 암호화 추가
		String plainPasswd = member.getUser_passwd();
		String hashedPasswd = Util.getHashedString(plainPasswd, "SHA-256");
		member.setUser_passwd(hashedPasswd);
			
		return memberMapper.selectMemberByEmailAndPasswd(member);
	}

	@Override
	public void findPoint(MemberVO member) {
		memberMapper.findMember(member);
		
	}

	@Override
	public void updatePoint(MemberVO member) {
		
		
		memberMapper.updatePoint(member);
		
	}


}
