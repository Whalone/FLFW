package com.flfw.order.controler;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpServletRequest;

import com.flfw.cart.service.ShopCartService;
import com.flfw.index.service.ProductsService;
import org.apache.struts2.ServletActionContext;

import com.flfw.order.model.Order;
import com.flfw.order.model.OrderItem;
import com.flfw.order.model.Shipping;
import com.flfw.order.service.OrderService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class OrderAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5761052564689236292L;
	
	private OrderService orderService;
	private ProductsService productsService;
	private ShopCartService shopCartService;
	private Shipping shipping;

	public void setProductsService(ProductsService productsService) {
		this.productsService = productsService;
	}

	public void setShopCartService(ShopCartService shopCartService) {
		this.shopCartService = shopCartService;
	}

	public Shipping getShipping() {
		return shipping;
	}

	public void setShipping(Shipping shipping) {
		this.shipping = shipping;
	}
	

	public OrderService getOrderService() {
		return orderService;
	}
	
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	public String DeleteOrderbyUser(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String id=request.getParameter("id");
		System.out.println("订单号："+ id);
		orderService.updateOrderStatus(id, 1);
		orderService.updateAllOrderByUserid();
		return SUCCESS;
	}
	
	public String UpdateOrderbyUser(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String id=request.getParameter("id");
		int userid=(int)request.getSession().getAttribute("userID");
		String nowstatus=request.getParameter("nowstatus");
		if(nowstatus.equals("10")){
			orderService.updateOrderStatus(id, 20);
		}
		else if(nowstatus.equals("40")){
			orderService.updateOrderStatus(id, 50);
			List<Order> list=orderService.findOrderByUserid(userid);
			for(Order o:list){
				System.out.println(o.getOrder_no());
				for(OrderItem i:o.getOrderItems()){
					System.out.println(i.getProduct_id());
					int product = i.getProduct_id();
					int sellnumber = i.getQuantity();
					productsService.productSell(product,sellnumber);
				}
			}


		}
		orderService.updateAllOrderByUserid();
		return SUCCESS;
	}
	
	public String CancelOrderbyUser(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String id=request.getParameter("id");
		System.out.println("订单号："+ id);
		orderService.updateOrderStatus(id, 60);
		orderService.updateAllOrderByUserid();
		return SUCCESS;
	}

	public String AddOrderbyCart(){
		ActionContext ac=ActionContext.getContext();	//获得ActionContext对象
		Order order=new Order();
		int user_id=(int)ac.getSession().get("userID");	//获取用户id
		List<String[]> cartProuctList=new ArrayList<String[]>();
		cartProuctList=(List<String[]>)ac.getSession().get("payfor_list");	//获取购物车中的商品集合
		String orderpayment=(String)ac.getSession().get("Payfor_price");
		HttpServletRequest request = ServletActionContext.getRequest();
		int shippingid=Integer.parseInt(request.getParameter("shippingid"));
//		购物项为空返回首页
		if(ac.getSession().get("payfor_list")==null){
			return "home";
		}
		//获取购物项
		BigDecimal payment=new BigDecimal(orderpayment);
		/*DecimalFormat df=new DecimalFormat("0.##");
		String py=df.format(payment);
		System.out.println(py);*/
		String order_no="";
		DateFormat format=new SimpleDateFormat("yyMMddHHmmss");
		String formatDate=format.format(new Date());
		int random =new Random().nextInt(100000);
		order_no +=formatDate+random;
		/*order_no=order_no.substring(0, 16);*/
		for(int i=0;i<cartProuctList.size();i++){
				OrderItem orderItem=new OrderItem();
				orderItem.setUser_id(user_id);
				orderItem.setProduct_id(Integer.parseInt(cartProuctList.get(i)[1]));
				orderItem.setProduct_name(cartProuctList.get(i)[2]);
				orderItem.setProduct_image(cartProuctList.get(i)[6]);
				orderItem.setCurrent_unit_price(new BigDecimal(cartProuctList.get(i)[5]));
				orderItem.setQuantity(Integer.parseInt(cartProuctList.get(i)[4]));
				orderItem.setTotal_price(new BigDecimal(cartProuctList.get(i)[7]));
				orderItem.setCreate_time(new Timestamp(new Date().getTime()));
				orderItem.setUpdate_time(new Timestamp(new Date().getTime()));
				order.getOrderItems().add(orderItem);
		}
		order.setOrder_no(order_no);
		order.setUser_id(user_id);
		order.setShipping_id(shippingid);
		order.setPayment(payment);
		order.setPayment_type(1);
		order.setPostage(0);
		order.setStatus(10);
		order.setCreate_time(new Timestamp(new Date().getTime()));
		order.setUpdate_time(new Timestamp(new Date().getTime()));
		orderService.add(order);
		for(int i=0;i<cartProuctList.size();i++) {
			if (Integer.parseInt(cartProuctList.get(i)[0])!=0){
				shopCartService.delete_ProductCart(Integer.parseInt(cartProuctList.get(i)[0]));
			}
		}
		ac.getSession().put("old",cartProuctList);
		ac.getSession().remove("payfor_list");
		ac.getSession().remove("Payfor_price");
		orderService.updateAllOrderByUserid();
		return SUCCESS;
	}

}
