/**
 * Created by jason2009
 * 2015年5月6日 上午10:59:58
 */
package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import utils.UploadStatus;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UtilAction extends ActionSupport{
	//上传状态
	UploadStatus status = null;
	//工具变量
	ActionContext context = ActionContext.getContext();
	HttpServletResponse response = ServletActionContext.getResponse();
	HttpServletRequest request = ServletActionContext.getRequest();
	
	public String uploadStatus() throws Exception {
		status = (UploadStatus) request.getSession().getAttribute("uploadStatus");
		System.out.println("progress:" + status.getStatus());
		response.getWriter().write(status.getStatus());
		return NONE;
	}
	
}
