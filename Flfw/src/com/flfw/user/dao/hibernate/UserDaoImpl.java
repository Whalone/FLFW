package com.flfw.user.dao.hibernate;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import com.flfw.user.dao.UserDao;
import com.flfw.user.model.MmallUser;

public class UserDaoImpl extends HibernateDaoSupport implements UserDao {
	private static final Log log = LogFactory.getLog(UserDaoImpl.class); //创建日志
	public static final String userClassName = "MmallUser";
	public static final String username = "username";
	public static final String password = "password";
	public static final String userID = "id";
	
	public void save(MmallUser user) {
		log.info("增加顾客："+user.getUsername());
 
		getHibernateTemplate().save(user);
	}
	
	public void update(MmallUser user) {
		log.info("更新该ID顾客信息："+ user.getId());
		getHibernateTemplate().update(user);
	}

	
	public List findByTwoProperty(String property1, String property2, Object value1, Object value2) {
		String query = "From MmallUser as model where model."+ property1 + "='"+ value1 +
				"' and model."+ property2 + "='" + value2 + "'";
		
		
		List result = getHibernateTemplate().find(query);
		return result;
	}
	
	public List findByUserIdPwd(Object userName, Object pwd) {
		List result = findByTwoProperty(username, password , userName, pwd);
		return result;
	}

	/**
	 * 提供一个字段及字段值，返回List
	 */
	public List findByOneProperty(String className,String property,Object value){
		String query = "From " + className + " as model where model." + property
		+ "= '" + value + "'";
		List results = getHibernateTemplate().find(query);
		return results;
	}
	
	/**
	 * 通过顾客名查找
	 * 这里的id指的是名字 不是主键id
	 */
	public List findByUserId(Object userName) {
		log.info("查找客户名：" + userName);
		List results = findByOneProperty(userClassName, username, userName);
		return results;
	}
	
	/**
	 * 通过顾客ID查找
	 */
	public List findByID(Object ID){
		log.info("查找该ID密码：" + ID);
		List result = findByOneProperty(userClassName, userID, ID);
		return result;
	}




	
	


}
