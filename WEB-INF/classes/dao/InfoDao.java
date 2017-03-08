/**
 * Created by jason2009
 * 2015年4月12日 下午3:31:45
 */
package dao;

import java.math.BigInteger;
import java.util.List;

import org.hibernate.Query;
import org.junit.Test;

import bean.DocBean;
import bean.InfoBean;
import bean.InfoRelBean;

public class InfoDao extends BasicDao{
	/**
	 * 获取最新发布的信息,服务
	 * @param amount 查询的总数
	 * @return
	 */
	public List<InfoBean> getLatestService(int amount){
		session = sessionFact.openSession();
		tx = session.beginTransaction();
		Query query = session.createQuery("from InfoBean as info where info.infoDirection=-1 order by info.infoTime desc");
		query.setMaxResults(amount);
	    query.setFirstResult(0);
		List<InfoBean> service = query.list();
		//提交事务
		tx.commit();
		//关闭会话
		session.close();
		session = null;
		return service;
	}
	/**
	 * 查询最新发布的需求
	 * @param amount 查询条数
	 * @return
	 */
	public List<InfoBean> getLatestRequest(int amount){
		session = sessionFact.openSession();
		tx = session.beginTransaction();
		/*递增asc,递减desc*/
		/*查询发布的需求*/
		Query query = session.createQuery("from InfoBean as info where info.infoDirection=1 order by info.infoTime desc");
		query.setMaxResults(amount);
	    query.setFirstResult(0);
		List<InfoBean> request = query.list();
		//提交事务
		tx.commit();
		//关闭会话
		session.close();
		session = null;
		return request;
	}
	
	/**
	 * 查询指定时间后发布的服务
	 * @param time 时间
	 * @return
	 */
	public List<InfoBean> getServiceAfter(long time){
		session = sessionFact.openSession();
		tx = session.beginTransaction();
		/*查询服务*/
		Query query = session.createQuery("from InfoBean as info where info.infoDirection=-1 and info.infoTime > :time order by info.infoTime desc");
		query.setParameter("time",time);
		query.setMaxResults(5);
	    query.setFirstResult(0);
		List<InfoBean> service = query.list();
		//提交事务
		tx.commit();
		//关闭会话
		session.close();
		session = null;
		return service;
	}
	/**
	 * 查询指定时间后发布的需求
	 * @param time 时间
	 * @return
	 */
	public List<InfoBean> getRequestAfter(long time){
		session = sessionFact.openSession();
		tx = session.beginTransaction();
		/*查询需求*/
		Query query = session.createQuery("from InfoBean as info where info.infoDirection=1 and info.infoTime > :time order by info.infoTime desc");
		query.setParameter("time", time);
		query.setMaxResults(5);
	    query.setFirstResult(0);
		List<InfoBean> request = query.list();
		
		//提交事务
		tx.commit();
		//关闭会话
		session.close();
		session = null;
		return request;
	}
	/**
	 * 更新信息发布者的状态信息
	 * @param status 状态
	 * @param id 信息id
	 */
	public void updateStatusR(String status,int id){
		session = sessionFact.openSession();
		tx = session.beginTransaction();
		Query query = session.createSQLQuery("update info set info_status=:stat where id=:id");
		query.setParameter("stat",status);
		query.setParameter("id",id);
		query.executeUpdate();
		tx.commit();
		session.close();
		session = null;
	}
	
	/**
	 * 更新信息参与者的状态信息
	 * @param status 信息状态
	 * @param userId 参与用户的id
	 * @param infoId 该条信息的id
	 */
	public void updateStatusP(String status,int userId,int infoId){
		session = sessionFact.openSession();
		tx = session.beginTransaction();
		Query query = session.createSQLQuery("update user2info set rel_status=:stat,rel_time=:time"
				+ " where user_id=:uid and info_id=:iid");
		query.setParameter("stat",status);
		query.setParameter("time",System.currentTimeMillis());
		query.setParameter("uid",userId);
		query.setParameter("iid",infoId);
		query.executeUpdate();
		tx.commit();
		session.close();
		session = null;
	}
	/**
	 * 获得某个用户参与或者收藏过的信息
	 * @param uid 用户id
	 * @return
	 */
	public List<InfoRelBean> getUserRelInfo(int uid,String type){
		session = sessionFact.openSession();
		tx = session.beginTransaction();
		Query query = session.createQuery("from InfoRelBean as rel where rel.user.id=:uid and rel.relType=:type");
		query.setParameter("uid",uid);
		query.setParameter("type",type);
		List<InfoRelBean> list = (List<InfoRelBean>)query.list();
		tx.commit();
		session.close();
		session = null;
		return list;
	}
	//exist Rel
	public InfoRelBean getUserRelInfo(int uid,int infoId){
		session = sessionFact.openSession();
		tx = session.beginTransaction();
		Query query = session.createQuery("from InfoRelBean as rel where rel.user.id=:uid and rel.info.id=:iid");
		query.setParameter("uid",uid);
		query.setParameter("iid",infoId);
		InfoRelBean bean = (InfoRelBean)query.uniqueResult();
		tx.commit();
		session.close();
		session = null;
		return bean;
	}
	//添加info收藏记录
	public String insertCollection(int uid,int id){
		String msg = "collected";
		session = sessionFact.openSession();
		tx = session.beginTransaction();
		Query query = session.createSQLQuery("select count(*) from user2info where user_id=:uid and info_id=:id");
		query.setParameter("uid", uid);
		query.setParameter("id", id);
		BigInteger count = (BigInteger)query.uniqueResult();
		if(count.intValue() == 0){
			query = session.createSQLQuery("insert into user2info values(:uid,:id,'收藏',:time,'收藏',null)");
			query.setParameter("uid",uid);
			query.setParameter("id",id);
			query.setParameter("time",System.currentTimeMillis());
			int nums = query.executeUpdate();
			if(nums > 0) msg = "success";
			else msg="fail";
		}
		tx.commit();
		session.close();
		session = null;
		return msg;
	}
	public List<InfoBean> searchInfo(String word){
		session = sessionFact.openSession();
		tx = session.beginTransaction();
		Query query = session.createQuery("from InfoBean as info where info.infoTitle like '%"+word+"%' "
				+ "or info.infoTag like '%"+word+"%' or info.infoContent like '%"+word+"%'");
		List<InfoBean> list = query.list();
		tx.commit();
		session.close();
		session = null;
		return list;
	}
	@Test
	public void test(){
		updateStatusR("等待预约", 1);
	}
	
}
