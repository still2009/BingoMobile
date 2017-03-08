/**
 * Created by jason2009
 * 2015��4��9�� ����8:30:23
 */
package dao;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.junit.Test;

import bean.OrderBean;
import bean.UserBean;

public class UserDao extends BasicDao{
	
	public UserBean getUserByName(String userName){
		session = sessionFact.openSession();
		tx = session.beginTransaction();
		Query query = session.createQuery("from UserBean as user where user.userName=:name");
		query.setParameter("name",userName);
		List result = query.list();
		UserBean bean = null;
		if(result == null || result.size() == 0) bean = null;
		else bean = (UserBean)result.get(0);
		
		//提交事务
		tx.commit();
		//关闭会话
		session.close();
		session = null;
		return bean;
	}
	/**
	 * 检查是否存在指定用户,若存在则返回,否则返回空
	 * @param acc 账户登陆凭证(用户名,邮箱,手机)
	 * @param pwd 账号密码
	 * @return
	 */
	public UserBean login(String acc,String pwd){
		session = sessionFact.openSession();
		tx = session.beginTransaction();
		Query query = session.createQuery("from UserBean as user"
				+ " where (user.userName=:name or user.mail=:mail or user.phone=:phone)"
				+ " and user.password=:pwd");
		query.setParameter("name",acc);
		query.setParameter("mail",acc);
		query.setParameter("phone",acc);
		query.setParameter("pwd",pwd);
		List<UserBean> result = query.list();
		UserBean user = null;
		if(result != null && result.size() == 1) user = result.get(0); 
		
		//提交事务
		tx.commit();
		//关闭会话
		session.close();
		session = null;
		return user;
	}
	/**
	 * 修改用户的积分
	 * @param delta 积分变化量,可正可负
	 * @param id 用户id
	 */
	public void setPoint(int delta,int id){
		session = sessionFact.openSession();
		tx = session.beginTransaction();
		Query query = session.createQuery("update UserBean user set user.points=user.points+:delta where user.id=:id");
		query.setParameter("delta",delta);
		query.setParameter("id",id);
		query.executeUpdate();
		tx.commit();
		session.close();
		session = null;
	}
	/**
	 * 查询某个用户发布的 文档或信息 的条数
	 * @param type 查询类型.文档条数或者信息的条数
	 * @param id 用户id
	 * @return
	 */
	public long getCounts(String type,int id){
		long count = 0;
		session = sessionFact.openSession();
		tx = session.beginTransaction();
		String hql = "";
		if(type.equals("doc")) hql = "select count(*) from DocBean as doc where doc.user.id=:uid";
		else if(type.equals("info")) hql = "select count(*) from InfoBean as info where info.user.id=:uid";
		Query query = session.createQuery(hql);
		query.setParameter("uid",id);
		count = (Long)query.uniqueResult();
		tx.commit();
		session.close();
		session = null;
		return count;
	}
	
	public boolean existByCondition(String type,String value){
		session = sessionFact.openSession();
		tx = session.beginTransaction();
		String sql = "select count(*) from user where " + type + "=" + "'"+value+"'";
		Query query = session.createSQLQuery(sql);
		BigInteger count = (BigInteger)query.uniqueResult();
		tx.commit();
		session.close();
		session = null;
		System.out.println(count.intValue());
		return count.longValue() != 0 ? true : false;
	}
	
	@Test
	public void test(){
		System.out.println(login("jinj", "fffd"));
	}
}
