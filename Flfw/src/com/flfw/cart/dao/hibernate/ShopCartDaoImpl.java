package com.flfw.cart.dao.hibernate;

import java.sql.Timestamp;
import java.util.Iterator;
import java.util.List;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Transactional;

import com.flfw.cart.dao.ShopCartDao;
import com.flfw.cart.model.MmallCart;
import com.flfw.cart.service.ShopCartService;


public class ShopCartDaoImpl extends HibernateDaoSupport implements ShopCartDao {
	public void save(Object object){
		getHibernateTemplate().save(object);
	}
	@Transactional
	public List findAllShopCart(int userId){
		String queryString = "From MmallCart as cart,Mmallproduct as product where cart.productId=product.id and cart.userId="+userId;
		System.out.println(queryString);
		List list=getHibernateTemplate().find(queryString);
		/*System.out.println(list.size());
		Iterator it=list.iterator();
		while (it.hasNext()){
		MmallCart cartlist=(MmallCart)it.next();
		int productID=cartlist.getProductId();
		}*/
		System.out.println(list.size());
		return list;
	}
	@Transactional
	public void deleteCartProduct(int id){
		MmallCart mmallcart=new MmallCart();
		mmallcart.setId(id);
		getHibernateTemplate().delete(mmallcart);
		System.out.print("删除成功！！");
	}
	@Transactional
	public void updateCartProduct(int id,int userId,int quantity){
		Timestamp timestamp = new Timestamp(System.currentTimeMillis()); 
		MmallCart mmallcart=(MmallCart)getHibernateTemplate().get(MmallCart.class, id);  
		mmallcart.setId(id);
		mmallcart.setQuantity(quantity);
		mmallcart.setUpdateTime(timestamp);
		getHibernateTemplate().update("quantity",mmallcart);
		System.out.print("更新成功！");
	}
	@Transactional
	public void addcartproduct(int userId,int productId,int quantity){
		String sql = "From MmallCart as cart where cart.userId="+userId+" and cart.productId="+productId;
		System.out.println(sql);
		List<MmallCart> list=(List<MmallCart>)getHibernateTemplate().find(sql);
		if(list==null ||list.size()==0)
		{
			Timestamp timestamp = new Timestamp(System.currentTimeMillis()); 
			MmallCart mmallcart=new MmallCart();
			mmallcart.setUserId(userId);
			mmallcart.setProductId(productId);
			mmallcart.setQuantity(quantity);
			mmallcart.setChecked(0);
			mmallcart.setCreateTime(timestamp);
			mmallcart.setUpdateTime(timestamp);
			getHibernateTemplate().save(mmallcart);
		}
		else 
		{
			Timestamp timestamp = new Timestamp(System.currentTimeMillis()); 
			MmallCart mmallCart = list.get(0);
			quantity=mmallCart.getQuantity()+quantity;
			mmallCart.setQuantity(quantity);
			mmallCart.setUpdateTime(timestamp);
			getHibernateTemplate().update(mmallCart);
		}
	}
}
