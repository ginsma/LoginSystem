package Mail;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.Serializable;
import java.util.Properties;

/**
 * Mail属性实体
 *
 * @author shadow
 *
 */
@SuppressWarnings("serial")
public class Mail  {

 //发送邮件：
		public static void sendMail(String addr,String uName,String key)throws Exception {
			//新建properties类，用于配置session
			Properties prop = new Properties();
			//主机、协议
			prop.setProperty("mail.host", "smtp.163.com");
			prop.setProperty("mail.transport.protocol", "smtp");
			prop.setProperty("mail.smtp.auth", "true");
			//创建Session
			Session session = Session.getInstance(prop);
			//Session的Debug模式
			//session.setDebug(true);
			//获取transport对象
			Transport ts = session.getTransport();
			//用户名密码连接163邮箱；
			ts.connect("smtp.163.com", "youngxueya", "SUJU13");
			//邮件内容
			Message message = createSimpleMail(session,addr,uName,key);
			//发送邮件
			ts.sendMessage(message, message.getAllRecipients());
			ts.close();
		}
		public static MimeMessage createSimpleMail(Session session, String addr,  String uName, String key)
			throws Exception {
			//初始化邮件内容
			MimeMessage message = new MimeMessage(session);
			//设置发件人
			message.setFrom(new InternetAddress("youngxueya@163.com"));
			//收件人
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(addr));
			//邮件主题
			message.setSubject("3DFeet厂家后台系统");
			//邮件内容
			String mes = "";
			mes+="亲爱的" +uName + "您好：<br/><br/>";
			mes+="点击以下链接设置新密码。<br/><br/>";
			mes+="<a href = \"http://localhost:8080/temper/resetPasswd.do?username="+uName+"&key=" + key +"\">http://localhost:8080/temper/resetPasswd.do?username=" + uName + "&key=" + key +"</a><br/><br/>";
			mes+="注意:请您在收到邮件24小时内使用，否则该链接将会失效。<br/><br/>";
			message.setContent(mes, "text/html;charset=UTF-8");

			return message;
		}
}
