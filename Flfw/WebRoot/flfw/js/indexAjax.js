//请求并显示分类json数据包
$(document).ready(function(){
    $.ajax({
        type:'get',
        url:'/Flfw/index/CategoryList',
        dataType:'json',
        success:function(data){
            //console.log(data);
            var CategoryList = eval(data);
            $.each(CategoryList,function(index,item){
                var i = "#category_"+(index+1);
                $(i).after(item.name);
                var ti = ".shopTitle .category"+(index+1);
                $(ti).html(item.name);
                var html = '';
                var thtml = '';
                $.each(item.childList,function(childIndex,childItem){
                    html += "<dd><a href='"+childItem['id']+"'><span>"+childItem['name']+"</span></a></dd>";
                    thtml += "<a href='javascript:void(0)' onclick='flushProduct("+childItem['id']+","+(index+1)+")'><span>"+childItem['name']+"</span></a>";
                    //<dd><a href='100030'><span>进口洋酒</span></a></dd>
                });
                var ci = "#category_detail_"+(index+1);
                var tci = ".shopTitle .categoryList"+(index+1);
                $(ci).html(html);
                $(tci).html(thtml);
                html = '';
                thtml = '';
            });

        }
    });
});
//轮播图
$(document).ready(function(){
    $.ajax({
        type:'get',
        url:'/Flfw/index/BannerList',
        dataType:'json',
        success:function(data){
            console.log(data);
            var BannerList = eval(data);

            $.each(BannerList,function(index,item){
                var html = '';
                //<a href=""><img src="./images/banner/banner1.jpg" /></a>
                //<a href=''><img src=' ./images/banner/banner1.jpg'></a>
                html += "<a href=''><img src='"+item+"'></a>";
                console.log(html);
                var i = ".banner .am-slider .am-slides li.banner"+(index+1);
                $(i).html(html);
            });

        }
    });
});
 
//商品显示
$(document).ready(function(){
    $.ajax({
        type:'get',
        url:'/Flfw/index/ProductsList',
        dataType:'json',
        success:function(data){
            //console.log(data);
            var ProductsList = eval(data);

            $.each(ProductsList,function(index,item){
                var products = item.products;
                var i = ".productsList"+(index+1);
                $.each(products,function(pindex,pitem){
                    console.log(pitem);
                    var pi = "#product"+(index+1)+(pindex+1);
                    console.log(pi);
                    $(pi+" .outer-con "+".title").html(pitem['name']);
                    $(pi+" .outer-con "+".sub-title").html(pitem['subtitle']);
                    $(pi+" a").attr("href","/Flfw/product!send?id="+pitem['id']);
                    $(pi+" img").attr("src",pitem['mainImage']+" ");
                });
            });
        }
    });
});

//刷新商品显示
function flushProduct(id,listId){
    $.ajax({
        type : 'post',
        url : '/Flfw/index/CategoryProductsList',
        data : {
            "id" : id
        },
        success : function(data){
            //console.log(data);
            var productsList = eval(data);
            var i = ".productsList"+listId;
            $.each(productsList,function(index,item){
                var pi = "#product"+listId+(index+1);
                    $(pi+" .outer-con "+".title").html(item['name']);
                    $(pi+" .outer-con "+".sub-title").html(item['subtitle']);
                    $(pi+" a").attr("href","/Flfw/product!send?id="+item['id']);
                    $(pi+" img.lay").attr("data-original",item['mainImage']);
            });
        },
        error : function() {
            alert("请求失败");
        },
        dataType : "json"
    });
}