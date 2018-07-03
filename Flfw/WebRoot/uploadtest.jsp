<%--
  Created by IntelliJ IDEA.
  User: kamisama
  Date: 2018/6/24
  Time: 23:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix=""%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>test</title>
</head>
<body>
<s:form name="upload" action="upload" method="POST" enctype="multipart/form-data" namespace="/">
    <s:file name="file" label="选择"></s:file>
    <s:submit value="上传"></s:submit>
</s:form>
</body>
</html>
