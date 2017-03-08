/**
 * Created by jason2009
 * 2015年6月8日 下午4:57:20
 */
package controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import bean.UserBean;

import com.opensymphony.xwork2.ActionSupport;

import dao.UserDao;

public class PwdModifyAction extends ActionSupport{
	
	private HttpSession session = ServletActionContext.getRequest().getSession();
	private UserDao dao = new UserDao();
	private HttpServletResponse responce = ServletActionContext.getResponse();
	private String oldPwd;
	private String newPwd;
	private String confirmPwd;
	
	@Override
	public String execute() throws Exception {
		UserBean user = (UserBean)session.getAttribute("user");
		String msg = "密码修改成功,请重新登陆";
		if(!oldPwd.equals(user.getPassword())) msg = "修改失败,原密码错误";
		else if(newPwd.equals(confirmPwd)){
			user.setPassword(newPwd);
			dao.update(user);
			session.removeAttribute("user");
		}else msg = "修改失败,两次输入的密码不一致";
		responce.setCharacterEncoding("utf-8");
		responce.setContentType("text/html;charset=utf-8");
		responce.getWriter().write(msg);
		return NONE;
	}
	public String getOldPwd() {
		return oldPwd;
	}
	public void setOldPwd(String oldPwd) {
		this.oldPwd = oldPwd;
	}
	public String getNewPwd() {
		return newPwd;
	}
	public void setNewPwd(String newPwd) {
		this.newPwd = newPwd;
	}
	public String getConfirmPwd() {
		return confirmPwd;
	}
	public void setConfirmPwd(String confirmPwd) {
		this.confirmPwd = confirmPwd;
	}
	
}
