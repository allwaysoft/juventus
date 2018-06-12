package email;

import org.apache.commons.mail.EmailAttachment;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.MultiPartEmail;

public class MultiPartEmailExample {

	public static void main(String[] args) {
		long beginTime = System.currentTimeMillis();
		
		// 첨부파일 생성을 위한 EmailAttachment 객체 생성
		EmailAttachment attch = new EmailAttachment();
		attch.setPath("d:/docs/copyimg.jpg");
//		String path = attch.getPath();
		attch.setDescription("꽃 이미지");
		attch.setName("");
		
		// MultiPartEmail 객체생성
		MultiPartEmail email = new MultiPartEmail();
		// SMTP 서버 연결설정
		email.setHostName("smtp.daum.net");
		email.setSmtpPort(465);
		email.setAuthentication("swkim917", "****");
		
		// SMTP SSL, TLS 설정
		email.setSSLOnConnect(true);
		email.setStartTLSEnabled(true);
		
		String rt = "fail";
		
		try {
			// 보내는사람 설정
			email.setFrom("swkim917@daum.net", "김상우", "utf-8");
			// 받는사람 설정
			email.addTo("swkim917@naver.com", "김상우", "utf-8");
			// 제목 설정
			email.setSubject("메일 제목입니다.");
			// 본문 설정
			email.setMsg("메일 본문입니다.\n두번째 줄 입니다.\n\n세번째 줄입니다.");
			// 첨부파일 추가
			email.attach(attch);
			// 메일 전송
			rt = email.send();
			
		} catch (EmailException e) {
			e.printStackTrace();
		} finally {
			long execTime = System.currentTimeMillis() - beginTime;
			System.out.println("execTime : " + execTime);
			System.out.println("rt : " + rt);
		}
	}

}
