<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

		<title>购物车页面</title>
		<link href="./flfw/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
		<link href="./flfw/basic/css/demo.css" rel="stylesheet" type="text/css" />
		<link href="./flfw/css/cartstyle.css" rel="stylesheet" type="text/css" />
		<link href="./flfw/css/optstyle.css" rel="stylesheet" type="text/css" />
		
		<script type="text/javascript" src="./flfw/js/jquery.js"></script>
		<script type="text/javascript">
		var isAll=true;
	 	$(function(){

	 	//进入页面时先判断购物车的商品是否为1，并改变“-”好按钮的状态为不可选
	 	 $(".text_box").each( function() {
	 		 var quantity=$(".text_box").val();
	 		  if(quantity==1){
      		 	$(".min").attr("disabled", true);
      		 }
	 	});
	 	
	 	//添加数量时改变价格
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
       		//判断是否被勾选,是则添加价格到结算价格上
       		if($(".check").eq(where_num).is(':checked')) {
    			AddSettlement();
			}
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
       		 if($(".check").eq(where_num).is(':checked')) {
    			AddSettlement();
			}
    })
     $(".del_tr").click(function() {
     if(confirm("确定要删除该商品吗？"))
     {
     	 var del_Id,other_productId,product_quantity,other_Id;
    	 var index=$(".del_tr").index(this);
    	 var num=$(".del_tr").size();
    	 var Array_num=parseInt(num)-1;
    	 var ProductList=new Array(Array_num);
    	 del_Id=$(".product_ID").eq(index).attr("value");
    	 
    	 for(var i=0;i<num;i++){
	    	if(i==index){
	    		continue;
	    	 }
	    	else{
	    		other_Id=$(".product_ID").eq(i).attr("value");
		    	other_productId=$(".del_tr").eq(i).attr("value");
	    	 	product_quantity=$(".text_box").eq(i).val();
	    	 	ProductList[--Array_num]=new Array(other_Id,other_productId,product_quantity);	
    	 	}
    	 }
    	
    	 $.ajax({
				    type:'post',
				    url:'updateProductCart',
				    dataType:'json',
				   	data:{"ProductList":JSON.stringify(ProductList),"del_Id":del_Id},
				   	success:function (data){
				   
				   		alert(data);
				   	}
					})
    	alert("删除商品成功");
    	}	
    }) 
    });
    function AddSettlement(){
        	 var products_price=parseFloat(0.00);
        	 var product_kind=parseInt(0);
        	 var list=$(".check_Tick");
        	 for(var i=0;i<list.length;i++)
        	 {
        	 	if($(".check_Tick").eq(i).is(':checked')){
        	 		product_kind++;
        	 		products_price=parseFloat($(".J_ItemSum").eq(i).html())+products_price;
        	 	}
        	 	else
        	 		$(".check-all").attr("checked",false);
        	 }
        	$("#J_SelectedItemsCount").html(product_kind); 
       		$("#J_Total").html(products_price); 
    }
    function checkAll(){
    		if(isAll){
		    	$('input[type="checkbox"]').attr('checked','checked');
		    	AddSettlement();
		    	isAll=false;
		    }
		    else{
		    	$('input[type="checkbox"]').attr('checked',false);
		    	AddSettlement();
		    	isAll=true;
		    }
    }
    function Settlement(){
    
    	var list=$(".check_Tick");
    	var Array_num=0;
    	var ProductsList=new Array();
    	var judge=true;
    	var Id,product_Id,product_name,product_subtitle,product_quantity,product_price,product_image,product_allprice,Payfor_price;
        	 for(var i=0;i<list.length;i++)
        	 {
        	 	if($(".check_Tick").eq(i).is(':checked')){
        	 		judge=false;
        	 		Id=$(".product_ID").eq(i).attr("value");
        	 		product_Id=$(".del_tr").eq(i).attr("value");
        	 		product_name=$(".productName").eq(i).html();
        	 		product_subtitle=$(".product_subtitle").eq(i).html()
        	 		product_quantity=$(".text_box").eq(i).val();
        	 		product_price=$(".price-now").eq(i).html();
        	 		product_image= $('.Imgsrc')[i].src;
        	 		product_allprice=$(".J_ItemSum").eq(i).html();
        	 		ProductsList[Array_num]=new Array(Id,product_Id,product_name,product_subtitle,product_quantity,product_price,product_image,product_allprice);
        	 		++Array_num;
        	 	}
        	 }
        	 Payfor_price=$("#J_Total").html();
        	
        	 if(judge){
				 alert("请勾选商品进行结算！");
				 
        	 }
        	 else{
        	 	 $.ajax({
				    type:'post',
				    url:'/Flfw/payForProductsAction',
				    dataType:'json',
				   	data:{
						   "ProductsList":JSON.stringify(ProductsList),
						   "Payfor_price":Payfor_price
					},
				   	success:function (data){
						console.log(data);
				   		//alert(data);
				   	},
					error:function(data){
						console.log(data);
						window.location.href="/Flfw/pay.jsp";
					}
					}) 
					
        	 }
    	}
        function saveData(){
            var num=$(".del_tr").size();
            var quantity,ID,productId;
            var ProductList=new Array(num);
            for(var i=0;i<num;i++)
            {
                ID=$(".product_ID").eq(i).attr("value");
                productId=$(".del_tr").eq(i).attr("value");
                quantity=$(".text_box").eq(i).val();
                ProductList[i]=new Array(ID,productId,quantity);
            }
            $.ajax({
                type:'post',
                url:'updateProductCart',
                dataType:'json',
                data:{"ProductList":JSON.stringify(ProductList),"del_Id":0},
                success:function (data){
                    
                }
            })
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
					<div class="menu-hd"><a href="/Flfw/index.jsp" target="_top" class="h" onclick="saveData();">商城首页</a></div>
				</div>
				<div class="topMessage my-shangcheng">
					<div class="menu-hd MyShangcheng"><a href="/Flfw/information.action" target="_top" onclick="saveData()"><i class="am-icon-user am-icon-fw"></i>个人中心</a></div>
				</div>
				<div class="topMessage mini-cart">
					<div class="menu-hd"><a id="mc-menu-hd" href="/Flfw/showshopcart.action" target="_top" onclick="saveData()"><i class="am-icon-shopping-cart  am-icon-fw" ></i><span>购物车</span><strong id="J_MiniCartNum" class="h">0</strong></a></div>
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

			<!--购物车 -->
			<div class="concent">
				<div id="cartTable">
					<div class="cart-table-th">
						<div class="wp">
							<div class="th th-chk">
								<div id="J_SelectAll1" class="select-all J_SelectAll">

								</div>
							</div>
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
							<div class="th th-op">
								<div class="td-inner">操作</div>
							</div>
						</div>
					</div>
					<div class="clear"></div>
<!-- ----------------------------------------- -->
			<s:iterator value="#request.shop_cart" status="st" var="cart_data">
				<%-- <s:iterator value="#request.shop_cart.get(#st.index)" var="cart_data"> --%>
					<tr class="item-list listTr">
						<div class="bundle  bundle-last listDiv">
							<div class="clear"></div>
							<div class="bundle-main">
								<ul class="item-content clearfix">
									<li class="td td-chk">
										<div class="cart-checkbox ">
											<input class="check check_Tick" id="J_CheckBox_170037950254" name="items[]" value="170037950254" type="checkbox" onclick="AddSettlement();">
											<label for="J_CheckBox_170037950254"></label>
										</div>
									</li>
									<li class="td td-item">
										<div class="item-pic">
											<a href="#" target="_blank" data-title="美康" class="J_MakePoint" data-point="tbcart.8.12">
												<img src="./images/products/main/<s:property value="#request.shop_cart.get(#st.index)[1].main_image"/>" class="itempic J_ItemImg Imgsrc" style="width:100px;height:100px;"></a>
										</div>
										<div class="item-info">
											<div class="item-basic-info">
				<!--  -->						<a href="/Flfw/product!send?id=<s:property value="#request.shop_cart.get(#st.index)[0].productId"/>" target="_blank" title="美康" class="item-title J_MakePoint productName" data-point="tbcart.8.11"><s:property value="#request.shop_cart.get(#st.index)[1].name"/></a>
											</div>
										</div>
									</li>
									<li class="td td-info">
										<div class="item-props item-props-can">
											<span class="sku-line product_subtitle"><s:property value="#request.shop_cart.get(#st.index)[1].subtitle"/></span>
											<i class="theme-login am-icon-sort-desc"></i>
										</div>
									</li>
									<li class="td td-price">
										<div class="item-price price-promo-promo">
											<div class="price-content">
												<div class="price-line">
													<em class="price-original"><s:property value="#request.shop_cart.get(#st.index)[1].price_original"/></em>
												</div>
												<div class="price-line">
													<em class="J_Price price-now" tabindex="0"><s:property value="#request.shop_cart.get(#st.index)[1].price_now"/></em>
												</div>
											</div>
										</div>
									</li>
									<li class="td td-amount">
										<div class="amount-wrapper ">
											<div class="item-amount ">
												<div class="sl">
													<input class="min am-btn" name="" type="button" value="-"/>
													<input class="text_box" name="" type="text" readonly value="<s:property value="#request.shop_cart.get(#st.index)[0].quantity"/>" style="width:30px;" />
													<input class="add am-btn" name="" type="button" value="+"/>
												</div>
											</div>
										</div>
									</li>
									<li class="td td-sum">
										<div class="td-inner">
											<em tabindex="0" class="J_ItemSum number"><s:property value="#request.shop_cart.get(#st.index)[1].price_now*#request.shop_cart.get(#st.index)[0].quantity"/></em>
										</div>
									</li>
									<li class="td td-op">
										<div class="td-inner">
										<a class="product_ID" value="<s:property value="#request.shop_cart.get(#st.index)[0].id"/>"></a>
											<a href="" data-point-url="#" class="delete del_tr" value="<s:property value="#request.shop_cart.get(#st.index)[0].productId"/>" >
                  删除</a>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</tr>
 				</s:iterator>
<%--  				</s:iterator> --%>
<!-- ----------------------------------- -->
					<div class="clear"></div>

				</div>
				<div class="float-bar-wrapper">
					<div id="J_SelectAll2" class="select-all J_SelectAll">
						<div class="cart-checkbox">
							<input class="check-all check" id="J_SelectAllCbx2" name="select-all" value="true" type="checkbox" onclick="checkAll()">
							<label for="J_SelectAllCbx2"></label>
						</div>
						<span>全选</span>
					</div>
					<div class="float-bar-right">
						<div class="amount-sum">
							<span class="txt">已选商品</span>
							<em id="J_SelectedItemsCount">0</em><span class="txt">件</span>
							<div class="arrow-box">
								<span class="selected-items-arrow"></span>
								<span class="arrow"></span>
							</div>
						</div>
						<div class="price-sum">
							<span class="txt">合计:</span>
							<strong class="price">¥<em id="J_Total">0.00</em></strong>
						</div>
						<div class="btn-area">
							<a id="J_Go" class="submit-btn submit-btn-disabled" aria-label="请注意如果没有选择宝贝，将无法结算" onclick="Settlement();">
								<span>结&nbsp;算</span></a>
						</div>
					</div>

				</div>

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

			<!--操作页面-->

			<div class="theme-popover-mask"></div>

			<div class="theme-popover">
				<div class="theme-span"></div>
				<div class="theme-poptit h-title">
					<a href="javascript:;" title="关闭" class="close">×</a>
				</div>
				<div class="theme-popbod dform">
					<form class="theme-signin" name="loginform" action="" method="post">

						<div class="theme-signin-left">

							<li class="theme-options">
								<div class="cart-title">颜色：</div>
								<ul>
									<li class="sku-line selected">12#川南玛瑙<i></i></li>
									<li class="sku-line">10#蜜橘色+17#樱花粉<i></i></li>
								</ul>
							</li>
							<li class="theme-options">
								<div class="cart-title">包装：</div>
								<ul>
									<li class="sku-line selected">包装：裸装<i></i></li>
									<li class="sku-line">两支手袋装（送彩带）<i></i></li>
								</ul>
							</li>
							<div class="theme-options">
								<div class="cart-title number">数量</div>
								<dd>
									<input class="min am-btn am-btn-default" name="" type="button" value="-" />
									<input class="text_box" name="" type="text" value="1" style="width:30px"/>
									<input class="add am-btn am-btn-default" name="" type="button" value="+" />
									<span  class="tb-hidden">库存<span class="stock">1000</span>件</span>
								</dd>

							</div>
							<div class="clear"></div>
							<div class="btn-op">
								<div class="btn am-btn am-btn-warning">确认</div>
								<div class="btn close am-btn am-btn-warning">取消</div>
							</div>

						</div>
						<div class="theme-signin-right">
							<div class="img-info">
								<img src="./images/kouhong.jpg_80x80.jpg" />
							</div>
							<div class="text-info">
								<span class="J_Price price-now">¥39.00</span>
								<span id="Stock" class="tb-hidden">库存<span class="stock">1000</span>件</span>
							</div>
						</div>

					</form>
				</div>
			</div>
		<!--引导 -->
		<div class="navCir">
			<li><a href="home2.html"><i class="am-icon-home "></i>首页</a></li>
			<li><a href="sort.html"><i class="am-icon-list"></i>分类</a></li>
			<li class="active"><a href="shopcart.html"><i class="am-icon-shopping-basket"></i>购物车</a></li>	
			<li><a href="../person/index.html"><i class="am-icon-user"></i>我的</a></li>					
		</div>
	</body>

</html>