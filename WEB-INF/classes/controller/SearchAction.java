package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import bean.DocBean;
import bean.InfoBean;
import dao.DocDao;
import dao.InfoDao;

public class SearchAction extends ActionSupport{
	
	private String keyword;
	private int type;
	private DocDao dDao = new DocDao();
	private InfoDao iDao = new InfoDao();
	private HttpServletRequest request = ServletActionContext.getRequest();
	
	@Override
	public String execute() throws Exception {
		request.setAttribute("type",type);
		System.out.println("type:+++\n\n\n\n"+type);
		if(type==0 || type==1) request.setAttribute("docList",dDao.searchDoc(keyword));
		if(type==0 || type==2) request.setAttribute("infoList",iDao.searchInfo(keyword));
		return SUCCESS;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	
}
