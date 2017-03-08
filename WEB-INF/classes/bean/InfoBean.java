/**
 * Created by jason2009
 * 2015��4��9�� ����8:24:54
 */
package bean;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.HashSet;
import java.util.Set;

public class InfoBean implements Serializable,Comparable<InfoBean>{
	private static final long serialVersionUID = 9058480767996982396L;
	
	private int id;
	private UserBean user;
	private int infoDirection;
	private String infoTag;
	private String infoTitle;
	private String infoContent;
	private String infoImagePointer;
	private long infoDeadline;
	private int infoPayment;
	private String infoStatus;
	private long infoTime;
	private Set<InfoRelBean> infoRels = new HashSet<InfoRelBean>();
	public InfoBean(){}
	
	public InfoBean(UserBean user, int infoDirection, String infoTag,
			String infoTitle, String infoContent, long infoDeadline,
			int infoPayment) {
		super();
		this.user = user;
		this.infoDirection = infoDirection;
		this.infoTag = infoTag;
		this.infoTitle = infoTitle;
		this.infoContent = infoContent;
		this.infoDeadline = infoDeadline;
		this.infoPayment = infoPayment;
	}
	
	@Override
	public int compareTo(InfoBean o) {
		if(o.getInfoTime() > infoTime) return -1;
		else if(o.getInfoTime() == infoTime) return 0;
		else return 1;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public UserBean getUser() {
		return user;
	}
	public void setUser(UserBean user) {
		this.user = user;
	}
	public int getInfoDirection() {
		return infoDirection;
	}
	public void setInfoDirection(int infoDirection) {
		this.infoDirection = infoDirection;
	}
	public String getInfoTag() {
		return infoTag;
	}
	public void setInfoTag(String infoTag) {
		this.infoTag = infoTag;
	}
	public String getInfoTitle() {
		return infoTitle;
	}
	public void setInfoTitle(String infoTitle) {
		this.infoTitle = infoTitle;
	}
	public String getInfoContent() {
		return infoContent;
	}
	public void setInfoContent(String infoContent) {
		this.infoContent = infoContent;
	}
	public String getInfoImagePointer() {
		return infoImagePointer;
	}
	public void setInfoImagePointer(String infoImagePointer) {
		this.infoImagePointer = infoImagePointer;
	}
	public long getInfoDeadline() {
		return infoDeadline;
	}
	public void setInfoDeadline(long infoDeadline) {
		this.infoDeadline = infoDeadline;
	}
	public int getInfoPayment() {
		return infoPayment;
	}
	public void setInfoPayment(int infoPayment) {
		this.infoPayment = infoPayment;
	}
	
	public String getInfoStatus() {
		return infoStatus;
	}

	public void setInfoStatus(String infoStatus) {
		this.infoStatus = infoStatus;
	}
	public String getFormatInfoTime(){
		return new SimpleDateFormat("yyyy年MM月dd日").format(infoTime);
	}
	public long getInfoTime() {
		return infoTime;
	}
	public void setInfoTime(long infoTime) {
		this.infoTime = infoTime;
	}

	public Set<InfoRelBean> getInfoRels() {
		return infoRels;
	}

	public void setInfoRels(Set<InfoRelBean> infoRels) {
		this.infoRels = infoRels;
	}
	public String directStr(){
		return infoDirection == 1 ? "需求" : "服务";
	}
	
}
