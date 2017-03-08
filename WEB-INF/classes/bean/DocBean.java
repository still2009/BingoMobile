/**
 * Created by jason2009
 * 2015年4月12日 下午4:10:08
 */
package bean;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.HashSet;
import java.util.Set;

import utils.Hash;

public class DocBean implements Serializable,Comparable<DocBean>{
	private static final long serialVersionUID = 9191402708909963988L;
	
	private int id;
	private UserBean user;
	private String docTitle;
	private String docTag;
	private String docBranch;
	private String docDescription;
	private int docPayment;
	private String docPointer;
	private long docTime;
	private int docStar;
	private String docMD5;
	
	public String getDocMD5() {
		return docMD5;
	}
	public String getDocRealName(){
		return docMD5+".pdf";
	} 
	public void setDocMD5(String docMD5) {
		this.docMD5 = docMD5;
	}

	private Set<DocRelBean> docRels = new HashSet<DocRelBean>();
	@Override
	/**
	 * 比较哪个比较新
	 */
	public int compareTo(DocBean o) {
		if(o.getDocTime() > docTime) return -1;
		else if(o.getDocTime() == docTime) return 0;
		else return 1;
	}
	
	public int getId() {
		return id;
	}
	private void setId(int id) {
		this.id = id;
	}
	public UserBean getUser() {
		return user;
	}
	public void setUser(UserBean user) {
		this.user = user;
	}
	public void setMD5DocPointer(File f){
		InputStream in = null;
		try {
			in = new FileInputStream(f);
			String fileName = f.getName();
			docMD5 = Hash.MD5(in);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} finally{
			try {
				in.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	public String getDocTitle() {
		return docTitle;
	}
	public void setDocTitle(String docTitle) {
		this.docTitle = docTitle;
	}
	public String getDocTag() {
		return docTag;
	}
	public void setDocTag(String docTag) {
		this.docTag = docTag;
	}
	public String getDocBranch() {
		return docBranch;
	}
	public void setDocBranch(String docBranch) {
		this.docBranch = docBranch;
	}
	public String getDocDescription() {
		return docDescription;
	}
	public void setDocDescription(String docDescription) {
		this.docDescription = docDescription;
	}
	public int getDocPayment() {
		return docPayment;
	}
	public void setDocPayment(int docPayment) {
		this.docPayment = docPayment;
	}
	public String getDocPointer() {
		return docPointer;
	}
	public void setDocPointer(String docPointer) {
		this.docPointer = docPointer;
	}
	public long getDocTime() {
		return docTime;
	}
	public String getFormatDocTime(){
		return new SimpleDateFormat("yyyy年MM月dd日").format(docTime);
	}
	public void setDocTime(long docTime) {
		this.docTime = docTime;
	}
	
	public int getDocStar() {
		return docStar;
	}

	public void setDocStar(int docStar) {
		this.docStar = docStar;
	}

	public Set<DocRelBean> getDocRels() {
		return docRels;
	}

	public void setDocRels(Set<DocRelBean> docRels) {
		this.docRels = docRels;
	}

	@Override
	public String toString() {
		return docTitle;
	}
	
	
}
