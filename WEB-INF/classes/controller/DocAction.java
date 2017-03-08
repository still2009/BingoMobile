/**
 * Created by jason2009
 * 2015年5月5日 下午4:13:54
 */
package controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import utils.Hash;
import utils.UploadStatus;
import bean.DocBean;
import bean.UserBean;

import com.opensymphony.xwork2.ActionSupport;

import dao.DocDao;

public class DocAction extends ActionSupport{

	private static final long serialVersionUID = 433944721015516325L;
	private static final String DOC_DIR = "/PDF/pdf_sources";
	//上传状态
	UploadStatus status = null;
	/*表单数据封装*/
	/*struts对action中对应form属性的赋值依赖于get,set,要注意他们的名称符合反射规则*/
	private String docTag;
	private String docTitle;
	private File doc;
	private String docFileName;
	private String docContentType;
	private String docDescription;
	private String docBranch;
	private int docPrice;
	/*工具变量*/
	private HttpSession session = ServletActionContext.getRequest().getSession();
	private DocDao dao = new DocDao();
	private ServletContext context = ServletActionContext.getServletContext();
	private List<DocBean> docList = null;
	
	public String release() throws Exception {
		UserBean user = (UserBean) session.getAttribute("user");
		DocBean bean = new DocBean();
		bean.setDocTag(docTag);
		bean.setDocTitle(docTitle);
		bean.setDocPointer(docFileName);
		bean.setDocDescription(docDescription);
		bean.setDocBranch(docBranch);
		bean.setDocPayment(docPrice);
		bean.setDocTime(System.currentTimeMillis());
		bean.setUser(user);
		//文件名 = 文件内容的MD5 + 文件扩展名
		bean.setMD5DocPointer(doc);
		File f = new File(context.getRealPath(DOC_DIR) + "/" + bean.getDocMD5() + ".pdf");
		f.createNewFile();
		FileUtils.copyFile(doc,f);
		
		dao.insert(bean);
		status = (UploadStatus) session.getAttribute("uploadStatus");
		status.setStatus("101");
		//更新当前session中的信息
		long count = (Long)session.getAttribute("docCount");
		session.setAttribute("docCount",count+1);
		docList = (List<DocBean>) session.getAttribute("docList");
		if(docList != null) docList = dao.getLatest(10);
		return NONE;
	}
	
	public String getDocTag() {
		return docTag;
	}

	public void setDocTag(String docTag) {
		this.docTag = docTag;
	}

	public String getDocTitle() {
		return docTitle;
	}

	public void setDocTitle(String docTitle) {
		this.docTitle = docTitle;
	}

	public File getDoc() {
		return doc;
	}

	public void setDoc(File doc) {
		this.doc = doc;
	}

	public String getDocFileName() {
		return docFileName;
	}

	public void setDocFileName(String docFileName) {
		this.docFileName = docFileName;
	}

	public String getDocContentType() {
		return docContentType;
	}

	public void setDocContentType(String docContentType) {
		this.docContentType = docContentType;
	}

	public String getDocDescription() {
		return docDescription;
	}

	public void setDocDescription(String docDescription) {
		this.docDescription = docDescription;
	}

	public String getDocBranch() {
		return docBranch;
	}

	public void setDocBranch(String docBranch) {
		this.docBranch = docBranch;
	}

	public int getDocPrice() {
		return docPrice;
	}

	public void setDocPrice(int docPrice) {
		this.docPrice = docPrice;
	}

	public DocDao getDao() {
		return dao;
	}

	public void setDao(DocDao dao) {
		this.dao = dao;
	}

}
