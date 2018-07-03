<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>订单管理</title>

		<link href="./flfw/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="./flfw/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="./flfw/css/personal.css" rel="stylesheet" type="text/css">
		<link href="./flfw/css/orstyle.css" rel="stylesheet" type="text/css">

		<script src="./flfw/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
		<script src="./flfw/AmazeUI-2.4.2/assets/js/amazeui.js"></script>

  </head>
  <%
		String a = "<a href='./login.jsp' target='_top' class='h'>亲，请登录。</a>";
		String nickname = (String)request.getSession().getAttribute("nickname");
		if(nickname!=null){
			a = "<a href='./information.jsp' target='_top' class='h'>欢迎你，"+nickname+"。</a>"+
				"<a href='exit.action'target='_top' class='h'>退出登录</a>";
		}
	%>
  <body>
		<!--头 -->
		<header>
			<article>
				<div class="mt-logo">
					<!--顶部导航条 -->
					<div class="am-container header">
						<ul class="message-l">
							<div class="topMessage">
								<div class="menu-hd">
									<%=a%>
								</div>
							</div>
						</ul>
						<ul class="message-r">
							<div class="topMessage home">
								<div class="menu-hd"><a href="/Flfw/index.jsp" target="_top" class="h">商城首页</a></div>
							</div>
							<div class="topMessage my-shangcheng">
								<div class="menu-hd MyShangcheng"><a href="/Flfw/information.action"  target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a></div>
							</div>
							<div class="topMessage mini-cart">
								<div class="menu-hd"><a id="mc-menu-hd" href="/Flfw/showshopcart.action" target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong id="J_MiniCartNum" class="h"></strong></a></div>
							</div>
							<div class="topMessage favorite">
								
						</ul>
						</div>

						<!--悬浮搜索框-->

						<div class="nav white">
							<div class="logoBig">
								<li><img src="./images/logo.jpg" /></li>
							</div>

							<div class="search-bar pr">
								<a name="index_none_header_sysc" href="#"></a>
								<form>
									<input id="searchInput" name="index_none_header_sysc" type="text" placeholder="搜索" autocomplete="off">
									<input id="ai-topsearch" class="submit am-btn" value="搜索" index="1" type="submit">
								</form>
							</div>
						</div>

						<div class="clear"></div>
					</div>
				</div>
			</article>
		</header>
            <div class="nav-table">
					   <div class="long-title"><span class="all-goods">全部分类</span></div>
					   <div class="nav-cont">
							<ul>
								<li class="index"><a href="#">首页</a></li>
							</ul>
						    <div class="nav-extra">
						    </div>
						</div>
			</div>
			<b class="line"></b>
		<div class="center">
			<div class="col-main">
				<div class="main-wrap">

					<div class="user-order">

						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">订单管理</strong> / <small>Order</small></div>
						</div>
						<hr/>

						<div class="am-tabs am-tabs-d2 am-margin" data-am-tabs>

							<ul class="am-avg-sm-5 am-tabs-nav am-nav am-nav-tabs">
								<li class="am-active"><a href="#tab1">所有订单</a></li>
								<li><a href="#tab2">待付款</a></li>
								<li><a href="#tab3">待发货</a></li>
								<li><a href="#tab4">待收货</a></li>
								<li><a href="#tab5">已完成</a></li>
							</ul>

							<div class="am-tabs-bd">
								<div class="am-tab-panel am-fade am-in am-active" id="tab1">
									<div class="order-top">
										<div class="th th-item">
											<td class="td-inner">商品</td>
										</div>
										<div class="th th-price">
											<td class="td-inner">单价</td>
										</div>
										<div class="th th-number">
											<td class="td-inner">数量</td>
										</div>
										<div class="th th-operation">
											<td class="td-inner">商品操作</td>
										</div>
										<div class="th th-amount">
											<td class="td-inner">合计</td>
										</div>
										<div class="th th-status">
											<td class="td-inner">交易状态</td>
										</div>
										<div class="th th-change">
											<td class="td-inner">交易操作</td>
										</div>
									</div>

									<div class="order-main">
										<div class="order-list">
											
											<!--所有订单-->
											<s:iterator value="#session.orderListbyHistory" status="st" var="o">
											<div class="order-status5">
												<div class="order-title">
													<div class="dd-num">订单编号：<a href="javascript:;"><s:property value="order_no"/></a></div>
													<span>成交时间：<s:property value="create_time"/></span>
												</div>
												<div class="order-content">
													<div class="order-left">
													<s:iterator value="#session.orderListbyHistory.{orderItems}[#st.index]">
													
														<ul class="item-list">
															<li class="td td-item">
																<div class="item-pic">
																	<a href="#" class="J_MakePoint">
																		<img src= <s:property value="product_image"/> class="itempic J_ItemImg">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="#">
																			<p><s:property value="product_name"/></p>
														
																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	<s:property value="current_unit_price"/>
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>×</span><s:property value="quantity"/>
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">
																	
																</div>
															</li>
														</ul>
														
														</s:iterator>
													</div>
													<div class="order-right">
														<li class="td td-amount">
															<div class="item-amount">
																合计：<s:property value="payment"/>
																<p>含运费：<span><s:property value="postage"/></span></p>
															</div>
														</li>
														<div class="move-right">
															<li class="td td-status">
																<div class="item-status">
																	<p class="Mystatus">
																	<s:if test="status==10">待付款</s:if>
																	<s:if test="status==20">待发货</s:if>
																	<s:if test="status==30">已发货</s:if>
																	<s:if test="status==40">待收货</s:if>
																	<s:if test="status==50">交易成功</s:if>
																	<s:if test="status==60">交易取消</s:if>
																	</p>
																	<p class="order-info"><a href="orderinfo.html">订单详情</a></p>
																	<p class="order-info"><a href="logistics.html">查看物流</a></p>
																</div>
															</li>
															<li class="td td-change">
																<div class="am-btn am-btn-danger anniu">
																	<a href="javascript:if(confirm('确实要删除该订单吗?'))location='/Flfw/userDeleteOrderAction?id=${ order_no }'" style="color:white;">删除订单</a></div>
															</li>
														</div>
													</div>
												</div>
											</div>
											</s:iterator>
											<s:actionerror/>
										</div>
									</div>
								</div>
								
								
								
								
								<!-- 待付款 -->
								<div class="am-tab-panel am-fade" id="tab2">
									<div class="order-top">
										<div class="th th-item">
											<td class="td-inner">商品</td>
										</div>
										<div class="th th-price">
											<td class="td-inner">单价</td>
										</div>
										<div class="th th-number">
											<td class="td-inner">数量</td>
										</div>
										<div class="th th-operation">
											<td class="td-inner">商品操作</td>
										</div>
										<div class="th th-amount">
											<td class="td-inner">合计</td>
										</div>
										<div class="th th-status">
											<td class="td-inner">交易状态</td>
										</div>
										<div class="th th-change">
											<td class="td-inner">交易操作</td>
										</div>
									</div>
									<s:iterator value="#session.orderListbyHistory" status="st">
									<s:if test="status==10">
									<div class="order-main">
										<div class="order-list">
											<div class="order-status1">
												<div class="order-title">
													<div class="dd-num">订单编号：<a href="javascript:;"><s:property value="order_no"/></a></div>
													<span>成交时间：<s:property value="create_time"/></span>
												</div>
												<div class="order-content">
													<div class="order-left">
													<s:iterator value="#session.orderListbyHistory.{orderItems}[#st.index]">
														<ul class="item-list">
															<li class="td td-item">
																<div class="item-pic">
																	<a href="#" class="J_MakePoint">
																		<img src=<s:property value="product_image"/> class="itempic J_ItemImg">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="#">
																			<p><s:property value="product_name"/></p>
																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	<s:property value="current_unit_price"/>
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>×</span><s:property value="quantity"/>
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">
																
																</div>
															</li>
														</ul>
														</s:iterator>
														
													</div>
													<div class="order-right">
														<li class="td td-amount">
															<div class="item-amount">
																合计：<s:property value="payment"/>
																<p>含运费：<span><s:property value="postage"/></span></p>
															</div>
														</li>
														<div class="move-right">
															<li class="td td-status">
																<div class="item-status">
																	<p class="Mystatus">
																	<s:if test="status==10">待付款</s:if>
																	<s:if test="status==20">待发货</s:if>
																	<s:if test="status==30">已发货</s:if>
																	<s:if test="status==40">待收货</s:if>
																	<s:if test="status==50">交易成功</s:if>
																	<s:if test="status==60">交易取消</s:if>
																	</p>
																	<p class="order-info"><a href="javascript:if(confirm('确认取消订单吗?')){alert('已成功取消订单');location='/Flfw/userCancelOrderAction?id=${ order_no }';}">取消订单</a></p>

																</div>
															</li>
															<li class="td td-change">
																<a href="pay.html">
																<div class="am-btn am-btn-danger anniu">
																	<a href="javascript:if(confirm('确认支付吗?')){alert('已成功支付，我们将会尽快安排发货');location='/Flfw/userUpdateOrderAction?id=${ order_no }&nowstatus=${ status }';}" style="color:white;">
																	一键支付</a></div></a>
															</li>
														</div>
													</div>

												</div>
											</div>
										</div>
									</div>
									</s:if>
									</s:iterator>
								</div>
								
								
								
								
								<!-- 待发货 -->
								<div class="am-tab-panel am-fade" id="tab3">
									<div class="order-top">
										<div class="th th-item">
											<td class="td-inner">商品</td>
										</div>
										<div class="th th-price">
											<td class="td-inner">单价</td>
										</div>
										<div class="th th-number">
											<td class="td-inner">数量</td>
										</div>
										<div class="th th-operation">
											<td class="td-inner">商品操作</td>
										</div>
										<div class="th th-amount">
											<td class="td-inner">合计</td>
										</div>
										<div class="th th-status">
											<td class="td-inner">交易状态</td>
										</div>
										<div class="th th-change">
											<td class="td-inner">交易操作</td>
										</div>
									</div>
									<s:iterator value="#session.orderListbyHistory" status="st">
									<s:if test="status==20">
									<div class="order-main">
										<div class="order-list">
											<div class="order-status2">
												<div class="order-title">
													<div class="dd-num">订单编号：<a href="javascript:;"><s:property value="order_no"/></a></div>
													<span>成交时间：<s:property value="create_time"/></span>
												</div>
												<div class="order-content">
													<div class="order-left">
													<s:iterator value="#session.orderListbyHistory.{orderItems}[#st.index]">
														<ul class="item-list">
															<li class="td td-item">
																<div class="item-pic">
																	<a href="#" class="J_MakePoint">
																		<img src=<s:property value="product_image"/> class="itempic J_ItemImg">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="#">
																			<p><s:property value="product_name"/></p>
																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	<s:property value="current_unit_price"/>
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>×</span><s:property value="quantity"/>
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">
																	<a href="refund.html">退款</a>
																</div>
															</li>
														</ul>
														</s:iterator>	
													</div>
													<div class="order-right">
														<li class="td td-amount">
															<div class="item-amount">
																合计：<s:property value="payment"/>
																<p>含运费：<span><s:property value="postage"/></span></p>
															</div>
														</li>
														<div class="move-right">
															<li class="td td-status">
																<div class="item-status">
																	<p class="Mystatus">
																	<s:if test="status==10">待付款</s:if>
																	<s:if test="status==20">待发货</s:if>
																	<s:if test="status==30">已发货</s:if>
																	<s:if test="status==40">待收货</s:if>
																	<s:if test="status==50">交易成功</s:if>
																	<s:if test="status==60">交易取消</s:if>
																	</p>
																	<p class="order-info"><a href="orderinfo.html">订单详情</a></p>
																</div>
															</li>
															<li class="td td-change">
																<div class="am-btn am-btn-danger anniu">
																	<a href="javascript:alert('已成功提醒卖家发货！')" style="color:white;">提醒发货</a></div>
															</li>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									</s:if>
									</s:iterator>
								</div>
								
								
								
								
								<!-- 待收货 -->
								<div class="am-tab-panel am-fade" id="tab4">
									<div class="order-top">
										<div class="th th-item">
											<td class="td-inner">商品</td>
										</div>
										<div class="th th-price">
											<td class="td-inner">单价</td>
										</div>
										<div class="th th-number">
											<td class="td-inner">数量</td>
										</div>
										<div class="th th-operation">
											<td class="td-inner">商品操作</td>
										</div>
										<div class="th th-amount">
											<td class="td-inner">合计</td>
										</div>
										<div class="th th-status">
											<td class="td-inner">交易状态</td>
										</div>
										<div class="th th-change">
											<td class="td-inner">交易操作</td>
										</div>
									</div>
									<s:iterator value="#session.orderListbyHistory" status="st">
									<s:if test="status==40">
									<div class="order-main">
										<div class="order-list">
											<div class="order-status3">
												<div class="order-title">
													<div class="dd-num">订单编号：<a href="javascript:;"><s:property value="order_no"/></a></div>
													<span>成交时间：<s:property value="create_time"/></span>
												</div>
												<div class="order-content">
													<div class="order-left">
													<s:iterator value="#session.orderListbyHistory.{orderItems}[#st.index]">
														<ul class="item-list">
															<li class="td td-item">
																<div class="item-pic">
																	<a href="#" class="J_MakePoint">
																		<img src=<s:property value="product_image"/> class="itempic J_ItemImg">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="#">
																			<p><s:property value="product_name"/></p>
																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	<s:property value="current_unit_price"/>
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>×</span><s:property value="quantity"/>
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">
																	<a href="refund.html">退款/退货</a>
																</div>
															</li>
														</ul>
														</s:iterator>
													</div>
													<div class="order-right">
														<li class="td td-amount">
															<div class="item-amount">
																合计：<s:property value="payment"/>
																<p>含运费：<span><s:property value="postage"/></span></p>
															</div>
														</li>
														<div class="move-right">
															<li class="td td-status">
																<div class="item-status">
																	<p class="Mystatus">
																	<s:if test="status==10">待付款</s:if>
																	<s:if test="status==20">待发货</s:if>
																	<s:if test="status==30">已发货</s:if>
																	<s:if test="status==40">待收货</s:if>
																	<s:if test="status==50">交易成功</s:if>
																	<s:if test="status==60">交易取消</s:if>
																	</p>
																	<p class="order-info"><a href="orderinfo.html">订单详情</a></p>
																	<p class="order-info"><a href="logistics.html">查看物流</a></p>
																	<p class="order-info"><a href="#">延长收货</a></p>
																</div>
															</li>
															<li class="td td-change">
																<div class="am-btn am-btn-danger anniu">
																	<a href="javascript:if(confirm('确认收到货物了吗?'))location='/Flfw/userUpdateOrderAction?id=${ order_no }&nowstatus=${ status }'" style="color:white;">确认收货</a></div>
															</li>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									</s:if>
									</s:iterator>
								</div>
								
								
								
								
								<!-- 交易完成 -->
								<div class="am-tab-panel am-fade" id="tab5">
									<div class="order-top">
										<div class="th th-item">
											<td class="td-inner">商品</td>
										</div>
										<div class="th th-price">
											<td class="td-inner">单价</td>
										</div>
										<div class="th th-number">
											<td class="td-inner">数量</td>
										</div>
										<div class="th th-operation">
											<td class="td-inner">商品操作</td>
										</div>
										<div class="th th-amount">
											<td class="td-inner">合计</td>
										</div>
										<div class="th th-status">
											<td class="td-inner">交易状态</td>
										</div>
										<div class="th th-change">
											<td class="td-inner">交易操作</td>
										</div>
									</div>
									<s:iterator value="#session.orderListbyHistory" status="st">
									<s:if test="status==50">
									<div class="order-main">
										<div class="order-list">
										<div class="order-status4">
												<div class="order-title">
													<div class="dd-num">订单编号：<a href="javascript:;"><s:property value="order_no"/></a></div>
													<span>成交时间：<s:property value="create_time"/></span>
												</div>
												<div class="order-content">
													<div class="order-left">
													<s:iterator value="#session.orderListbyHistory.{orderItems}[#st.index]">
														<ul class="item-list">
															<li class="td td-item">
																<div class="item-pic">
																	<a href="#" class="J_MakePoint">
																		<img src=<s:property value="product_image"/> class="itempic J_ItemImg">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="#">
																			<p><s:property value="product_name"/></p>
																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	<s:property value="current_unit_price"/>
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>×</span><s:property value="quantity"/>
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">
																	<a href="refund.html">退款/退货</a>
																</div>
															</li>
														</ul>
														</s:iterator>
													</div>
													<div class="order-right">
														<li class="td td-amount">
															<div class="item-amount">
																合计：<s:property value="payment"/>
																<p>含运费：<span><s:property value="postage"/></span></p>
															</div>
														</li>
														<div class="move-right">
															<li class="td td-status">
																<div class="item-status">
																	<p class="Mystatus">
																	<s:if test="status==10">待付款</s:if>
																	<s:if test="status==20">待发货</s:if>
																	<s:if test="status==30">已发货</s:if>
																	<s:if test="status==40">待收货</s:if>
																	<s:if test="status==50">交易成功</s:if>
																	<s:if test="status==60">交易取消</s:if></p>
																	<p class="order-info"><a href="orderinfo.html">订单详情</a></p>
																	<p class="order-info"><a href="logistics.html">查看物流</a></p>
																</div>
															</li>
															<li class="td td-change">
																<a href="javascript:alert('抱歉，暂时无法提供此功能')" style="color:white;">
																	<div class="am-btn am-btn-danger anniu">
																		评价商品</div>
																</a>
															</li>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									</s:if>
									</s:iterator>
								</div>
							</div>

						</div>
					</div>
				</div>
				<!--底部-->
				<div class="footer">
					<div class="footer-hd">
						<p>
							<a href="#">恒望科技</a>
							<b>|</b>
							<a href="#">商城首页</a>
							<b>|</b>
							<a href="#">支付宝</a>
							<b>|</b>
							<a href="#">物流</a>
						</p>
					</div>
					<div class="footer-bd">
						<p>
							<a href="#">关于恒望</a>
							<a href="#">合作伙伴</a>
							<a href="#">联系我们</a>
							<a href="#">网站地图</a>
							<em>© 2015-2025 Hengwang.com 版权所有. 更多模板 <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></em>
						</p>
					</div>

				</div>
			</div>
			<aside class="menu">
				<ul>
					<li class="person active">
						<a href="index.html"><i class="am-icon-user"></i>个人中心</a>
					</li>
					<li class="person">
						<p><i class="am-icon-newspaper-o"></i>个人资料</p>
						<ul>
							<li> <a href="information.html">个人信息</a></li>
							<li> <a href="safety.html">安全设置</a></li>
							<li> <a href="address.html">地址管理</a></li>
							<li> <a href="cardlist.html">快捷支付</a></li>
						</ul>
					</li>
					<li class="person">
						<p><i class="am-icon-balance-scale"></i>我的交易</p>
						<ul>
							<li><a href="/Flfw/orderAction">订单管理</a></li>
							<li> <a href="change.html">退款售后</a></li>
							<li> <a href="comment.html">评价商品</a></li>
						</ul>
					</li>
					<li class="person">
						<p><i class="am-icon-dollar"></i>我的资产</p>
						<ul>
							<li> <a href="points.html">我的积分</a></li>
							<li> <a href="coupon.html">优惠券 </a></li>
							<li> <a href="bonus.html">红包</a></li>
							<li> <a href="walletlist.html">账户余额</a></li>
							<li> <a href="bill.html">账单明细</a></li>
						</ul>
					</li>

					<li class="person">
						<p><i class="am-icon-tags"></i>我的收藏</p>
						<ul>
							<li> <a href="collection.html">收藏</a></li>
							<li> <a href="foot.html">足迹</a></li>
						</ul>
					</li>

					<li class="person">
						<p><i class="am-icon-qq"></i>在线客服</p>
						<ul>
							<li> <a href="consultation.html">商品咨询</a></li>
							<li> <a href="suggest.html">意见反馈</a></li>							
							
							<li> <a href="news.html">我的消息</a></li>
						</ul>
					</li>
				</ul>

			</aside>
		</div>

	</body>
</html>
