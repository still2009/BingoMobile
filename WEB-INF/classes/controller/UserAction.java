/**
 * Created by jason2009
 * 2015年4月15日 下午1:17:40
 */
package controller;

import org.apache.struts2.ServletActionContext;

import bean.UserBean;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import dao.UserDao;


public class UserAction extends ActionSupport{
	private static final long serialVersionUID = -3217844841779331518L;
	public static final String INDEX = "index";
	//表单数据封装
	private int userType;
	private String userName;
	private String password;
	private String mail;

	//工具变量
	ActionContext context = ActionContext.getContext();
	UserDao dao = new UserDao();
	
	public int getUerType() {
		return userType;
	}
	public void setUerType(int userType) {
		this.userType = userType;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	
	/* 注册 */
	public String regist() throws Exception {
		UserBean user = new UserBean(userType, userName, password);
		user.setMail(mail);
		if(dao.getUserByName(userName) != null) ServletActionContext.getResponse().getWriter().write("fail");
		else{
			dao.insert(user);
			ServletActionContext.getResponse().getWriter().write("success");
		}
		return NONE;
	}
	
	/* 激活 */
	public String active() throws Exception {
		return NONE;
	}
	
	/* 登陆 */
	public String login() throws Exception {
		UserBean user = dao.login(userName, password);
		if(user == null) ServletActionContext.getResponse().getWriter().write("fail");
		else{
			context.getSession().put("user",user);
			context.getSession().put("docCount",dao.getCounts("doc",user.getId()));
			context.getSession().put("infoCount",dao.getCounts("info",user.getId()));
			ServletActionContext.getResponse().getWriter().write("success");
		}
		return NONE;
	}
	
	/* 注销 */
	public String logout() throws Exception {
		ServletActionContext.getRequest().getSession().removeAttribute("user");
		return INDEX;
	}
	
	/* 验证用户名是否已存在 */
	public String exist() throws Exception {
		return NONE;
	}
}
