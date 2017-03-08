/**
 * Created by jason2009
 * 2015年4月12日 下午7:19:41
 */
package conn;

import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

public class DBSessionFact {
	public static SessionFactory sessionFact = null;
	
	static{
		Configuration cfg = new Configuration().configure();
		ServiceRegistry reg = new StandardServiceRegistryBuilder()
			.applySettings(cfg.getProperties())
			.build();
		sessionFact = cfg.buildSessionFactory(reg);
	}
}
