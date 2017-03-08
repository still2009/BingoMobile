/**
 * Created by jason2009
 * 2015年5月26日 下午6:03:55
 */
package bean;

import java.io.Serializable;
import java.text.SimpleDateFormat;

public class DocRelBean implements Serializable{
	private static final long serialVersionUID = -8767470546475515673L;
	
	private UserBean user;
	private DocBean doc;
	private String relType;
	private long relTime;
	
	public UserBean getUser() {
		return user;
	}
	public void setUser(UserBean user) {
		this.user = user;
	}
	public DocBean getDoc() {
		return doc;
	}
	public void setDoc(DocBean doc) {
		this.doc = doc;
	}
	public String getRelType() {
		return relType;
	}
	public void setRelType(String relType) {
		this.relType = relType;
	}
	public String getFormatRelTime(){
		return new SimpleDateFormat("yyyy年MM月dd日").format(relTime);
	}
	public long getRelTime() {
		return relTime;
	}
	public void setRelTime(long relTime) {
		this.relTime = relTime;
	}
	
	
}
