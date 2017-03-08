/**
 * Created by jason2009
 * 2015年5月2日 下午2:30:45
 */
package utils;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Authenticator;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.junit.Test;

public class MailUtil{
	private static final String USER_NAME = "bingowe@163.com";
	private static final String PASSWORD = "umnvftdxtemrzkat";
	private static final String SUBJECT = "Bingo大学帮注册激活邮件";
	private static final String MAIL_HOST = "smtp.163.com";
	/**
	 * @param dest 收件人
	 * @param code 用户激活码
	 */
	public static void SendMail(String dest,String code){
		//1.获取Session对象
		Properties prop = new Properties();
		prop.setProperty("mail.smtp.host",MAIL_HOST);
		prop.setProperty("mail.smtp.auth","true");
		Session session = Session.getInstance(prop, new Authenticator(){
			@Override
			protected PasswordAuthentication getPasswordAuthentication(){
				return new PasswordAuthentication(USER_NAME, PASSWORD);
			}
		});
		
		//* 2.创建代表邮件的对象Message
		Message msg = new MimeMessage(session);
		try {
			msg.setFrom(new InternetAddress(USER_NAME));
			msg.addRecipient(RecipientType.TO,new InternetAddress(dest));
			//主题
			msg.setSubject(SUBJECT);
			//正文
			msg.setContent("<a href='#'>点此激活</a>","text/html;charset=utf-8");
			//* 3.使用Transport发送邮件
			Transport.send(msg);
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
	@Test
	public void test(){
		 MailUtil.SendMail("981884182@qq.com", null);
	}
}
