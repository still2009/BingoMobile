/**
 * Created by jason2009
 * 2015年4月12日 下午8:02:07
 */
package test;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.junit.Test;

import conn.DBSessionFact;
import utils.Hash;

public class DaoTest {
	protected static SessionFactory sessionFact = DBSessionFact.sessionFact;
	protected Session session = null;
	protected Transaction tx = null;
	
	@Test
	public void testUser(){
		
		session = sessionFact.openSession();
		tx = session.beginTransaction();
		InputStream in = null;
		String fName = null;
		File f = null;
		String path = "B:\\workspace\\Eclipse\\bingo\\WebContent\\images\\";
		for(int i = 1;i < 33;i++){
			String fileName = "B:\\workspace\\Eclipse\\bingo\\WebContent\\images\\head ("+i+").jpg";
			try {
				f = new File(fileName);
				in = new FileInputStream(f);
				fName = Hash.MD5(in)+".jpg";
				f.renameTo(new File(path+fName));
				Query query = session.createSQLQuery("update user set head_pic=:fName where id=:uid");
				query.setParameter("fName",fName);
				query.setParameter("uid",i);
				query.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//提交事务
		tx.commit();
		//关闭会话
		session.close();
		session = null;
		
	}
	public void testInfo(){
		
	}
	public void testDoc(){
		
	}
}
