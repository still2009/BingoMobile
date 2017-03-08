/**
 * Created by jason2009
 * 2015年6月7日 下午3:50:19
 */
package controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import utils.Hash;
import bean.UserBean;

import com.opensymphony.xwork2.ActionSupport;

import dao.UserDao;

public class InfoModifyAction extends ActionSupport{
	
	/*工具变量*/
	private HttpSession session = ServletActionContext.getRequest().getSession();
	private HttpServletResponse responce = ServletActionContext.getResponse();
	private UserDao dao = new UserDao();
	
	private String userName;
	private String mail;
	private String phone;
	private String address;
	
	private File pic;
	private String picFileName;
	private String picContentType;
	private String realName;
	private String studentId;
	private String college;
	private String academy;
	private String major;
	
	/**
	 * 基本信息修改,三个属性都会查重
	 * @return
	 * @throws Exception
	 */
	public String basic()throws Exception{
		UserBean user = (UserBean)session.getAttribute("user");
		String msg[] = {"用户名已被使用,","邮箱已被使用,","手机号已被使用.请刷新查看","收货地址更新成功"};
		System.out.println(userName+"-"+mail+"-"+phone);
		if(!userName.equals(user.getUserName()) && !dao.existByCondition("nick_name",userName)){
			System.out.println(1);
			user.setUserName(userName);
			msg[0] = "<p>用户名修改成功,";
		}
		if(!mail.equals(user.getMail()) && !dao.existByCondition("mail",mail)){
			System.out.println(2);
			user.setMail(mail);
			msg[1] = "邮箱修改成功,";
		}
		if(!phone.equals(user.getPhone()) && !dao.existByCondition("phone",phone)){
			System.out.println(3);
			user.setPhone(phone);
			msg[2] = "手机号修改成功.请刷新查看</p>";
		}
		user.setAddress(address);
		dao.update(user);
		responce.setCharacterEncoding("utf-8");
		responce.setContentType("text/html;charset=utf-8");
		responce.getWriter().write(new StringBuilder().append(msg[0]).append(msg[1])
				.append(msg[2]).append(msg[3]).toString());
		return NONE;
	}
	/**
	 * 在校学生认证,只有学号需要查重
	 * @return
	 * @throws Exception
	 */
	public String campus() throws Exception {
		UserBean user = (UserBean)session.getAttribute("user");
		String msg = "修改成功,请刷新页面";
		if(studentId.equals(user.getStudentId())) msg = "学号已被使用,其余修改成功,请刷新查看";
		else user.setStudentId(studentId);	
		user.setRealName(realName);
		user.setCollege(college);
		user.setAcademy(academy);
		user.setMajor(major);
		dao.update(user);
		responce.setCharacterEncoding("utf-8");
		responce.setContentType("text/html;charset=utf-8");
		responce.getWriter().write(msg);
		return NONE;
	}
	
	public String headPic() throws Exception{
		UserBean user = (UserBean)session.getAttribute("user");
		InputStream in = new FileInputStream(pic);
		String ext = picFileName.substring(picFileName.indexOf("."));
		File f = new File(ServletActionContext.getServletContext().getRealPath("/images")
				+ "/" + Hash.MD5(in)
				+ ext);
		in.close();
		System.out.println(f.getAbsolutePath());
		System.out.println(f.getName());
		f.createNewFile();
		FileUtils.copyFile(pic, f);
		user.setHeadPic(f.getName());
		dao.update(user);
		/*responce.setCharacterEncoding("utf-8");
		responce.setContentType("text/html;charset=utf-8");
		responce.getWriter().write("修改成功");*/
		return SUCCESS;
	}
	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public String getStudentId() {
		return studentId;
	}

	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}

	public String getCollege() {
		return college;
	}

	public void setCollege(String college) {
		this.college = college;
	}

	public String getAcademy() {
		return academy;
	}

	public void setAcademy(String academy) {
		this.academy = academy;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}
	public File getPic() {
		return pic;
	}
	public void setPic(File pic) {
		this.pic = pic;
	}
	public String getPicFileName() {
		return picFileName;
	}
	public void setPicFileName(String picFileName) {
		this.picFileName = picFileName;
	}
	public String getPicContentType() {
		return picContentType;
	}
	public void setPicContentType(String picContentType) {
		this.picContentType = picContentType;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
}
