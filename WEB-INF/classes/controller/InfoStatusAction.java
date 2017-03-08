/**
 * Created by jason2009
 * 2015年5月31日 下午5:41:25
 */
package controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import bean.InfoBean;
import bean.InfoRelBean;
import bean.UserBean;

import com.opensymphony.xwork2.ActionSupport;

import dao.InfoDao;
import dao.UserDao;

public class InfoStatusAction extends ActionSupport{
	private static final long serialVersionUID = -3711320923848881136L;
	
	private int userId;
	private int infoId;
	private String appointContent;
	
	/*工具变量*/
	private InfoDao dao = new InfoDao();
	private UserDao u_dao = new UserDao();
	private HttpSession session = ServletActionContext.getRequest().getSession();
	private HttpServletResponse responce = ServletActionContext.getResponse();
	
	/**
	 * 用户预约某条信息
	 * @return
	 * @throws Exception
	 * 只需要parameter包含infoId和appointContent
	 */
	public String appoint() throws Exception {
		UserBean user = (UserBean)session.getAttribute("user");
		if(user == null){
			responce.getWriter().write("logout");
			return NONE;
		}
		InfoBean info = (InfoBean)dao.get(InfoBean.class,infoId);
		// 先检查并扣除需求方的积分
		if (info.getInfoDirection() == -1){
			int update = user.getPoints() - info.getInfoPayment();
			if (update < 0) {
				responce.getWriter().write("no_points");
				return NONE;
			} else {
				//user.setPoints(update);
				new UserDao().setPoint(-1*info.getInfoPayment(),user.getId());
			}
		}
		InfoRelBean bean = new InfoRelBean(user, info, "参与", System.currentTimeMillis());
		bean.setRelStatus("提交预约");
		bean.setRelStatusContent(appointContent);
		InfoRelBean rel = dao.getUserRelInfo(user.getId(),infoId);
		if(rel != null && rel.getRelType().equals("参与")){
			responce.getWriter().write("already");
			return NONE;
		}
		else if(rel != null && rel.getRelStatus().equals("收藏")) dao.update(bean);
		else dao.insert(bean);
		responce.getWriter().write("success");
		//更新session中的状态
		
		return NONE;
	}
	/**
	 * 信息的发布者接受其他用户的预约
	 * @return
	 * @throws Exception
	 */
	public String accept() throws Exception{
		System.out.println("预约用户" + userId + "预约信息" + infoId);
		dao.updateStatusP("预约成功",userId,infoId);
		dao.updateStatusR("接受预约",infoId);
		return NONE;
	}
	/**
	 * 服务方确认自己已经完成给出的任务
	 * @return
	 * @throws Exception
	 */
	public String confirm() throws Exception{
		dao.updateStatusR("服务方确认", infoId);
		dao.updateStatusP("服务方确认", userId, infoId);
		return NONE;
	}
	/**
	 * 需求方最终确认对方完成了自己的任务,并结束整个过程.
	 * @return
	 * @throws Exception
	 */
	public String finish() throws Exception{
		InfoBean info = (InfoBean)dao.get(InfoBean.class,infoId);
		UserBean user = (UserBean)session.getAttribute("user");
		//给服务方积分
		if(info.getInfoDirection() == -1){
			//发布者为服务方
			user.setPoints(user.getPoints()+ info.getInfoPayment());
			u_dao.update(user);
		}else u_dao.setPoint(info.getInfoPayment(),userId);
		dao.updateStatusR("已完成", infoId);
		dao.updateStatusP("已完成", userId, infoId);
		return NONE;
	}
	
	
	

	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getInfoId() {
		return infoId;
	}
	public void setInfoId(int infoId) {
		this.infoId = infoId;
	}
	public String getAppointContent() {
		return appointContent;
	}
	public void setAppointContent(String appointContent) {
		this.appointContent = appointContent;
	}
}
