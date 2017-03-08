package bean;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

public class OrderBean implements Serializable{
	private int id;
	private UserBean user;
	private DocBean doc;
	private int price;
	private long orderTime;
	private String docTitle;
	private String orderStatus;
	
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
	public DocBean getDoc() {
		return doc;
	}
	public void setDoc(DocBean doc) {
		this.doc = doc;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public long getOrderTime() {
		return orderTime;
	}
	public String getFormatOrderTime(){
		return new SimpleDateFormat("yyyy年MM月dd日").format(orderTime);
	}
	public void setOrderTime(long orderTime) {
		this.orderTime = orderTime;
	}
	public String getDocTitle() {
		return docTitle;
	}
	public void setDocTitle(String docTitle) {
		this.docTitle = docTitle;
	}
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	
}
