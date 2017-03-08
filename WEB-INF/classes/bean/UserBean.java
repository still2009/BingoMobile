/**
 * Created by jason2009
 * 2015��4��9�� ����8:19:07
 */
package bean;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

public class UserBean implements Serializable{
	
	private static final long serialVersionUID = -4890646415438023863L;
	private int id;
	private int userType;
	private String headPic;
	private String userName;
	private String password;
	private String mail;
	private String mailCode;
	private int isMail;
	private String phone;
	private String address;
	
	private String realName;
	private String studentId;
	private String college;
	private String academy;
	private String major;
	private int points;
	private Set<DocBean> uploadedDocs = new HashSet<DocBean>();
	private Set<InfoBean> releasedInfos = new HashSet<InfoBean>();
	private Set<OrderBean> orderList = new HashSet<OrderBean>();
	public UserBean() {
		headPic = "default.jpg";
	}
	
	public UserBean(int userType, String userName, String password) {
		this();
		this.userType = userType;
		this.userName = userName;
		this.password = password;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUserType() {
		return userType;
	}

	public void setUserType(int userType) {
		this.userType = userType;
	}
	
	public String getHeadPic() {
		return headPic;
	}

	public void setHeadPic(String headPic) {
		this.headPic = headPic;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getMailCode() {
		return mailCode;
	}

	public void setMailCode(String mailCode) {
		this.mailCode = mailCode;
	}

	public int getIsMail() {
		return isMail;
	}

	public void setIsMail(int isMail) {
		this.isMail = isMail;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public String getStudentId() {
		return studentId;
	}

	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}

	public String getCollege() {
		return college;
	}

	public void setCollege(String college) {
		this.college = college;
	}

	public String getAcademy() {
		return academy;
	}

	public void setAcademy(String academy) {
		this.academy = academy;
	}

	public Set<DocBean> getUploadedDocs() {
		return uploadedDocs;
	}

	public void setUploadedDocs(Set<DocBean> uploadedDocs) {
		this.uploadedDocs = uploadedDocs;
	}

	public Set<InfoBean> getReleasedInfos() {
		return releasedInfos;
	}

	public void setReleasedInfos(Set<InfoBean> releasedInfos) {
		this.releasedInfos = releasedInfos;
	}

	public int getPoints() {
		return points;
	}

	public void setPoints(int points) {
		this.points = points;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public Set<OrderBean> getOrderList() {
		return orderList;
	}

	public void setOrderList(Set<OrderBean> orderList) {
		this.orderList = orderList;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	public Set<OrderBean> notConfirmedOrders(){
		HashSet<OrderBean> set = new HashSet<OrderBean>();
		for(OrderBean bean : orderList){
			if(bean.getOrderStatus().equals("未确认")) set.add(bean);
		}
		return set;
	}
	public Set<OrderBean> confirmedOrders(){
		HashSet<OrderBean> set = new HashSet<OrderBean>();
		for(OrderBean bean : orderList){
			if(bean.getOrderStatus().equals("已确认")) set.add(bean);
		}
		return set;
	}
	
}
