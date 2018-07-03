<%--
  Created by IntelliJ IDEA.
  User: kamisama
  Date: 2018/6/24
  Time: 10:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

		<title>首页</title>

		<link href="./flfw/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
		<link href="./flfw/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />

		<link href="./flfw/basic/css/demo.css" rel="stylesheet" type="text/css" />

		<link href="./flfw/css/hmstyle.css" rel="stylesheet" type="text/css" />
		<script src="./flfw/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
		<script src="./flfw/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
		<script type="text/javascript" src="./flfw/js/indexAjax.js"></script>
		<script src="./flfw/js/jquery.lazyload.min.js"></script>
		<script type="text/javascript" charset="utf-8">
			// $(function() {
			// 	$("").lazyload({
			// 		effect: "fadeIn",
			// 		threshold: 200,
			// 		placeholder: "images/load.gif"
			// 	});
			// });
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
		<div class="hmtop">
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
						<div class="menu-hd"><a id="mc-menu-hd" href="/Flfw/showshopcart" target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong id="J_MiniCartNum" class="h"></strong></a></div>
					</div>
					<div class="topMessage favorite">
						
				</ul>
				</div>

				<!--悬浮搜索框-->

				<div class="nav white">
					<div class="logo"><img src="images/logo.jpg" /></div>
					<div class="logoBig">
						<li><img src="images/logo.jpg" /></li>
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


		<div class="banner">
			<!--轮播 -->
			<div class="am-slider am-slider-default scoll" data-am-flexslider id="demo-slider-0">
				<ul class="am-slides ">
					<li class='banner1'></li>
					<li class='banner2'></li>
					<li class='banner3'></li>
					<li class='banner4'></li>
				</ul>
			</div>
			<div class="clear"></div>
		</div>

		<div class="shopNav">
				<div class="slideall">
			        
					   <div class="long-title"><span class="all-goods">全部分类</span></div>
					   <div class="nav-cont">
							<ul>
								<li class="index"><a href="#">首页</a></li>
                                <li class="qc"></li>
                                <li class="qc"></li>
                                <li class="qc"></li>
                                <li class="qc last">	</li>
							</ul>
						</div>
		        				
						<!--侧边导航 -->
						<div id="nav" class="navfull">
							<div class="area clearfix">
								<div class="category-content" id="guide_2">
									
									<div class="category">
										<ul class="category-list" id="js_climit_li">
											<li class="appliance js_toggle relative first">
												<div class="category-info">
													<h3 class="category-name b-category-name">
														<i><img src="images/meat.png"></i>
														<a class="ml-22"><span id="category_1"></span></a></h3>
													<em>&gt;</em></div>
												<div class="menu-item menu-in top">
													<div class="area-in">
														<div class="area-bg">
															<div class="menu-srot">
																<div class="sort-side">
																	<dl class="dl-sort" id="category_detail_1">
																	</dl>
																</div>
																<div class="brand-side">
																	<dl class="dl-sort"><dt><span>推荐商品</span></dt>
																		</dl>
																</div>
															</div>
														</div>
													</div>
												</div>
											<b class="arrow"></b>	
											</li>
											<li class="appliance js_toggle relative">
												<div class="category-info">
													<h3 class="category-name b-category-name"><i><img src="images/cookies.png"></i>
														<a class="ml-22"><span id="category_2"></span></a></h3>
													<em>&gt;</em></div>
												<div class="menu-item menu-in top">
													<div class="area-in">
														<div class="area-bg">
															<div class="menu-srot">
																<div class="sort-side">
																	<dl class="dl-sort" id="category_detail_2">
																	</dl>
																</div>
																<div class="brand-side">
																	<dl class="dl-sort"><dt><span>推荐商品</span></dt>
																		</dl>
																</div>
															</div>
														</div>
													</div>
												</div>
                                             <b class="arrow"></b>
											</li>
											<li class="appliance js_toggle relative">
												<div class="category-info">
													<h3 class="category-name b-category-name"><i><img src="images/cake.png"></i>
														<a class="ml-22"><span id="category_3"></span></a></h3>
													<em>&gt;</em></div>
												<div class="menu-item menu-in top">
													<div class="area-in">
														<div class="area-bg">
															<div class="menu-srot">
																<div class="sort-side">
																	<dl class="dl-sort" id="category_detail_3">
																	</dl>
																</div>
																<div class="brand-side">
																	<dl class="dl-sort"><dt><span>推荐商品</span></dt>
																		</dl>
																</div>
															</div>
														</div>
													</div>
												</div>
                                            <b class="arrow"></b>
											</li>
											<li class="appliance js_toggle relative">
												<div class="category-info">
													<h3 class="category-name b-category-name"><i><img src="images/chocolate.png"></i>
														<a class="ml-22"><span id="category_4"></span></a></h3>
													<em>&gt;</em></div>
												<div class="menu-item menu-in top">
													<div class="area-in">
														<div class="area-bg">
															<div class="menu-srot">
																<div class="sort-side">
																	<dl class="dl-sort" id="category_detail_4">
																	</dl>
																</div>
																<div class="brand-side">
																	<dl class="dl-sort"><dt><span>推荐商品</span></dt>
																		</dl>
																</div>
															</div>
														</div>
													</div>
												</div>
                                             <b class="arrow"></b>
											</li>
											<li class="appliance js_toggle relative">
												<div class="category-info">
													<h3 class="category-name b-category-name"><i><img src="images/nut.png"></i>
														<a class="ml-22"><span id="category_5"></span></a></h3>
													<em>&gt;</em></div>
												<div class="menu-item menu-in top">
													<div class="area-in">
														<div class="area-bg">
															<div class="menu-srot">
																<div class="sort-side">
																	<dl class="dl-sort" id="category_detail_5">
																	</dl>
																</div>
																<div class="brand-side">
																	<dl class="dl-sort"><dt><span>推荐商品</span></dt>
																		</dl>
																</div>
															</div>
														</div>
													</div>
												</div>
												<b class="arrow"></b>
											</li>
											<li class="appliance js_toggle relative">
												<div class="category-info">
													<h3 class="category-name b-category-name"><i><img src="images/candy.png"></i>
														<a class="ml-22"><span id="category_6"></span></a></h3>
													<em>&gt;</em></div>
												<div class="menu-item menu-in top">
													<div class="area-in">
														<div class="area-bg">
															<div class="menu-srot">
																<div class="sort-side">
																	<dl class="dl-sort" id="category_detail_6">
																	</dl>
																</div>
																<div class="brand-side">
																	<dl class="dl-sort"><dt><span>推荐商品</span></dt>
																		</dl>
																</div>
															</div>
														</div>
													</div>
												</div>
                                            <b class="arrow"></b>
											</li>
											<li class="appliance js_toggle relative">
												<div class="category-info">
													<h3 class="category-name b-category-name"><i><img src="images/bamboo.png"></i>
														<a class="ml-22"><span id="category_7"></span></a></h3>
													<em>&gt;</em></div>
												<div class="menu-item menu-in top">
													<div class="area-in">
														<div class="area-bg">
															<div class="menu-srot">
																<div class="sort-side">
																	<dl class="dl-sort" id="category_detail_7">
																	</dl>
																</div>
																<div class="brand-side">
																	<dl class="dl-sort"><dt><span>推荐商品</span></dt>
																		</dl>
																</div>
															</div>
														</div>
													</div>
												</div>
												<b class="arrow"></b>
											</li>
											<li class="appliance js_toggle relative">
												<div class="category-info">
													<h3 class="category-name b-category-name"><i><img src="images/fish.png"></i>
														<a class="ml-22"><span id="category_8"></span></a></h3>
													<em>&gt;</em></div>
												<div class="menu-item menu-in top">
													<div class="area-in">
														<div class="area-bg">
															<div class="menu-srot">
																<div class="sort-side">
																	<dl class="dl-sort" id="category_detail_8">
																	</dl>
																</div>
																<div class="brand-side">
																	<dl class="dl-sort"><dt><span>推荐商品</span></dt>
																		
																	</dl>
																</div>
															</div>
														</div>
													</div>
												</div>
                                             <b class="arrow"></b>
											</li>
											<li class="appliance js_toggle relative">
												<div class="category-info">
													<h3 class="category-name b-category-name"><i><img src="images/tea.png"></i>
														<a class="ml-22"><span id="category_9"></span></a></h3>
													<em>&gt;</em></div>
												<div class="menu-item menu-in top">
													<div class="area-in">
														<div class="area-bg">
															<div class="menu-srot">
																<div class="sort-side">
																	<dl class="dl-sort" id="category_detail_9">
																	</dl>
																</div>
																<div class="brand-side">
																	<dl class="dl-sort"><dt><span>推荐商品</span></dt>
																		</dl>
																</div>
															</div>
														</div>
													</div>
												</div>
												<b class="arrow"></b>
											</li>
											<li class="appliance js_toggle relative last">
												<div class="category-info">
													<h3 class="category-name b-category-name"><i><img src="images/package.png"></i>
														<a class="ml-22"><span id="category_10"></span></a></h3>
													<em>&gt;</em></div>
												<div class="menu-item menu-in top">
													<div class="area-in">
														<div class="area-bg">
															<div class="menu-srot">
																<div class="sort-side">
																	<dl class="dl-sort" id="category_detail_10">
																	</dl>
																</div>
																<div class="brand-side">
																	<dl class="dl-sort"><dt><span>推荐商品</span></dt>
																		</dl>
																</div>
															</div>
														</div>
													</div>
												</div>

											</li>
										</ul>
									</div>
								</div>

							</div>
						</div>
						<!--轮播 -->
						<script type="text/javascript">
							(function() {
								$('.am-slider').flexslider();
							});
							$(document).ready(function() {
								$("li").hover(function() {
									$(".category-content .category-list li.first .menu-in").css("display", "none");
									$(".category-content .category-list li.first").removeClass("hover");
									$(this).addClass("hover");
									$(this).children("div.menu-in").css("display", "block")
								}, function() {
									$(this).removeClass("hover")
									$(this).children("div.menu-in").css("display", "none")
								});
							})
						</script>


					<!--小导航 -->
					<div class="am-g am-g-fixed smallnav">
						<div class="am-u-sm-3">
							<a href=""><img src="images/navsmall.jpg" />
								<div class="title">商品分类</div>
							</a>
						</div>
						<div class="am-u-sm-3">
							<a href="#"><img src="images/huismall.jpg" />
								<div class="title"></div>
							</a>
						</div>
						<div class="am-u-sm-3">
							<a href="#"><img src="images/mansmall.jpg" />
								<div class="title">个人中心</div>
							</a>
						</div>
						<div class="am-u-sm-3">
							<a href="#"><img src="images/moneysmall.jpg" />
								<div class="title"></div>
							</a>
						</div>
					</div>

					<!--走马灯 -->

					
					<div class="clear"></div>
				</div>
				<script type="text/javascript">
					if ($(window).width() < 640) {
						function autoScroll(obj) {
							$(obj).find("ul").animate({
								marginTop: "-39px"
							}, 500, function() {
								$(this).css({
									marginTop: "0px"
								}).find("li:first").appendTo(this);
							})
						}
						$(function() {
							setInterval('autoScroll(".demo")', 3000);
						})
					}
				</script>
			</div>
			<div class="shopMainbg">
				<div class="shopMain" id="shopmain">

					<!--今日推荐 -->

					<div class="am-g am-g-fixed recommendation">
						<div class="am-u-sm-4 am-u-lg-3">
							<div class="recommendationMain ">
								<img src="images/banner/banner1_3.jpg"></img>
							</div>
						</div>
						<div class="am-u-sm-4 am-u-lg-3 ">
							<div class="recommendationMain ">
								<img src="images/banner/banner1_4.jpg "></img>
							</div>
						</div>						
						<div class="am-u-sm-4 am-u-lg-3 ">
							<div class="recommendationMain ">
								<img src="images/banner/banner1_3.jpg"></img>
							</div>
						</div>
						<div class="am-u-sm-4 am-u-lg-3 ">
							<div class="recommendationMain ">
								<img src="images/banner/banner1_4.jpg "></img>
							</div>
						</div>

					</div>
					<div class="clear "></div>
					<!--热门活动 -->

					<div class="am-container activity ">
						<div class="shopTitle ">
							<h4>活动</h4>
							<h3>每期活动 优惠享不停 </h3>
							<span class="more ">
                              <a class="more-link " href="# ">全部活动</a>
                            </span>
						</div>
					
					  <div class="am-g am-g-fixed ">
						<div class="am-u-sm-3 ">
							<div class="activityMain ">
								<img src="images/banner/banner1_1.jpg "></img>
							</div>													
						</div>
						
						<div class="am-u-sm-3 ">
							<div class="activityMain ">
								<img src="images/banner/banner1_1.jpg "></img>
							</div>					
						</div>						
						
						<div class="am-u-sm-3 ">
							<div class="activityMain ">
								<img src="images/banner/banner1_1.jpg "></img>
							</div>						
						</div>						

						<div class="am-u-sm-3 last ">
							<div class="activityMain ">
								<img src="images/banner/banner1_1.jpg "></img>
							</div>												
						</div>

					  </div>
                    </div>
					<div class="clear "></div>


					<!--第一分类商品-->
					<div class="am-container ">
						<div class="shopTitle ">
							<h4 class="category1"></h4>
							<h3>每一只小熊都有一个故事</h3>
							<div class="today-brands categoryList1">
							</div>
							<span class="more ">
                    <a class="more-link " href="# ">更多</a>
                        </span>
						</div>
					</div>
					<div class="am-g am-g-fixed floodOne productList1">
						<div class="am-u-sm-5 am-u-md-3 am-u-lg-4 text-one" id="product11">
							<div class="outer-con ">
								<div class="title ">
									 
								</div>					
								<div class="sub-title ">
									 
								</div>
							</div>
                            <a href="# "><img class="lazy" data-original="" /></a>
							
						</div>
						<div class="am-u-sm-7 am-u-md-5 am-u-lg-4" >
							<div class="text-two" id="product12">
								<div class="outer-con ">
									<div class="title ">
										 
									</div>									
									<div class="sub-title ">
										 
									</div>
								</div>
								<a href="# "><img class="lazy" data-original="" /></a>
							</div>
							<div class="text-two last" id="product13">
								<div class="outer-con ">
									<div class="title ">
										 
									</div>
									<div class="sub-title ">
										 
									</div>
									
								</div>
								<a href="# "><img class="lazy" data-original="" /></a>
						    </div>
						</div>
		             <div class="am-u-sm-12 am-u-md-4 ">
						<div class="am-u-sm-3 am-u-md-6 text-three " id="product14">
							<div class="outer-con ">
								<div class="title ">
									 
								</div>
								
								<div class="sub-title ">
									 
								</div>
							</div>
							<a href="# "><img class="lazy" data-original="" ></a>
						</div>

						<div class="am-u-sm-3 am-u-md-6 text-three " id="product15">
							<div class="outer-con ">
								<div class="title ">
									 
								</div>
								
								<div class="sub-title ">
									 
								</div>
							</div>
							<a href="# "><img class="lazy" data-original="" ></a>
						</div>

						<div class="am-u-sm-3 am-u-md-6 text-three" id="product16">
							<div class="outer-con ">
								<div class="title ">
									 
								</div>
								
								<div class="sub-title ">
									 
								</div>
							</div>
							<a href="# "><img class="lazy" data-original="" ></a>
						</div>

						<div class="am-u-sm-3 am-u-md-6 text-three last "id="product17">
							<div class="outer-con ">
								<div class="title ">
									 
								</div>
								
								<div class="sub-title ">
									 
								</div>
							</div>
							<a href="# "><img class="lazy" data-original="" ></a>
						</div>
					</div>

					</div>
					<div class="clear "></div>
					
					<!--第二分类商品-->
					<div class="am-container ">
						<div class="shopTitle ">
							<h4 class="category2"></h4>
							<h3></h3>
							<div class="today-brands categoryList2">
							</div>
							<span class="more ">
                    <a class="more-link " href="# ">更多</a>
                        </span>
						</div>
					</div>
					<div class="am-g am-g-fixed floodTwo productList2">
						<div class="am-u-sm-5 am-u-md-4 text-one "id="product21">
								<div class="outer-con ">
									<div class="title ">
										 
									</div>
									<div class="sub-title ">
										 
									</div>
									
								</div>
							<a href="# "><img class="lazy" data-original="" /></a>
						</div>
						<div class="am-u-sm-7 am-u-md-4 am-u-lg-2 text-two "id="product22">
								<div class="outer-con ">
									<div class="title ">
										 
									</div>
									
									<div class="sub-title ">
										 
									</div>
								</div>
								<a href="# "><img class="lazy" data-original="" /></a>
						</div>
						
						<div class="am-u-md-4 am-u-lg-2 text-three "id="product23">
							<div class="outer-con ">
								<div class="title ">
									 
								</div>
								
								<div class="sub-title ">
									 
								</div>
							</div>
							<a href="# "><img class="lazy" data-original="" ></a>
						</div>
						<div class="am-u-md-4 am-u-lg-2 text-three "id="product24">
							<div class="outer-con ">
								<div class="title ">
									 
								</div>
								
								<div class="sub-title ">
									 
								</div>
							</div>
							<a href="# "><img class="lazy" data-original="" ></a>
						</div>
						<div class="am-u-sm-6 am-u-md-4 am-u-lg-2 text-two "id="product25">
								<div class="outer-con ">
									<div class="title ">
										 
									</div>
									
									<div class="sub-title ">
										 
									</div>
								</div>
								<a href="# "><img class="lazy" data-original="" /></a>
						</div>						
						<div class="am-u-sm-6 am-u-md-3 am-u-lg-2 text-four "id="product26">
								<div class="outer-con ">
									<div class="title ">
										 
									</div>
									
									<div class="sub-title ">
										 
									</div>
								</div>
								<a href="# "><img class="lazy" data-original="" /></a>
						</div>				
						<div class="am-u-sm-4 am-u-md-3 am-u-lg-4 text-five "id="product27">
							<div class="outer-con ">
								<div class="title ">
									 
								</div>								
								<div class="sub-title ">
									 
								</div>
								
							</div>
							<a href="# "><img class="lazy" data-original="" /></a>
						</div>	
						<div class="am-u-sm-4 am-u-md-3 am-u-lg-2 text-six "id="product28">
							<div class="outer-con ">
								<div class="title ">
									 
								</div>
								
								<div class="sub-title ">
									 
								</div>
							</div>
							<a href="# "><img class="lazy" data-original="" ></a>
						</div>	
						<div class="am-u-sm-4 am-u-md-3 am-u-lg-4 text-five "id="product29">
							<div class="outer-con ">
								<div class="title ">
									 
								</div>
								<div class="sub-title ">
									 
								</div>
								
							</div>
							<a href="# "><img class="lazy" data-original="" /></a>
						</div>							
					</div>
					<div class="clear "></div>

					<!-- 第三分类 -->
					<div class="am-container ">
						<div class="shopTitle ">
							<h4 class="category3"></h4>
							<h3></h3>
							<div class="today-brands categoryList3">
							</div>
							<span class="more ">
                    <a class="more-link " href="# ">更多</a>
                        </span>
						</div>
					</div>
					<div class="am-g am-g-fixed floodTwo productList3">
						<div class="am-u-sm-5 am-u-md-4 text-one ">
							<a href="# ">
								<img class="lazy" data-original="" />
								<div class="outer-con ">
									<div class="title ">
										 
									</div>
									<div class="sub-title ">
										 
									</div>
									
								</div>
							</a>
						</div>
						<div class="am-u-sm-7 am-u-md-4 am-u-lg-2 text-two">
								<div class="outer-con ">
									<div class="title ">
										 
									</div>
									
									<div class="sub-title ">
										 
									</div>
								</div>
								<a href="# "><img class="lazy" data-original="" /></a>
						</div>
						
						<div class="am-u-md-4 am-u-lg-2 text-three">
							<div class="outer-con ">
								<div class="title ">
									 
								</div>
								
								<div class="sub-title ">
									 
								</div>
							</div>
							<a href="# "><img class="lazy" data-original="" ></a>
						</div>
						<div class="am-u-md-4 am-u-lg-2 text-three">
							<div class="outer-con ">
								<div class="title ">
									 
								</div>
								
								<div class="sub-title ">
									 
								</div>
							</div>
							<a href="# "><img class="lazy" data-original="" ></a>
						</div>
						<div class="am-u-sm-6 am-u-md-4 am-u-lg-2 text-two ">
								<div class="outer-con ">
									<div class="title ">
										 
									</div>
									
									<div class="sub-title ">
										 
									</div>
								</div>
								<a href="# "><img class="lazy" data-original="" /></a>
						</div>						
						<div class="am-u-sm-6 am-u-md-3 am-u-lg-2 text-four ">
								<div class="outer-con ">
									<div class="title ">
										 
									</div>
									
									<div class="sub-title ">
										 
									</div>
								</div>
								<a href="# "><img class="lazy" data-original="" /></a>
						</div>				
						<div class="am-u-sm-4 am-u-md-3 am-u-lg-4 text-five">
							<div class="outer-con ">
								<div class="title ">
									 
								</div>								
								<div class="sub-title ">
									 
								</div>
								
							</div>
							<a href="# "><img class="lazy" data-original="" /></a>
						</div>	
						<div class="am-u-sm-4 am-u-md-3 am-u-lg-2 text-six">
							<div class="outer-con ">
								<div class="title ">
									 
								</div>
								
								<div class="sub-title ">
									 
								</div>
							</div>
							<a href="# "><img class="lazy" data-original="" ></a>
						</div>	
						<div class="am-u-sm-4 am-u-md-3 am-u-lg-4 text-five">
							<div class="outer-con ">
								<div class="title ">
									 
								</div>
								<div class="sub-title ">
									 
								</div>
								
							</div>
							<a href="# "><img class="lazy" data-original="" /></a>
						</div>							
					</div>
					<div class="clear "></div>

					<!--甜点-->
					<div class="am-container ">
						<div class="shopTitle ">
							<h4 class="category4"></h4>
							<h3>每一份甜品都有一个故事</h3>
							<div class="today-brands categoryList4">
							</div>
							<span class="more ">
                    <a class="more-link " href="# ">更多</a>
                        </span>
						</div>
					</div>
					<div class="am-g am-g-fixed floodOne productList4">
						<div class="am-u-sm-5 am-u-md-3 am-u-lg-4 text-one ">
							<a href="# ">
								<div class="outer-con ">
									<div class="title ">
										 
									</div>					
									<div class="sub-title ">
										 
									</div>
								</div>
                                  <img class="lazy" data-original="" />
							</a>
						</div>
						<div class="am-u-sm-7 am-u-md-5 am-u-lg-4">
							<div class="text-two">
								<div class="outer-con ">
									<div class="title ">
										 
									</div>									
									<div class="sub-title ">
										 
									</div>
									
								</div>
								<a href="# "><img class="lazy" data-original="" /></a>
							</div>
							<div class="text-two last">
								<div class="outer-con ">
									<div class="title ">
										 
									</div>
									<div class="sub-title ">
										 
									</div>
									
								</div>
								<a href="# "><img class="lazy" data-original="" /></a>
						    </div>
						</div>
		             <div class="am-u-sm-12 am-u-md-4 ">
						<div class="am-u-sm-3 am-u-md-6 text-three">
							<div class="outer-con ">
								<div class="title ">
									 
								</div>
								
								<div class="sub-title ">
									 
								</div>
							</div>
							<a href="# "><img class="lazy" data-original="" ></a>
						</div>

						<div class="am-u-sm-3 am-u-md-6 text-three">
							<div class="outer-con ">
								<div class="title ">
									 
								</div>
								
								<div class="sub-title ">
									 
								</div>
							</div>
							<a href="# "><img class="lazy" data-original="" ></a>
						</div>

						<div class="am-u-sm-3 am-u-md-6 text-three">
							<div class="outer-con ">
								<div class="title ">
									 
								</div>
								
								<div class="sub-title ">
									 
								</div>
							</div>
							<a href="# "><img class="lazy" data-original="" ></a>
						</div>

						<div class="am-u-sm-3 am-u-md-6 text-three last ">
							<div class="outer-con ">
								<div class="title ">
									 
								</div>
								
								<div class="sub-title ">
									 
								</div>
							</div>
							<a href="# "><img class="lazy" data-original="" ></a>
						</div>
					</div>

					</div>
					<div class="clear "></div>


					<!--甜点-->
					<div class="am-container ">
						<div class="shopTitle ">
							<h4 class="category5"></h4>
							<h3></h3>
							<div class="today-brands categoryList5">
							</div>
							<span class="more ">
                    <a class="more-link " href="# ">更多</a>
                        </span>
						</div>
					</div>
					<div class="am-g am-g-fixed floodTwo productList5 ">
						<div class="am-u-sm-5 am-u-md-4 text-one ">
							<a href="# ">
								<img class="lazy" data-original="" />
								<div class="outer-con ">
									<div class="title ">
										 
									</div>
									<div class="sub-title ">
										 
									</div>
									
								</div>
							</a>
						</div>
						<div class="am-u-sm-7 am-u-md-4 am-u-lg-2 text-two">
								<div class="outer-con ">
									<div class="title ">
										 
									</div>
									
									<div class="sub-title ">
										 
									</div>
								</div>
								<a href="# "><img class="lazy" data-original="" /></a>
						</div>
						
						<div class="am-u-md-4 am-u-lg-2 text-three">
							<div class="outer-con ">
								<div class="title ">
									 
								</div>
								
								<div class="sub-title ">
									 
								</div>
							</div>
							<a href="# "><img class="lazy" data-original="" ></a>
						</div>
						<div class="am-u-md-4 am-u-lg-2 text-three">
							<div class="outer-con ">
								<div class="title ">
									 
								</div>
								
								<div class="sub-title ">
									 
								</div>
							</div>
							<a href="# "><img class="lazy" data-original="" ></a>
						</div>
						<div class="am-u-sm-6 am-u-md-4 am-u-lg-2 text-two ">
								<div class="outer-con ">
									<div class="title ">
										 
									</div>
									
									<div class="sub-title ">
										 
									</div>
								</div>
								<a href="# "><img class="lazy" data-original="" /></a>
						</div>						
						<div class="am-u-sm-6 am-u-md-3 am-u-lg-2 text-four ">
								<div class="outer-con ">
									<div class="title ">
										 
									</div>
									
									<div class="sub-title ">
										 
									</div>
								</div>
								<a href="# "><img class="lazy" data-original="" /></a>
						</div>				
						<div class="am-u-sm-4 am-u-md-3 am-u-lg-4 text-five">
							<div class="outer-con ">
								<div class="title ">
									 
								</div>								
								<div class="sub-title ">
									 
								</div>
								
							</div>
							<a href="# "><img class="lazy" data-original="" /></a>
						</div>	
						<div class="am-u-sm-4 am-u-md-3 am-u-lg-2 text-six">
							<div class="outer-con ">
								<div class="title ">
									 
								</div>
								
								<div class="sub-title ">
									 
								</div>
							</div>
							<a href="# "><img class="lazy" data-original="" ></a>
						</div>	
						<div class="am-u-sm-4 am-u-md-3 am-u-lg-4 text-five">
							<div class="outer-con ">
								<div class="title ">
									 
								</div>
								<div class="sub-title ">
									 
								</div>
								
							</div>
							<a href="# "><img class="lazy" data-original="" /></a>
						</div>	
					</div>

					</div>
					<div class="clear "></div>


					<!--甜点-->
					<div class="am-container ">
						<div class="shopTitle ">
							<h4 class="category6"></h4>
							<h3></h3>
							<div class="today-brands categoryList6">
							</div>
							<span class="more ">
                    <a class="more-link " href="# ">更多</a>
                        </span>
						</div>
					</div>
					<div class="am-g am-g-fixed floodOne productList6 ">
						<div class="am-u-sm-5 am-u-md-3 am-u-lg-4 text-one ">
							<a href="# ">
								<div class="outer-con ">
									<div class="title ">
										 
									</div>					
									<div class="sub-title ">
										 
									</div>
								</div>
                                  <img class="lazy" data-original="" />
							</a>
						</div>
						<div class="am-u-sm-7 am-u-md-5 am-u-lg-4">
							<div class="text-two">
								<div class="outer-con ">
									<div class="title ">
										 
									</div>									
									<div class="sub-title ">
										 
									</div>
									
								</div>
								<a href="# "><img class="lazy" data-original="" /></a>
							</div>
							<div class="text-two last">
								<div class="outer-con ">
									<div class="title ">
										 
									</div>
									<div class="sub-title ">
										 
									</div>
									
								</div>
								<a href="# "><img class="lazy" data-original="" /></a>
						    </div>
						</div>
		             <div class="am-u-sm-12 am-u-md-4 ">
						<div class="am-u-sm-3 am-u-md-6 text-three">
							<div class="outer-con ">
								<div class="title ">
									 
								</div>
								
								<div class="sub-title ">
									 
								</div>
							</div>
							<a href="# "><img class="lazy" data-original="" ></a>
						</div>

						<div class="am-u-sm-3 am-u-md-6 text-three">
							<div class="outer-con ">
								<div class="title ">
									 
								</div>
								
								<div class="sub-title ">
									 
								</div>
							</div>
							<a href="# "><img class="lazy" data-original="" ></a>
						</div>

						<div class="am-u-sm-3 am-u-md-6 text-three">
							<div class="outer-con ">
								<div class="title ">
									 
								</div>
								
								<div class="sub-title ">
									 
								</div>
							</div>
							<a href="# "><img class="lazy" data-original="" ></a>
						</div>

						<div class="am-u-sm-3 am-u-md-6 text-three last ">
							<div class="outer-con ">
								<div class="title ">
									 
								</div>
								
								<div class="sub-title ">
									 
								</div>
							</div>
							<a href="# "><img class="lazy" data-original="" ></a>
						</div>
					</div>

					</div>
					<div class="clear "></div>


					<!--甜点-->
					<div class="am-container ">
						<div class="shopTitle ">
							<h4 class="category7"</h4>
							<h3></h3>
							<div class="today-brands categoryList7">
							</div>
							<span class="more ">
                    <a class="more-link " href="# ">更多</a>
                        </span>
						</div>
					</div>
					<div class="am-g am-g-fixed floodOne productList7">
						<div class="am-u-sm-5 am-u-md-3 am-u-lg-4 text-one ">
							<a href="# ">
								<div class="outer-con ">
									<div class="title ">
										 
									</div>					
									<div class="sub-title ">
										 
									</div>
								</div>
                                  <img class="lazy" data-original="" />
							</a>
						</div>
						<div class="am-u-sm-7 am-u-md-5 am-u-lg-4">
							<div class="text-two">
								<div class="outer-con ">
									<div class="title ">
										 
									</div>									
									<div class="sub-title ">
										 
									</div>
									
								</div>
								<a href="# "><img class="lazy" data-original="" /></a>
							</div>
							<div class="text-two last">
								<div class="outer-con ">
									<div class="title ">
										 
									</div>
									<div class="sub-title ">
										 
									</div>
									
								</div>
								<a href="# "><img class="lazy" data-original="" /></a>
						    </div>
						</div>
		             <div class="am-u-sm-12 am-u-md-4 ">
						<div class="am-u-sm-3 am-u-md-6 text-three">
							<div class="outer-con ">
								<div class="title ">
									 
								</div>
								
								<div class="sub-title ">
									 
								</div>
							</div>
							<a href="# "><img class="lazy" data-original="" ></a>
						</div>

						<div class="am-u-sm-3 am-u-md-6 text-three">
							<div class="outer-con ">
								<div class="title ">
									 
								</div>
								
								<div class="sub-title ">
									 
								</div>
							</div>
							<a href="# "><img class="lazy" data-original="" ></a>
						</div>

						<div class="am-u-sm-3 am-u-md-6 text-three">
							<div class="outer-con ">
								<div class="title ">
									 
								</div>
								
								<div class="sub-title ">
									 
								</div>
							</div>
							<a href="# "><img class="lazy" data-original="" ></a>
						</div>

						<div class="am-u-sm-3 am-u-md-6 text-three last ">
							<div class="outer-con ">
								<div class="title ">
									 
								</div>
								
								<div class="sub-title ">
									 
								</div>
							</div>
							<a href="# "><img class="lazy" data-original="" ></a>
						</div>
					</div>

					</div>
					<div class="clear "></div>


					<!--甜点-->
					<div class="am-container ">
						<div class="shopTitle ">
							<h4 class="category8"></h4>
							<h3></h3>
							<div class="today-brands categoryList8">
							</div>
							<span class="more ">
                    <a class="more-link " href="# ">更多</a>
                        </span>
						</div>
					</div>
					<div class="am-g am-g-fixed floodTwo productList8 ">
						<div class="am-u-sm-5 am-u-md-4 text-one ">
							<a href="# ">
								<img class="lazy" data-original="" />
								<div class="outer-con ">
									<div class="title ">
										 
									</div>
									<div class="sub-title ">
										 
									</div>
									
								</div>
							</a>
						</div>
						<div class="am-u-sm-7 am-u-md-4 am-u-lg-2 text-two">
								<div class="outer-con ">
									<div class="title ">
										 
									</div>
									
									<div class="sub-title ">
										 
									</div>
								</div>
								<a href="# "><img class="lazy" data-original="" /></a>
						</div>
						
						<div class="am-u-md-4 am-u-lg-2 text-three">
							<div class="outer-con ">
								<div class="title ">
									 
								</div>
								
								<div class="sub-title ">
									 
								</div>
							</div>
							<a href="# "><img class="lazy" data-original="" ></a>
						</div>
						<div class="am-u-md-4 am-u-lg-2 text-three">
							<div class="outer-con ">
								<div class="title ">
									 
								</div>
								
								<div class="sub-title ">
									 
								</div>
							</div>
							<a href="# "><img class="lazy" data-original="" ></a>
						</div>
						<div class="am-u-sm-6 am-u-md-4 am-u-lg-2 text-two ">
								<div class="outer-con ">
									<div class="title ">
										 
									</div>
									
									<div class="sub-title ">
										 
									</div>
								</div>
								<a href="# "><img class="lazy" data-original="" /></a>
						</div>						
						<div class="am-u-sm-6 am-u-md-3 am-u-lg-2 text-four ">
								<div class="outer-con ">
									<div class="title ">
										 
									</div>
									
									<div class="sub-title ">
										 
									</div>
								</div>
								<a href="# "><img class="lazy" data-original="" /></a>
						</div>				
						<div class="am-u-sm-4 am-u-md-3 am-u-lg-4 text-five">
							<div class="outer-con ">
								<div class="title ">
									 
								</div>								
								<div class="sub-title ">
									 
								</div>
								
							</div>
							<a href="# "><img class="lazy" data-original="" /></a>
						</div>	
						<div class="am-u-sm-4 am-u-md-3 am-u-lg-2 text-six">
							<div class="outer-con ">
								<div class="title ">
									 
								</div>
								
								<div class="sub-title ">
									 
								</div>
							</div>
							<a href="# "><img class="lazy" data-original="" ></a>
						</div>	
						<div class="am-u-sm-4 am-u-md-3 am-u-lg-4 text-five">
							<div class="outer-con ">
								<div class="title ">
									 
								</div>
								<div class="sub-title ">
									 
								</div>
								
							</div>
							<a href="# "><img class="lazy" data-original="" /></a>
						</div>	
					</div>

					</div>
					<div class="clear "></div>


					<!--甜点-->
					<div class="am-container ">
						<div class="shopTitle ">
							<h4 class="category9"></h4>
							<h3></h3>
							<div class="today-brands categoryList9">
							</div>
							<span class="more ">
                    <a class="more-link " href="# ">更多</a>
                        </span>
						</div>
					</div>
					<div class="am-g am-g-fixed floodOne productList9 ">
						<div class="am-u-sm-5 am-u-md-3 am-u-lg-4 text-one ">
							<a href="# ">
								<div class="outer-con ">
									<div class="title ">
										 
									</div>					
									<div class="sub-title ">
										 
									</div>
								</div>
                                  <img class="lazy" data-original="" />
							</a>
						</div>
						<div class="am-u-sm-7 am-u-md-5 am-u-lg-4">
							<div class="text-two">
								<div class="outer-con ">
									<div class="title ">
										 
									</div>									
									<div class="sub-title ">
										 
									</div>
									
								</div>
								<a href="# "><img class="lazy" data-original="" /></a>
							</div>
							<div class="text-two last">
								<div class="outer-con ">
									<div class="title ">
										 
									</div>
									<div class="sub-title ">
										 
									</div>
									
								</div>
								<a href="# "><img class="lazy" data-original="" /></a>
						    </div>
						</div>
		             <div class="am-u-sm-12 am-u-md-4 ">
						<div class="am-u-sm-3 am-u-md-6 text-three">
							<div class="outer-con ">
								<div class="title ">
									 
								</div>
								
								<div class="sub-title ">
									 
								</div>
							</div>
							<a href="# "><img class="lazy" data-original="" ></a>
						</div>

						<div class="am-u-sm-3 am-u-md-6 text-three">
							<div class="outer-con ">
								<div class="title ">
									 
								</div>
								
								<div class="sub-title ">
									 
								</div>
							</div>
							<a href="# "><img class="lazy" data-original="" ></a>
						</div>

						<div class="am-u-sm-3 am-u-md-6 text-three">
							<div class="outer-con ">
								<div class="title ">
									 
								</div>
								
								<div class="sub-title ">
									 
								</div>
							</div>
							<a href="# "><img class="lazy" data-original="" ></a>
						</div>

						<div class="am-u-sm-3 am-u-md-6 text-three last ">
							<div class="outer-con ">
								<div class="title ">
									 
								</div>
								
								<div class="sub-title ">
									 
								</div>
							</div>
							<a href="# "><img class="lazy" data-original="" ></a>
						</div>
					</div>

					</div>
					<div class="clear "></div>


					<!--甜点-->
					<div class="am-container ">
						<div class="shopTitle ">
							<h4 class="category10"></h4>
							<h3></h3>
							<div class="today-brands categoryList10">
							</div>
							<span class="more ">
                    <a class="more-link " href="# ">更多</a>
                        </span>
						</div>
					</div>
					<div class="am-g am-g-fixed floodOne productList10 ">
						<div class="am-u-sm-5 am-u-md-3 am-u-lg-4 text-one ">
							<a href="# ">
								<div class="outer-con ">
									<div class="title ">
										 
									</div>					
									<div class="sub-title ">
										 
									</div>
								</div>
                                  <img class="lazy" data-original="" />
							</a>
						</div>
						<div class="am-u-sm-7 am-u-md-5 am-u-lg-4">
							<div class="text-two">
								<div class="outer-con ">
									<div class="title ">
										 
									</div>									
									<div class="sub-title ">
										 
									</div>
									
								</div>
								<a href="# "><img class="lazy" data-original="" /></a>
							</div>
							<div class="text-two last">
								<div class="outer-con ">
									<div class="title ">
										 
									</div>
									<div class="sub-title ">
										 
									</div>
									
								</div>
								<a href="# "><img class="lazy" data-original="" /></a>
						    </div>
						</div>
		             <div class="am-u-sm-12 am-u-md-4 ">
						<div class="am-u-sm-3 am-u-md-6 text-three">
							<div class="outer-con ">
								<div class="title ">
									 
								</div>
								
								<div class="sub-title ">
									 
								</div>
							</div>
							<a href="# "><img class="lazy" data-original="" ></a>
						</div>

						<div class="am-u-sm-3 am-u-md-6 text-three">
							<div class="outer-con ">
								<div class="title ">
									 
								</div>
								
								<div class="sub-title ">
									 
								</div>
							</div>
							<a href="# "><img class="lazy" data-original="" ></a>
						</div>

						<div class="am-u-sm-3 am-u-md-6 text-three">
							<div class="outer-con ">
								<div class="title ">
									 
								</div>
								
								<div class="sub-title ">
									 
								</div>
							</div>
							<a href="# "><img class="lazy" data-original="" ></a>
						</div>

						<div class="am-u-sm-3 am-u-md-6 text-three last ">
							<div class="outer-con ">
								<div class="title ">
									 
								</div>
								
								<div class="sub-title ">
									 
								</div>
							</div>
							<a href="# "><img class="lazy" data-original="" ></a>
						</div>
					</div>

					</div>
					<div class="clear "></div>



					<!-- footer -->
					<div class="footer ">
						<div class="footer-hd ">
							<p>
								<a href="# ">恒望科技</a>
								<b>|</b>
								<a href="# ">商城首页</a>
								<b>|</b>
								<a href="# ">支付宝</a>
								<b>|</b>
								<a href="# ">物流</a>
							</p>
						</div>
						<div class="footer-bd ">
							<p>
								<a href="# ">关于恒望</a>
								<a href="# ">合作伙伴</a>
								<a href="# ">联系我们</a>
								<a href="# ">网站地图</a>
								<em>© 2015-2025 Hengwang.com 版权所有. 更多模板 <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></em>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
		<!--引导 -->

		<div class="navCir">
			<li class="active"><a href="home3.html"><i class="am-icon-home "></i>首页</a></li>
			<li><a href="sort.html"><i class="am-icon-list"></i>分类</a></li>
			<li><a href="shopcart.html"><i class="am-icon-shopping-basket"></i>购物车</a></li>	
			<li><a href="../person/index.html"><i class="am-icon-user"></i>我的</a></li>					
		</div>
		<!--菜单 -->
		<div class=tip>
			<div id="sidebar">
				<div id="wrap">
					<div id="prof" class="item ">
						<a href="# ">
							<span class="setting "></span>
						</a>
						<div class="ibar_login_box status_login ">
							<div class="avatar_box ">
								<p class="avatar_imgbox "><img src="images/no-img_mid_.jpg " /></p>
								<ul class="user_info ">
									<li>用户名：sl1903</li>
									<li>级&nbsp;别：普通会员</li>
								</ul>
							</div>
							<div class="login_btnbox ">
								<a href="# " class="login_order ">我的订单</a>
								<a href="# " class="login_favorite ">我的收藏</a>
							</div>
							<i class="icon_arrow_white "></i>
						</div>

					</div>
					<div id="shopCart " class="item ">
						<a href="# ">
							<span class="message "></span>
						</a>
						<p>
							购物车
						</p>
						<p class="cart_num ">0</p>
					</div>
					<div id="asset " class="item ">
						<a href="# ">
							<span class="view "></span>
						</a>
						<div class="mp_tooltip ">
							我的资产
							<i class="icon_arrow_right_black "></i>
						</div>
					</div>

					<div id="foot " class="item ">
						<a href="# ">
							<span class="zuji "></span>
						</a>
						<div class="mp_tooltip ">
							我的足迹
							<i class="icon_arrow_right_black "></i>
						</div>
					</div>

					<div id="brand " class="item ">
						<a href="#">
							<span class="wdsc "><img src="images/wdsc.png " /></span>
						</a>
						<div class="mp_tooltip ">
							我的收藏
							<i class="icon_arrow_right_black "></i>
						</div>
					</div>

					<div id="broadcast " class="item ">
						<a href="# ">
							<span class="chongzhi "><img src="images/chongzhi.png " /></span>
						</a>
						<div class="mp_tooltip ">
							我要充值
							<i class="icon_arrow_right_black "></i>
						</div>
					</div>

					<div class="quick_toggle ">
						<li class="qtitem ">
							<a href="# "><span class="kfzx "></span></a>
							<div class="mp_tooltip ">客服中心<i class="icon_arrow_right_black "></i></div>
						</li>
						<!--二维码 -->
						<li class="qtitem ">
							<a href="#none "><span class="mpbtn_qrcode "></span></a>
							<div class="mp_qrcode " style="display:none; "><img src="images/weixin_code_145.png " /><i class="icon_arrow_white "></i></div>
						</li>
						<li class="qtitem ">
							<a href="#top " class="return_top "><span class="top "></span></a>
						</li>
					</div>

					<!--回到顶部 -->
					<div id="quick_links_pop " class="quick_links_pop hide "></div>

				</div>

			</div>
			<div id="prof-content " class="nav-content ">
				<div class="nav-con-close ">
					<i class="am-icon-angle-right am-icon-fw "></i>
				</div>
				<div>
					我
				</div>
			</div>
			<div id="shopCart-content " class="nav-content ">
				<div class="nav-con-close ">
					<i class="am-icon-angle-right am-icon-fw "></i>
				</div>
				<div>
					购物车
				</div>
			</div>
			<div id="asset-content " class="nav-content ">
				<div class="nav-con-close ">
					<i class="am-icon-angle-right am-icon-fw "></i>
				</div>
				<div>
					资产
				</div>

				<div class="ia-head-list ">
					<a href="# " target="_blank " class="pl ">
						<div class="num ">0</div>
						<div class="text ">优惠券</div>
					</a>
					<a href="# " target="_blank " class="pl ">
						<div class="num ">0</div>
						<div class="text ">红包</div>
					</a>
					<a href="# " target="_blank " class="pl money ">
						<div class="num ">￥0</div>
						<div class="text ">余额</div>
					</a>
				</div>

			</div>
			<div id="foot-content " class="nav-content ">
				<div class="nav-con-close ">
					<i class="am-icon-angle-right am-icon-fw "></i>
				</div>
				<div>
					足迹
				</div>
			</div>
			<div id="brand-content " class="nav-content ">
				<div class="nav-con-close ">
					<i class="am-icon-angle-right am-icon-fw "></i>
				</div>
				<div>
					收藏
				</div>
			</div>
			<div id="broadcast-content " class="nav-content ">
				<div class="nav-con-close ">
					<i class="am-icon-angle-right am-icon-fw "></i>
				</div>
				<div>
					充值
				</div>
			</div>
		</div>
		<script>
			window.jQuery || document.write('<script src="basic/js/jquery.min.js "><\/script>');
		</script>
		<script type="text/javascript " src="basic/js/quick_links.js "></script>
		
	</body>

</html>