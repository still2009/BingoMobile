/**
 * Created by jason2009
 * 2015年5月16日 下午4:16:36
 */
package controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import bean.DocBean;
import bean.DocRelBean;
import bean.InfoBean;
import bean.InfoRelBean;
import bean.UserBean;

import com.opensymphony.xwork2.ActionSupport;

import dao.DocDao;
import dao.InfoDao;

/**
 * 控制jsp显示数据条目的优先级与次序,包括各个主页面条目显示的个数与顺序.
 * @author jason2009
 *
 */
public class ShowAction extends ActionSupport{

	private static final long serialVersionUID = 279416087505249897L;
	
	/*域名访问时显示欢迎页*/
	private String firstTime;
	private String pageName;
	private int itemId;
	
	private HttpServletRequest request = ServletActionContext.getRequest();
	private HttpSession session = ServletActionContext.getRequest().getSession();
	private InfoDao infoDao = new InfoDao();
	private DocDao docDao = new DocDao();
	private List<DocBean> docList = null;
	private List<InfoBean> requestList = null;
	private List<InfoBean> serviceList = null;
	
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	
	public String getPageName() {
		return pageName;
	}
	public void setPageName(String pageName) {
		this.pageName = pageName;
	}
	
	public String isFirstTime() {
		return firstTime;
	}
	public void setFirstTime(String firstTime) {
		this.firstTime = firstTime;
	}
	/**
	 * 用最新的记录掉原有列表中"过时"的记录
	 * @param old
	 * @param extra
	 */
	private void fillLatest(List old,List extra){
		if(extra != null && extra.size() >= 0){
			if(extra.size() >= old.size()){
				old = extra;
				return;
			}
			old.addAll(extra);
			/*默认是自然排序/升序排序*/
			Collections.sort(old);
			for(int i = 0;i < extra.size();i++){
				old.remove(0);
			}
			Collections.reverse(old);
		}
	}
	
	/**
	 * 访问首页,文档首页,时间银行首页
	 * 根据情况查询数据库,获取最新发布的信息,存放到域里供jsp使用
	 */
	public String page() throws Exception {
		/*docList = (List<DocBean>) session.getAttribute("docList");
		requestList = (List<InfoBean>) session.getAttribute("requestList");
		serviceList = (List<InfoBean>) session.getAttribute("serviceList");
		//最新文档列表
		if(docList == null || docList.size() < 10) docList = docDao.getLatest(10);
		else{
			List<DocBean> lst = docDao.getAfter(docList.get(0).getDocTime());
			fillLatest(docList, lst);
		}

		//最新需求
		if(requestList == null || requestList.size() < 5) requestList = infoDao.getLatestRequest(5);
		else{
			List<InfoBean> lst = infoDao.getRequestAfter(requestList.get(0).getInfoTime());
			fillLatest(requestList, lst);
		}
		// 最新服务
		if (serviceList == null || serviceList.size() < 5)
			serviceList = infoDao.getLatestService(5);
		else {
			List<InfoBean> lst = infoDao.getServiceAfter(serviceList.get(0).getInfoTime());
			fillLatest(serviceList, lst);
		}
		//保存到session
		 * */
		//欢迎页面
		if(firstTime!= null && firstTime.equals("true")) request.setAttribute("firstTime",1);
		if(pageName.equals("main")){
			docList = docDao.getLatest(5);
			requestList = infoDao.getLatestRequest(5);
			serviceList = infoDao.getLatestService(5);
			request.setAttribute("docList",docList);
			request.setAttribute("requestList",requestList);
			request.setAttribute("serviceList",serviceList);
		}else if(pageName.equals("doc")){
			docList = docDao.getLatest(10);
			request.setAttribute("docList",docList);
		}else if(pageName.equals("info")) {
			requestList = infoDao.getLatestRequest(7);
			serviceList = infoDao.getLatestService(7);
			request.setAttribute("requestList",requestList);
			request.setAttribute("serviceList",serviceList);
		}
		return pageName;
	}
	/**
	 * 为个人中心页面提供显示内容bean
	 * @return
	 * @throws Exception
	 */
	public String userCenter() throws Exception{
		UserBean user = (UserBean)session.getAttribute("user");
		//当没有用户登陆时返回登陆页面
		if(user == null) return ERROR;
		List<DocRelBean> docDownloadList = docDao.getUserRelDoc(user.getId(),"下载");
		List<DocRelBean> docCollectList = docDao.getUserRelDoc(user.getId(),"收藏");
		List<InfoRelBean> infoPartList = infoDao.getUserRelInfo(user.getId(),"参与");
		List<InfoRelBean> infoCollectList = infoDao.getUserRelInfo(user.getId(),"收藏");
		session.setAttribute("docDownloadList",docDownloadList);
		session.setAttribute("docCollectList",docCollectList);
		session.setAttribute("infoPartList",infoPartList);
		session.setAttribute("infoCollectList",infoCollectList);
		user = (UserBean)docDao.get(UserBean.class,user.getId());
		session.setAttribute("user", user);
		return SUCCESS;
	}
	
	/**
	 * 具体的文档显示页面
	 * @return
	 * @throws Exception
	 */
	public String docShow() throws Exception {
		request.setAttribute("doc", docDao.get(DocBean.class,itemId));
		return SUCCESS;
	}
	
	/**
	 * 具体的时间银行信息
	 * @return
	 * @throws Exception
	 */
	public String infoShow() throws Exception {
		request.setAttribute("info", infoDao.get(InfoBean.class, itemId));
		return SUCCESS;
	}
}
