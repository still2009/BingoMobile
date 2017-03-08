/**
 * Created by jason2009
 * 2015年4月12日 下午7:23:34
 */
package dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.junit.Test;

import bean.InfoBean;
import conn.DBSessionFact;

public class BasicDao {
	protected static final int MAX_RESULT = 10;
	protected static SessionFactory sessionFact = DBSessionFact.sessionFact;
	protected Session session = null;
	protected Transaction tx = null;
	
	public void insert(Object obj){
		//打开会话
		session = sessionFact.openSession();
		//开启事务
		tx = session.beginTransaction();
		//具体操作
		session.save(obj);
		//提交事务
		tx.commit();
		//关闭会话
		session.close();
		session = null;
	}
	
	public void insertAll(List<Object> objList){
		//打开会话
		session = sessionFact.openSession();
		//开启事务
		tx = session.beginTransaction();
		//具体操作
		for(int i = 0;i < objList.size();i++){
			session.save(objList.get(i));
			if(i % 20 == 0){
				session.flush();
				session.clear();
			}
		}
		//提交事务
		tx.commit();
		//关闭会话
		session.close();
		session = null;
	}
	
	public Object get(Class cls,int id){
		Object obj = null;
		//打开会话
		session = sessionFact.openSession();
		//开启事务
		tx = session.beginTransaction();
		//具体操作
		obj = session.get(cls,id);
		//提交事务
		tx.commit();
		//关闭会话
		session.close();
		session = null;
		return obj;
	}
	
	public List<Object> getAll(Class cls){
		//打开会话
		session = sessionFact.openSession();
		//开启事务
		tx = session.beginTransaction();
		//具体操作
		Query query = session.createQuery("from :class as u");
		query.setParameter("class",cls.getClass().getSimpleName());
		List<Object> lst = query.list();
		//提交事务
		tx.commit();
		//关闭会话
		session.close();
		session = null;
		return lst;
	}
	
	public void update(Object obj){
		//打开会话
		session = sessionFact.openSession();
		//开启事务
		tx = session.beginTransaction();
		//具体操作
		session.update(obj);
		//提交事务
		tx.commit();
		//关闭会话
		session.close();
		session = null;
	}
	
	public void updateAll(List<Object> objList){
		//打开会话
		session = sessionFact.openSession();
		//开启事务
		tx = session.beginTransaction();
		//具体操作
		for(int i = 0;i < objList.size();i++){
			session.update(objList.get(i));
			if(i % 20 == 0){
				session.flush();
				session.clear();
			}
		}
		//提交事务
		tx.commit();
		//关闭会话
		session.close();
		session = null;
	}
	
	public void delete(Object obj){
		//打开会话
		session = sessionFact.openSession();
		//开启事务
		tx = session.beginTransaction();
		//具体操作
		session.delete(obj);
		//提交事务
		tx.commit();
		//关闭会话
		session.close();
		session = null;
	}
	
	public void deleteAll(List<Object> objList){
		//打开会话
		session = sessionFact.openSession();
		//开启事务
		tx = session.beginTransaction();
		//具体操作
		for(int i = 0;i < objList.size();i++){
			session.delete(objList.get(i));
		}
		//提交事务
		tx.commit();
		//关闭会话
		session.close();
		session = null;
	}
	
	@Test
	public void test(){
		System.out.println(get(InfoBean.class,10));
	}
}
