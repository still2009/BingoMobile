/**
 * Created by jason2009
 * 2015年4月12日 下午4:18:34
 */
package dao;

import java.math.BigInteger;
import java.util.List;

import org.hibernate.Query;
import org.junit.Test;

import bean.DocBean;
import bean.DocRelBean;

public class DocDao extends BasicDao{
	/**
	 * 获取最新发布的文档,默认取amount条记录
	 * @return
	 */
	public List<DocBean> getLatest(int amount){
		session = sessionFact.openSession();
		tx = session.beginTransaction();
		/*递增asc,递减desc*/
		Query query = session.createQuery("from DocBean as doc order by doc.docTime desc");
		query.setMaxResults(amount);
	    query.setFirstResult(0);
		List<DocBean> result = query.list();
		
		//提交事务
		tx.commit();
		//关闭会话
		session.close();
		session = null;
		return result;
	}
	
	/**
	 * 查询在某时间以后发布的数据库记录,最多十条
	 * @param time 时间毫秒数
	 * @return
	 */
	public List<DocBean> getAfter(long time){
		session = sessionFact.openSession();
		tx = session.beginTransaction();
		Query query = session.createQuery("from DocBean as doc where doc.docTime > :time order by doc.docTime desc");
		query.setParameter("time",time);
		query.setMaxResults(10);
	    query.setFirstResult(0);
		List<DocBean> result = query.list();
		
		//提交事务
		tx.commit();
		//关闭会话
		session.close();
		session = null;
		return result;
	}
	
	/**
	 * 在user2doc表中插入一条记录,记录用户下载或收藏的动作
	 * @param docRel 封装好的DocRelBean
	 */
	public void recordDoc(DocRelBean docRel){
		session = sessionFact.openSession();
		tx = session.beginTransaction();
		Query query = session.createQuery("from DocRelBean as rel where rel.user.id=:uid and rel.doc.id=:did");
		List<DocRelBean> result = query.list();
		if(result != null && result.size() != 0) update(docRel);
		else insert(docRel);
		//提交事务
		tx.commit();
		//关闭会话
		session.close();
		session = null;
	}
	/**
	 * 获得某个用户下载或者收藏过的文档
	 * @param uid 用户id
	 * @param type 关系类型 下载或收藏
	 * @return
	 */
	public List<DocRelBean> getUserRelDoc(int uid,String type){
		session = sessionFact.openSession();
		tx = session.beginTransaction();
		Query query = session.createQuery("from DocRelBean as rel where rel.user.id=:uid and rel.relType=:type");
		query.setParameter("uid", uid);
		query.setParameter("type", type);
		List<DocRelBean> list = (List<DocRelBean>)query.list();
		tx.commit();
		session.close();
		session = null;
		return list;
	}
	//以前是否下载过指定的文档
	public DocRelBean getDownloadDocRel(int uid,int id){
		session = sessionFact.openSession();
		tx = session.beginTransaction();
		Query query = session.createQuery("from DocRelBean as rel where rel.user.id=:uid and rel.doc.id=:id and rel.relType='下载'");
		query.setParameter("uid", uid);
		query.setParameter("id", id);
		DocRelBean bean = (DocRelBean)query.uniqueResult();
		tx.commit();
		session.close();
		session = null;
		return bean;
	}
	//添加doc收藏记录
	public String insertCollection(int uid,int id){
		String msg = "collected";
		session = sessionFact.openSession();
		tx = session.beginTransaction();
		Query query = session.createSQLQuery("select count(*) from user2doc where user_id=:uid and doc_id=:id");
		query.setParameter("uid", uid);
		query.setParameter("id", id);
		BigInteger count = (BigInteger)query.uniqueResult();
		if(count.intValue() == 0){
			query = session.createSQLQuery("insert into user2doc values(:uid,:id,'收藏',:time)");
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
	//插入下载记录
	public String insertDownload(int uid,int id){
		String msg = null;
		session = sessionFact.openSession();
		tx = session.beginTransaction();
		Query query = session.createQuery("from DocRelBean as rel where rel.user.id=:uid and rel.doc.id=:id");
		query.setParameter("uid", uid);
		query.setParameter("id", id);
		DocRelBean rel = null;
		List list = query.list();
		if(list != null && list.size() >= 1) rel = (DocRelBean)list.get(0);
		if(rel == null){
			query = session.createSQLQuery("insert into user2doc values(:uid,:id,'下载',:time)");
			query.setParameter("uid",uid);
			query.setParameter("id",id);
			query.setParameter("time",System.currentTimeMillis());
			int nums = query.executeUpdate();
			if(nums > 0) msg = "success";
			else msg="fail";
		}else{
			query = session.createSQLQuery("update user2doc set rel_type='下载',rel_time=:time where user_id=:uid and doc_id=:id");
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
	//插入打印订单
	public boolean insertOrder(int uid,int docId,int price,String docTitle){
		session = sessionFact.openSession();
		tx = session.beginTransaction();
		Query query = session.createSQLQuery("insert order_list "
				+ "(user_id,doc_id,price,order_time,doc_title,order_status) "
				+ "values(:uid,:did,:price,:time,:title,'未确认')");
		query.setParameter("uid",uid);
		query.setParameter("did",docId);
		query.setParameter("price",price);
		query.setParameter("time",System.currentTimeMillis());
		query.setParameter("title",docTitle);
		int num = query.executeUpdate();
		tx.commit();
		session.close();
		session = null;
		return num >= 1 ? true : false;
	}
	public List<DocBean> searchDoc(String word){
		session = sessionFact.openSession();
		tx = session.beginTransaction();
		Query query = session.createQuery("from DocBean as doc where doc.docTitle like '%"+word+"%'"
				+ " or doc.docTag like '%"+word+"%' or doc.docBranch like '%"+word+"%'"
						+ " or doc.docDescription like '%"+word+"%'");
		List<DocBean> list = query.list();
		tx.commit();
		session.close();
		session = null;
		return list;
	}
	@Test
	public void test(){
		System.out.println(insertOrder(1,1,1,"xxx"));
	}
}
