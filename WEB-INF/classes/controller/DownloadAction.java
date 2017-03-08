package controller;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import bean.DocBean;
import bean.DocRelBean;
import bean.UserBean;
import dao.DocDao;
import dao.UserDao;

public class DownloadAction extends ActionSupport{
	
	private int docId;
	private int authorId;
	private int price;
	private String docTitle;
	private DocDao dao = new DocDao();
	private UserDao uDao = new UserDao();
	private HttpSession session = ServletActionContext.getRequest().getSession();
	@Override
	public String execute() throws Exception {
		UserBean user = (UserBean)session.getAttribute("user");
		String msg = "login";
		if(user != null && price == -1){
			//是否是该用户上传的文档
			if(authorId == docId){
				msg="url";
				ServletActionContext.getResponse().getWriter().write(msg);
				return NONE;
			}
			//以前是否下载过
			DocRelBean rel = dao.getDownloadDocRel(user.getId(),docId);
			if(rel == null) msg = "price";
			else msg = "url";
		}else if(user != null && price != -1){
			//扣除时间币并下载
			int update = user.getPoints() - price;
			if (update < 0) {
				msg="no_points";
			} else {
				//扣除本用户的时间币
				uDao.setPoint(price*-1, user.getId());
				//增加发布者的时间币
				uDao.setPoint(price, authorId);
				msg = dao.insertDownload(user.getId(),docId);
			}
		}
		ServletActionContext.getResponse().getWriter().write(msg);
		return NONE;
	}
	//处理打印请求
	public String print() throws Exception{
		UserBean user = (UserBean)session.getAttribute("user");
		String msg = "login";
		if(user != null && price == -1){
			//是否是该用户上传的文档
			if(authorId == docId){
				//此处处理订单
				if(dao.insertOrder(user.getId(), docId, price, docTitle)) msg="self";
				else msg = "fail";
				ServletActionContext.getResponse().getWriter().write(msg);
				return NONE;
			}
			//以前是否下载过(凡是打印过，都会在user2doc中添加一条下载记录)
			DocRelBean rel = dao.getDownloadDocRel(user.getId(),docId);
			if(rel == null) msg = "price";
			else {
				//此处处理订单
				if(dao.insertOrder(user.getId(), docId, price, docTitle)) msg="downloaded";
				else msg = "fail";
			}
		}else if(user != null && price != -1){
			//扣除时间币并下载
			int update = user.getPoints() - price;
			if (update < 0) {
				msg="no_points";
			} else if(update >= 0 && price != 0){
				//扣除本用户的时间币
				uDao.setPoint(price*-1, user.getId());
				//增加发布者的时间币
				uDao.setPoint(price, authorId);
				dao.insertDownload(user.getId(),docId);
				//此处处理订单
				if(dao.insertOrder(user.getId(), docId, price, docTitle)) msg="success";
				else msg = "fail";
			} else if(price == 0) {
				if(dao.insertOrder(user.getId(), docId, price, docTitle)) msg="success";
				else msg = "fail";
				msg="success";
			}
		}
		ServletActionContext.getResponse().getWriter().write(msg);
		return NONE;
	}
	public int getDocId() {
		return docId;
	}
	public void setDocId(int docId) {
		this.docId = docId;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getDocTitle() {
		return docTitle;
	}
	public void setDocTitle(String docTitle) {
		this.docTitle = docTitle;
	}
	
}
