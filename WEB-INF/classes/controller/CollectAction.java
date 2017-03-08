/**
 * Jinj 981884182@qq.com
 * 2015年6月17日 上午12:52:30
 */
package controller;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import bean.UserBean;
import dao.DocDao;
import dao.InfoDao;

public class CollectAction extends ActionSupport{
	private String collectType;
	private int itemId;
	private InfoDao iDao = new InfoDao();
	private DocDao dDao = new DocDao();
	/*工具变量*/
	private HttpSession session = ServletActionContext.getRequest().getSession();
	
	@Override
	public String execute() throws Exception{
		String msg = "login";
		UserBean user = (UserBean)session.getAttribute("user");
		if(user != null){
			if(collectType.equals("timebank")) msg = iDao.insertCollection(user.getId(), itemId);
			else if(collectType.equals("doc")) msg = dDao.insertCollection(user.getId(), itemId);
		}
		ServletActionContext.getResponse().getWriter().write(msg);
		return NONE;
	}
	public String getCollectType() {
		return collectType;
	}
	public void setCollectType(String collectType) {
		this.collectType = collectType;
	}
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	
}
