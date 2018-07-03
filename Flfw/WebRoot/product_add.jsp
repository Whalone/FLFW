<%--
  Created by IntelliJ IDEA.
  User: kamisama
  Date: 2018/6/24
  Time: 14:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>添加商品</title>
    <link rel="Bookmark" href="/favicon.ico" >
    <link rel="Shortcut Icon" href="/favicon.ico" />
    <!--[if lt IE 9]>
    <script type="text/javascript" src="lib/html5shiv.js"></script>
    <script type="text/javascript" src="lib/respond.min.js"></script>

    <![endif]-->
    <link rel="stylesheet" type="text/css" href="./admin/static/h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="./admin/static/h-ui.admin/css/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css" href="./admin/lib/Hui-iconfont/1.0.8/iconfont.css" />

    <link rel="stylesheet" type="text/css" href="./admin/static/h-ui.admin/skin/default/skin.css" id="skin" />
    <link rel="stylesheet" type="text/css" href="./admin/static/h-ui.admin/css/style.css" />
    <!--[if IE 6]>
    <script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->
    <!--/meta 作为公共模版分离出去-->

    <link href="./admin/lib/webuploader/0.1.5/webuploader.css" rel="stylesheet" type="text/css" />
</head>
<body>
  <div class="page-container">
    <form action="/Flfw/index/ProductSave.action" method="post" class="form form-horizontal" id="form-article-add">
      <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>产品标题：</label>
        <div class="formControls col-xs-8 col-sm-9">
          <input type="text" class="input-text" value="" placeholder="" id="" name="name">
        </div>
      </div>
      <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2">简略标题：</label>
        <div class="formControls col-xs-8 col-sm-9">
          <input type="text" class="input-text" value="" placeholder="" id="" name="subtitle">
        </div>
      </div>
      <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>分类栏目：</label>
        <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
          <select class="select category" name="categoryId">
          </select>
          </span> </div>
      </div>
      <!-- <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2">排序值：</label>
        <div class="formControls col-xs-8 col-sm-9">
          <input type="text" class="input-text" value="0" placeholder="" id="" name="">
        </div>
      </div> -->
      <!-- <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2">允许评论：</label>
        <div class="formControls col-xs-8 col-sm-9 skin-minimal">
          <div class="check-box">
            <input type="checkbox" id="checkbox-1">
            <label for="checkbox-1">&nbsp;</label>
          </div>
        </div>
      </div> -->
      <!-- <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2">产品规格：</label>
        <div class="formControls col-xs-8 col-sm-9">
          <input type="text" name="" id="" placeholder="输入长度" value="" class="input-text" style=" width:25%">
          MM
          <input type="text" name="" id="" placeholder="输入宽度" value="" class="input-text" style=" width:25%">
          MM
          <input type="text" name="" id="" placeholder="输入高度" value="" class="input-text" style=" width:25%">
          MM </div>
      </div> -->
      <!-- <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2">产地：</label>
        <div class="formControls col-xs-8 col-sm-9">
          <input type="text" name="" id="" placeholder="" value="" class="input-text">
        </div>
      </div>
      <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2">材质：</label>
        <div class="formControls col-xs-8 col-sm-9">
          <input type="text" name="" id="" placeholder="" value="" class="input-text">
        </div>
      </div>
      <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2">所属供应商：</label>
        <div class="formControls col-xs-8 col-sm-9">
          <input type="text" name="" id="" placeholder="" value="" class="input-text">
        </div>
      </div> -->
      <!-- <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2">价格计算单位：</label>
        <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
          <select class="select">
            <option>请选择</option>
            <option value="1">件</option>
            <option value="2">斤</option>
            <option value="3">KG</option>
            <option value="4">吨</option>
            <option value="5">套</option>
          </select>
          </span> </div>
      </div> -->
      <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2">产品库存：</label>
        <div class="formControls col-xs-8 col-sm-9">
          <input type="text" name="stock" id="" placeholder="" value="" class="input-text" style="width:90%">
          件</div>
      </div>
      <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2">折扣价格：</label>
        <div class="formControls col-xs-8 col-sm-9">
          <input type="text" name="priceNow" id="" placeholder="" value="" class="input-text" style="width:90%">
          元</div>
      </div>
      <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2">成本价格：</label>
        <div class="formControls col-xs-8 col-sm-9">
          <input type="text" name="priceOriginal" id="" placeholder="" value="" class="input-text" style="width:90%">
          元</div>
      <!-- </div>
      <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2">成本价格：</label>
        <div class="formControls col-xs-8 col-sm-9">
          <input type="text" name="" id="" placeholder="" value="" class="input-text" style="width:90%">
          元</div>
      </div> -->
      <!-- <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2">最低销售价格：</label>
        <div class="formControls col-xs-8 col-sm-9">
          <input type="text" name="" id="" placeholder="" value="" class="input-text" style="width:90%">
          元</div>
      </div> -->
      <!-- <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2">销售开始时间：</label>
        <div class="formControls col-xs-8 col-sm-9">
          <input type="text" onfocus="WdatePicker({ dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}' })" id="datemin" class="input-text Wdate" style="width:180px;">
        </div>
      </div>
      <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2">销售结束时间：</label>
        <div class="formControls col-xs-8 col-sm-9">
          <input type="text" onfocus="WdatePicker({ dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'datemin\')}' })" id="datemax" class="input-text Wdate" style="width:180px;">
        </div>
      </div> -->
      <!-- <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2">产品关键字：</label>
        <div class="formControls col-xs-8 col-sm-9">
          <input type="text" name="" id="" placeholder="多个关键字用英文逗号隔开，限10个关键字" value="" class="input-text">
        </div>
      </div> -->
      <!-- <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2">产品摘要：</label>
        <div class="formControls col-xs-8 col-sm-9">
          <textarea name="" cols="" rows="" class="textarea"  placeholder="说点什么...最少输入10个字符" datatype="*10-100" dragonfly="true" nullmsg="备注不能为空！" onKeyUp="$.Huitextarealength(this,200)"></textarea>
          <p class="textarea-numberbar"><em class="textarea-length">0</em>/200</p>
        </div>
      </div> -->
      <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"></label>
        <div class="formControls col-xs-8 col-sm-9">
        </div>
      </div> 
      <!-- <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2">缩略图：</label>
        <div class="formControls col-xs-8 col-sm-9">
          <div class="uploader-thum-container">
            <div id="fileList" class="uploader-list"></div>
            <div id="filePicker">选择图片</div>
            <button id="btn-star" class="btn btn-default btn-uploadstar radius ml-10">开始上传</button>
          </div>
        </div>
      </div> -->
      <!-- <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2">图片上传：</label>
        <div class="formControls col-xs-8 col-sm-9">
          <div class="uploader-list-container">
            <div class="queueList">
              <div id="dndArea" class="placeholder">
                <div id="filePicker-2"></div>
                <p>或将照片拖到这里，单次最多可选300张</p>
              </div>
            </div>
            <div class="statusBar" style="display:none;">
              <div class="progress"> <span class="text">0%</span> <span class="percentage"></span> </div>
              <div class="info"></div>
              <div class="btns">
                <div id="filePicker2"></div>
                <div class="uploadBtn">开始上传</div>
              </div>
            </div>
          </div>
        </div>
      </div> -->
      <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2">详细内容：</label>
        <div class="formControls col-xs-8 col-sm-9"> 
          <script name="detail" id="editor" type="text/plain" style="width:100%;height:400px;" ></script> 
        </div>
      </div>
      <div class="row cl">
        <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
          <button class="btn btn-primary radius" type="submit"><i class="Hui-iconfont" >&#xe632;</i> 保存</button>
          <!-- <button onClick="article_save();" class="btn btn-secondary radius" type="button"><i class="Hui-iconfont">&#xe632;</i> 保存草稿</button> -->
          <button onClick="layer_close();" class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
        </div>
      </div>
    </form>
    <!-- <div class="row cl">
      <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
        
        <button onClick="layer_close();" class="btn btn-default radius" type="button">&nbsp;&nbsp;返回&nbsp;&nbsp;</button>
      </div>
    </div> -->

  </div>
  
  <!--_footer 作为公共模版分离出去-->
  <script type="text/javascript" src="./admin/lib/jquery/1.9.1/jquery.min.js"></script> 
  <script type="text/javascript" src="./admin/lib/layer/2.4/layer.js"></script>
  <script type="text/javascript" src="./admin/static/h-ui/js/H-ui.min.js"></script> 
  <script type="text/javascript" src="./admin/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->
  
  <!--请在下方写此页面业务相关的脚本-->
  <script type="text/javascript" src="./admin/lib/My97DatePicker/4.8/WdatePicker.js"></script>
  <script type="text/javascript" src="./admin/lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
  <script type="text/javascript" src="./admin/lib/jquery.validation/1.14.0/validate-methods.js"></script> 
  <script type="text/javascript" src="./admin/lib/jquery.validation/1.14.0/messages_zh.js"></script>
  <script type="text/javascript" src="./admin/lib/webuploader/0.1.5/webuploader.min.js"></script> 
  <script type="text/javascript" src="./admin/lib/ueditor/1.4.3/ueditor.config.js"></script>
  <script type="text/javascript" src="./admin/lib/ueditor/1.4.3/ueditor.all.min.js"> </script>
  <script type="text/javascript" src="./admin/lib/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script>
  <script type="text/javascript">
  $(document).ready(function(){
      $.ajax({
        type:'get',
        url:'/Flfw/index/CategoryList',
        dataType:'json',
        success:function(data){
          //console.log(data);
          var CategoryList = eval(data);
          var i = ".category"
          var html = '';
          $.each(CategoryList,function(index,item){
              $.each(item.childList,function(childIndex,childItem){
                  html += "<option value='"+childItem.id+"'>"+childItem.name+"</option>"
              });
          });
          $(i).html(html);
        } 
      });
  });
  $(function(){
    var ue = UE.getEditor('editor');
  });
  </script>
</body>
</html>