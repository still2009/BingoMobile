/**
 * Created by jason2009
 * 2015年5月6日 下午11:42:38
 */
package controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.RespectBinding;

import org.apache.struts2.ServletActionContext;

import bean.DocBean;
import bean.InfoBean;
import bean.UserBean;

import com.opensymphony.xwork2.ActionSupport;

import dao.InfoDao;

public class InfoAction extends ActionSupport{
	private static final long serialVersionUID = 4637922639618066449L;
	
	private int infoType;
	private String infoTag;
	private String infoTitle;
	private String infoDescription;
	private long infoDeadline;
	private int infoPay;
	private List<InfoBean> infoList;
	/*工具变量*/
	private InfoDao dao = new InfoDao();
	private HttpSession session = ServletActionContext.getRequest().getSession();
	private HttpServletResponse responce = ServletActionContext.getResponse();
	
	public int getInfoType() {
		return infoType;
	}
	public void setInfoType(int infoType) {
		this.infoType = infoType;
	}
	public String getInfoTag() {
		return infoTag;
	}
	public void setInfoTag(String infoTag) {
		this.infoTag = infoTag;
	}
	public String getInfoTitle() {
		return infoTitle;
	}
	public void setInfoTitle(String infoTitle) {
		this.infoTitle = infoTitle;
	}
	public String getInfoDescription() {
		return infoDescription;
	}
	public void setInfoDescription(String infoDescription) {
		this.infoDescription = infoDescription;
	}
	public long getInfoDeadline() {
		return infoDeadline;
	}
	public void setInfoDeadline(String infoDeadline) {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy年MM月dd日");
		try {
			this.infoDeadline = formatter.parse(infoDeadline).getTime();
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
	public int getInfoPay() {
		return infoPay;
	}
	public void setInfoPay(int infoPay) {
		this.infoPay = infoPay;
	}
	/**
	 * 用户发布信息,发送状态给前台:logout-登陆失效,success-发布成功,no_points-积分不够
	 * @return 返回状态NONE
	 * @throws Exception
	 */
	public String release() throws Exception {
		//检查登陆
		String msg = null;
		UserBean user = (UserBean) session.getAttribute("user");
		if(user == null) {
			msg = "logout";
			return NONE;
		}
		//先检查并扣除需求方的积分
		if(infoType == 1){
			int update = user.getPoints()-infoPay;
			if(update < 0){
				msg = "no_points";
			}
			else{
				user.setPoints(update);
				dao.update(user);
			}
		}
		//再封装InfoBean	
		InfoBean info = new InfoBean(user, infoType, infoTag, infoTitle, infoDescription, infoDeadline, infoPay);
		info.setInfoTime(System.currentTimeMillis());
		info.setInfoStatus("等待预约");
		dao.insert(info);
		msg = "success";
		
		//更新当前session中的信息
		long count = (Long)session.getAttribute("infoCount");
		session.setAttribute("infoCount",count+1);
		infoList = (List<InfoBean>) session.getAttribute("requestList");
		if(infoList != null) infoList = dao.getLatestRequest(5);
		infoList = (List<InfoBean>) session.getAttribute("serviceList");
		if(infoList != null) infoList = dao.getLatestService(5);
		responce.getWriter().write(msg);
		return NONE;
	}
	
}
