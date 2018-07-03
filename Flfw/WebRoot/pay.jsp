<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0 ,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

		<title>结算页面</title>

		<link href="./flfw/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />

		<link href="./flfw/basic/css/demo.css" rel="stylesheet" type="text/css" />
		<link href="./flfw/css/cartstyle.css" rel="stylesheet" type="text/css" />

		<link href="./flfw/css/jsstyle.css" rel="stylesheet" type="text/css" />

		<script type="text/javascript" src="./flfw/js/address.js"></script>
		<script type="text/javascript">
		$(function(){
		 $(".text_box").each( function() {
			var text_box_num=$(".text_box").length;
			for(var i=0;i<text_box_num;i++){
	 		 var quantity=$(".text_box").eq(i).val();
	 		  if(quantity==1){
      		 	$(".min").eq(i).attr("disabled", true);
      		 }
      		 }
	 	});
		$(".add").click(function() {       		
       		 var where_num=$(".add").index(this);
       		 var quantity=$(".text_box").eq(where_num).val();
       		 if(quantity==1){
       		 	$(".min").eq(where_num).attr("disabled", false);
       		 }
       		 quantity++;
       		 var One_price=$(".price-now").eq(where_num).html();
       		 var price_now=One_price*quantity;
       		 $(".J_ItemSum").eq(where_num).html(price_now);	
       		 AddSettlement();	
    })
		//减少数量时改变价格
    $(".min").click(function() {    		
       		 var where_num=$(".min").index(this);
       		 var quantity=$(".text_box").eq(where_num).val();
       		 quantity--;
       		 if(quantity==1){
       		 	$(".min").eq(where_num).attr("disabled", true);
       		 }
       		 var One_price=$(".price-now").eq(where_num).html();
       		 var price_now=One_price*quantity;
       		 $(".J_ItemSum").eq(where_num).html(price_now);
       		 AddSettlement();		
    })
    });
        function AddSettlement(){
        	 var tr_num=$(".text_box");
        	 var products_price=parseFloat(0.0);
        	 for(var i=0;i<tr_num.length;i++)
        	 {
        	 		products_price=parseFloat($(".J_ItemSum").eq(i).html())+products_price;
        	 }
       		$("#J_Total").html(products_price); 
       		$("#J_ActualFee").html(products_price);
    }
     </script>
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
					<div class="menu-hd MyShangcheng"><a href="/Flfw/information.action" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a></div>
				</div>
				<div class="topMessage mini-cart">
					<div class="menu-hd"><a id="mc-menu-hd" href="/Flfw/showshopcart.action" target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong id="J_MiniCartNum" class="h">0</strong></a></div>
				</div>
				<div class="topMessage favorite">
					
			</ul>
			</div>

			<!--悬浮搜索框-->

			<div class="nav white">
				<div class="logo"><img src="./images/logo.jpg" /></div>
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
			<div class="concent">
				<!--地址 -->
				<div class="paycont">
					<div class="address">
						<h3>确认收货地址 </h3>
						<div class="control">
							<div class="tc-btn createAddr theme-login am-btn am-btn-danger">使用新地址</div>
						</div>
						<div class="clear"></div>
						<ul>
							<s:iterator value="#session.shippingList">
							<div class="per-border"></div>
								<div style="display:none">
									<input id="select" value=""/>
								</div>
							<li class="user-addresslist getAddress" onclick="selectad(${id})">

								<div class="address-left">
									<div class="user DefaultAddr">
										<span style="display:none;"><s:property value="id"/></span>
										<span class="buy-address-detail">   
                   							<span class="buy-user person_name"><s:property value="receiver_name"/></span>
										<span class="buy-phone person_phone"><s:property value="receiver_mobile"/></span>
										</span>
									</div>
									<div class="default-address DefaultAddr">
										<span class="buy-line-title buy-line-title-type">收货地址：</span>
										<span class="buy--address-detail">
								   		<span class="province person_province"><s:property value="receiver_province"/></span>省
										<span class="city person_city"><s:property value="receiver_city"/></span>市
										<span class="dist person_dist"><s:property value="receiver_district"/></span>区
										<span class="street person_street"><s:property value="receiver_address"/></span>
										</span>
										</span>
									</div>
									
								</div>
								<div class="address-right">
									<a >
										<span class="am-icon-angle-right am-icon-lg"></span></a>
								</div>
								<div class="clear"></div>

								<div class="new-addr-btn">
									
									<span class="new-addr-bar hidden">|</span>
									<a href="#" class="theme-login">编辑</a>
									<span class="new-addr-bar">|</span>
									<a href="javascript:if(confirm('确认要删除该收货地址吗?'))location='deleteShippingAction?shippingid=${id}'">删除</a>
								</div>

							</li>
							<div class="per-border"></div>
							</s:iterator>

						</ul>

						<div class="clear"></div>
					</div>
					<!--物流 -->
					<div class="logistics">
						<h3>选择物流方式</h3>
						<ul class="op_express_delivery_hot">
							<li data-value="yuantong" class="OP_LOG_BTN  "><i class="c-gap-right" style="background-position:0px -468px"></i>圆通<span></span></li>
							<li data-value="shentong" class="OP_LOG_BTN  "><i class="c-gap-right" style="background-position:0px -1008px"></i>申通<span></span></li>
							<li data-value="yunda" class="OP_LOG_BTN  "><i class="c-gap-right" style="background-position:0px -576px"></i>韵达<span></span></li>
							<li data-value="zhongtong" class="OP_LOG_BTN op_express_delivery_hot_last "><i class="c-gap-right" style="background-position:0px -324px"></i>中通<span></span></li>
							<li data-value="shunfeng" class="OP_LOG_BTN  op_express_delivery_hot_bottom"><i class="c-gap-right" style="background-position:0px -180px"></i>顺丰<span></span></li>
						</ul>
					</div>
					<div class="clear"></div>

					<!--支付方式-->
					<div class="logistics">
						<h3>选择支付方式</h3>
						<ul class="pay-list">
							<li class="pay card"><img src="./images/wangyin.jpg" />银联<span></span></li>
							<li class="pay qq"><img src="./images/weizhifu.jpg" />微信<span></span></li>
							<li class="pay taobao"><img src="./images/zhifubao.jpg" />支付宝<span></span></li>
						</ul>
					</div>
					<div class="clear"></div>

					<!--订单 -->
					<div class="concent">
						<div id="payTable">
							<h3>确认订单信息</h3>
							<div class="cart-table-th">
								<div class="wp">

									<div class="th th-item">
										<div class="td-inner">商品信息</div>
									</div>
									<div class="th th-price">
										<div class="td-inner">单价</div>
									</div>
									<div class="th th-amount">
										<div class="td-inner">数量</div>
									</div>
									<div class="th th-sum">
										<div class="td-inner">金额</div>
									</div>
									<div class="th th-oplist">
										<div class="td-inner">配送方式</div>
									</div>

								</div>
							</div>
							<div class="clear"></div>
<!-- ------------------------------------------------- -->
							<s:iterator value="#session.payfor_list" status="st" var="product_data">
							<tr class="item-list">
								<div class="bundle  bundle-last">

									<div class="bundle-main">
										<ul class="item-content clearfix">
											<div class="pay-phone">
												<li class="td td-item">
													<div class="item-pic">
														<a href="#" class="J_MakePoint">
															<img src="<s:property value="#session.payfor_list.get(#st.index)[6]"/>" class="itempic J_ItemImg" style="width:100px;height:100px;"></a>
													</div>
													<div class="item-info">
														<div class="item-basic-info">
															<a href="#" class="item-title J_MakePoint" data-point="tbcart.8.11"><s:property value="#session.payfor_list.get(#st.index)[2]"/></a>
														</div>
													</div>
												</li>
												<li class="td td-info">
													<div class="item-props">
														<span class="sku-line"><s:property value="#session.payfor_list.get(#st.index)[3]"/></span>
													</div>
												</li>
												<li class="td td-price">
													<div class="item-price price-promo-promo">
														<div class="price-content">
															<em class="J_Price price-now"><s:property value="#session.payfor_list.get(#st.index)[5]"/></em>
														</div>
													</div>
												</li>
											</div>
											<li class="td td-amount">
												<div class="amount-wrapper ">
													<div class="item-amount ">
														<span class="phone-title">购买数量</span>
														<div class="sl">
															<input class="min am-btn" name="" type="button" value="-" />
															<input class="text_box" name="" type="text" value="<s:property value="#session.payfor_list.get(#st.index)[4]"/>" style="width:30px;" />
															<input class="add am-btn" name="" type="button" value="+" />
														</div>
													</div>
												</div>
											</li>
											<li class="td td-sum">
												<div class="td-inner">
													<em tabindex="0" class="J_ItemSum number"><s:property value="#session.payfor_list.get(#st.index)[7]"/></em>
												</div>
											</li>
											<li class="td td-oplist">
												<div class="td-inner">
													<span class="phone-title">配送方式</span>
													<div class="pay-logis">
														包邮
													</div>
												</div>
											</li>

										</ul>
										<div class="clear"></div>

									</div>
							</tr>
							</s:iterator>
		<!----------------------- --------- -->
							<div class="clear"></div>
							</div>
							<div class="clear"></div>
							<div class="pay-total">
						<!--留言-->
							<div class="order-extra">
								<div class="order-user-info">
									<div id="holyshit257" class="memo">
										<label>买家留言：</label>
										<input type="text" title="选填,对本次交易的说明（建议填写已经和卖家达成一致的说明）" placeholder="选填,建议填写和卖家达成一致的说明" class="memo-input J_MakePoint c2c-text-default memo-close">
										<div class="msg hidden J-msg">
											<p class="error">最多输入500个字符</p>
										</div>
									</div>
								</div>

							</div>
							<!--优惠券 -->
							<div class="buy-agio">
								<li class="td td-coupon">

									<span class="coupon-title">优惠券</span>
									<select data-am-selected>
										<option value="a">
											<div class="c-price">
												<strong>￥8</strong>
											</div>
											<div class="c-limit">
												【消费满95元可用】
											</div>
										</option>
										<option value="b" selected>
											<div class="c-price">
												<strong>￥3</strong>
											</div>
											<div class="c-limit">
												【无使用门槛】
											</div>
										</option>
									</select>
								</li>

								<li class="td td-bonus">

									<span class="bonus-title">红包</span>
									<select data-am-selected>
										<option value="a">
											<div class="item-info">
												¥50.00<span>元</span>
											</div>
											<div class="item-remainderprice">
												<span>还剩</span>10.40<span>元</span>
											</div>
										</option>
										<option value="b" selected>
											<div class="item-info">
												¥50.00<span>元</span>
											</div>
											<div class="item-remainderprice">
												<span>还剩</span>50.00<span>元</span>
											</div>
										</option>
									</select>

								</li>

							</div>
							<div class="clear"></div>
							</div>
							<!--含运费小计 -->
							<div class="buy-point-discharge ">
								<p class="price g_price ">
									合计（含运费） <span>¥</span><em class="pay-sum" id="J_Total"><%=session.getAttribute("Payfor_price") %></em>
								</p>
							</div>

							<!--信息 -->
							<div class="order-go clearfix">
								<div class="pay-confirm clearfix">
									<div class="box">
										<div tabindex="0" id="holyshit267" class="realPay"><em class="t">实付款：</em>
											<span class="price g_price ">
                                    <span>¥</span> <em class="style-large-bold-red " id="J_ActualFee"><%=session.getAttribute("Payfor_price") %></em>
											</span>
										</div>

										<div id="holyshit268" class="pay-address">

											<p class="buy-footer-address">
												<span class="buy-line-title buy-line-title-type">寄送至：</span>
												<span class="buy--address-detail" id="buy_address">
								  
												</span>
											</p>
											<p class="buy-footer-address">
												<span class="buy-line-title">收货人：</span>
												<span class="buy-address-detail">
                                         <span class="buy-user address_name">艾迪 </span>
												<span class="buy-phone address_phone">15871145629</span>
												</span>
											</p>
										</div>
									</div>


									<script>
										$(".getAddress").click(function(){
											var select_num=$(".getAddress").index(this);
                                            var person_province=$(".person_province").eq(select_num).html();
                                            var person_city=$(".person_city").eq(select_num).html();
                                            var person_dist=$(".person_dist").eq(select_num).html();
                                            var person_street=$(".person_street").eq(select_num).html();
                                            var person_name=$(".person_name").eq(select_num).html();
                                            var person_phone=$(".person_phone").eq(select_num).html();
                                            var new_address=person_province+"省 "+person_city+"市 "+person_dist+"区 "+person_street;
                                            $(".address_name").html(person_name);
                                            $(".address_phone").html(person_phone);
                                            $("#buy_address").html(new_address);
											})
                                        function selectad(id){
                                            $("#select").attr("value",id);
                                            
                                        }
                                        function UserAddOrder(){
                                            var i = $("#select").val();
                                            if(i.length>0){
                                                window.location.href = "userAddOrderAction?shippingid="+i;
                                                $("#select").attr("value","");
                                            }else{
                                                alert("请选择收货地址！");
                                            }



                                        }
									</script>



									<div id="holyshit269" class="submitOrder">
										<div class="go-btn-wrap">
											<a id="J_Go" onclick="UserAddOrder()" class="btn-go" tabindex="0" title="点击此按钮，提交订单">提交订单</a>
										</div>
									</div>
									<div class="clear"></div>
								</div>
							</div>
						</div>

						<div class="clear"></div>
					</div>
				</div>
				<div class="footer">
					<div class="footer-hd">
						<p>
							<a href="#">商城首页</a>
							<b>|</b>
							<a href="#">支付宝</a>
							<b>|</b>
							<a href="#">物流</a>
						</p>
					</div>
					<div class="footer-bd">
						<p>
							<a href="#">合作伙伴</a>
							<a href="#">联系我们</a>
							<a href="#">网站地图</a>
							<em>© 2015-2025 Hengwang.com 版权所有. 更多模板 <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></em>
						</p>
					</div>
				</div>
			</div>
			<div class="theme-popover-mask"></div>
			<div class="theme-popover">

				<!--标题 -->
				<div class="am-cf am-padding">
					<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">新增地址</strong> / <small>Add address</small></div>
				</div>
				<hr/>

				<div class="am-u-md-12">
					<form class="am-form am-form-horizontal" action="addShippingAction" method="post">

						<div class="am-form-group">
							<label for="user-name" class="am-form-label">收货人</label>
							<div class="am-form-content">
								<input type="text" id="user-name" placeholder="收货人" name="shipping.receiver_name">
							</div>
						</div>

						<div class="am-form-group">
							<label for="user-phone" class="am-form-label">手机号码</label>
							<div class="am-form-content">
								<input id="user-phone" placeholder="手机号必填" type="tel" pattern="\d{11}" name="shipping.receiver_mobile">
							</div>
						</div>

						<div class="am-form-group">
							<label for="user-phone" class="am-form-label">所在地</label>
							<div class="am-form-content address">
								<select data-am-selected name="shipping.receiver_province">
									<option value="广东">广东省</option>
									<option value="湖北">湖北省</option>
								</select>
								<select data-am-selected name="shipping.receiver_city">
									<option value="广州">广州市</option>
									<option value="武汉">武汉市</option>
								</select>
								<select data-am-selected name="shipping.receiver_district">
									<option value="白云">白云区</option>
									<option value="洪山">洪山区</option>
								</select>
							</div>
						</div>

						<div class="am-form-group">
							<label for="user-intro" class="am-form-label">详细地址</label>
							<div class="am-form-content">
								<textarea class="" rows="3" id="user-intro" placeholder="输入详细地址" name="shipping.receiver_address" name="shipping.receiver_address"></textarea>
								<small>100字以内写出你的详细地址...</small>
							</div>
						</div>

						<div class="am-form-group theme-poptit">
							<div class="am-u-sm-9 am-u-sm-push-3">
								<s:submit class="am-btn am-btn-danger" value="保存" theme="simple"/>
								<div class="am-btn am-btn-danger close">取消</div>
							</div>
						</div>
					</form>
				</div>

			</div>

			<div class="clear"></div>
	</body>

</html>