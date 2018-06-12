package email;

import java.io.File;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;

public class HtmlEmailExample {

	public static void main(String[] args) {
		long beginTime = System.currentTimeMillis();
		
		// HtmlEmail 객체생성
		HtmlEmail email = new HtmlEmail();
		// SMTP 서버 연결설정
		email.setHostName("smtp.daum.net");
		email.setSmtpPort(465);
		email.setAuthentication("swkim917", "****");
		
		// SMTP SSL, TLS 설정
		email.setSSLOnConnect(true);
		email.setStartTLSEnabled(true);
		
		// 이미지 파일 생성
		File imgFile = new File("d:/docs/copyimg.jpg"); 
		
		String rt = "fail";
		
		try {
			// 보내는사람 설정
			email.setFrom("swkim917@daum.net", "김상우", "utf-8");
			// 받는사람 설정
			email.addTo("swkim917@daum.net", "김상우", "utf-8");
			// 제목 설정
			email.setSubject("메일 제목입니다.");
			// 본문 설정
			StringBuilder sb = new StringBuilder();
			sb.append("<html><body>");
			sb.append("My name is Hong.<br>");
			sb.append("<img src=cid:");
			sb.append(email.embed(imgFile));
			sb.append("></body></html>");
			
			email.setHtmlMsg(sb.toString());
			
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
