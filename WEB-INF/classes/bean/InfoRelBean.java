/**
 * Created by jason2009
 * 2015年5月26日 下午6:04:21
 */
package bean;

import java.io.Serializable;
import java.text.SimpleDateFormat;

public class InfoRelBean implements Serializable{
	private static final long serialVersionUID = 1831105001306894875L;
	
	private UserBean user;
	private InfoBean info;
	private String relType;
	private long relTime;
	private String relStatus;
	private String relStatusContent;
	
	public InfoRelBean() {}
	public InfoRelBean(UserBean user, InfoBean info, String relType,
			long relTime) {
		super();
		this.user = user;
		this.info = info;
		this.relType = relType;
		this.relTime = relTime;
	}
	public UserBean getUser() {
		return user;
	}
	public void setUser(UserBean user) {
		this.user = user;
	}
	public InfoBean getInfo() {
		return info;
	}
	public void setInfo(InfoBean info) {
		this.info = info;
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
	public String getRelStatus() {
		return relStatus;
	}
	public void setRelStatus(String relStatus) {
		this.relStatus = relStatus;
	}
	public String getRelStatusContent() {
		return relStatusContent;
	}
	public void setRelStatusContent(String relStatusContent) {
		this.relStatusContent = relStatusContent;
	}
	
}
