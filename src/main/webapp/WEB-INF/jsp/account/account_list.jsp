<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isELIgnored="false"  %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>个人银行后台系统</title>
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
 
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
 
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<!-- 网页头部 -->
<a class="btn btn-default" href="#" role="button">Link</a>

<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
    <a class="navbar-brand" href="#">个人银行后台系统1.0</a>
    </div>
  </div>
</nav>
  

  <div class="container-fluid">
   <div class="row">
     <!-- 网页左边导航栏 -->
   <div class="col-sm-3 col-md-2 sidebar">
    <ul class="nav nav-sidebar">
     <li ><a href="${pageContext.request.contextPath}/account/selectAccounts">概览<span class="sr-only">(current)</span></a></li>
     <li><a href="${pageContext.request.contextPath}/account/selectAccounts">账户管理</a></li>
   </ul>
   <ul class="nav nav-sidebar">
   <li><a href="${pageContext.request.contextPath}/signOut">退出</a></li>
   </ul>
  </div>
  
  <!-- 网页右边 -->
  <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
    <h2 class="page-header">账户管理</h2>
    <!-- 搜索表单，可以录入账号，姓名，页码和每行页数 -->
    <div id="navbar" class="navbar-collapse collapse">
   <form class="navbar-form navbar-right" action="${pageContext.request.contextPath}/account/selectAccounts">
    <input type="text" id="search_no" name="no" value="${queryParam.no}" class="form-control" placeholder="账号.."/>
    <input type="text" id="search_name" name="name" value="${queryParam.name}" class="form-control" placeholder="姓名.."/>
页码:<input type="text" id="search_page" name="page" value="${page}" class="form-control"/>
每行页数:<input type="text" id="search_rows" name="rows" value="${rows}" class="form-control"/>
     <button type="submit" class="btn btn-default btn-sg">
     <span class="glyphicon glyphicon-search" aria-hiddden="true"></span>
     </button>
   </form>
   </div>
   <!-- 添加按钮，点击会打开模态对话框addModal -->
   <button type="button" class="btn btn-default btn-sg" data-toggle="modal" data-target="#addModal">
   <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
   </button>
   <!-- 账户信息列表 -->
   <div class="table-responsive">
     <!-- 按行显示账户信息的表格 -->
     <table class="table table-striped">
     <thead>
       <tr>
         <th>#</th>
         <th>账户</th>
         <th>姓名</th>
         <th>余额</th>
         <th>操作</th>
       </tr>  
     </thead>
     <tbody>
       <c:forEach items="${pageInfo.list}" var="account">
       <!-- 显示一行账户信息 -->
       <tr>
         <td>${account.id}</td>
         <td>${account.no}</td>
         <td>${account.name}</td>
         <td>${account.balance}</td>
         <td>
         <!-- 编辑按钮超链接，点击执行editAccount并打开模态对话框updateModel -->
         <A class="btn btn-default" href="#" data-toggle="modal" data-target="#updateModal" onClick="editAccount(${account.id})">
         <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></A>
         &nbsp;&nbsp;
         <!-- 删除按钮样式超链接，点击执行deleteAccount并打开确认删除对话框 -->
         <A class="btn btn-default" href="#" onClick="deleteAccount(${account.id})">
         <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
         </A>
         </td>
         </tr>
         </c:forEach>
     </tbody>
     </table>
     <!-- 显示页号，上一页，下一页的表格 -->
     <table class="gridtable" style="width:100%;text-align:center;">
       <tr>
         <c:if test="${pageInfo.hasPreviousPage}">
           <td>
             <a href="${pageContext.request.contextPath}${pageurl}
             ?page=${pageInfo.prePage}&rows=${pageInfo.pageSize}">前一页</a>
             </td>
         </c:if>
         <c:forEach items="${pageInfo.navigatepageNums}" var="nav">
           <c:if test="${nav==pageInfo.pageNum}">
             <td style="font-weight:bold;">${nav}</td>
           </c:if>
           <c:if test="${nav!=pageInfo.pageNum}">
             <td>
               <a href="${pageContext.request.contextPath}&{pageurl}?page=${nav}&rows=${pageInfo.pageSize}">${nav}</a>
               </td> 
           </c:if>
         </c:forEach>
         <c:if test="${pageInfo.hasNextPage}">
           <td>
             <a href="${pageContext.request.contextPath}&{pageurl}?page=${pageInfo.nextPage}rows=${pageInfo.pageSize}">下一页</a>
           </td>
         </c:if>
        </tr>
       </table>
     </div>
   </div>
 </div>
 <!-- 新增账户Model -->
 <!-- tabindex=-1代表此元素禁止使用键盘上的tab键对其导航，就是按tab键的时候，会跳过这个div
role=“dialog”代表这是一个对话框
aria-labelledby：是残障人士使用屏幕阅读器时，会读取的内容
aria-hidden:是使用屏幕阅读器时，忽略该元素值 -->
 <div class="modal fadel" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times</span>
        </button>
          <h4 class="modal-title" id="myModalLabel">新增账户</h4>
      </div>
       <div class="modal-body">
         <form class="form-horizontal" id="new_account_form">
           <div class="form-group">
             <label for="no" class="col-sm-2 control-label">账号</label>
               <div class="col-sm-10">
                 <input type="text" class="form-control" id="no" name="no" placeholde="请输入账号" onChange="checkNewNo()">
               </div>
           </div>
         <div class="form-group">
           <label for="name" class="col-sm-2 control-label">姓名</label>
           <div class="col-sm-10">
             <input type="text" class="form-control" id="name" name="name" placeholder="请输入名字">
           </div>
         </div>
         <div class="form-group">
           <label for="balance" class="col-sm-2 control-label">余额</label>
             <div class="col-sm-10">
               <input type="text" class="form-control" id="balance" name="balance" placeholder="请输入余额">
             </div>
         </div>
         </form>
       </div>
         <div class="modal-footer">
		      <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		      <button type="button" class="btn btn-primary" onclick="createAccount()">新增</button>
   		 </div>
    </div>
  
  </div> 
 </div>
 </div>
 <!-- 修改账户modal -->
 <div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel">
   <div class="modal-dialog" role="document">
     <div class="modal-content">
       <div class="modal-header">
         <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times</span> 
         </button>
         <h4 class="modal-title" id="updateModalLabel">编辑账户</h4>
       </div>
       <div class="modal-body">
        <form class="form-horizontal" id="update_account_form">
          <input type="hidden" id="edit_id" name="id"/>
            <div class="form-group">
              <label for="edit_no" class="col-sm-2 control-label">账号</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" id="edit_no" name="no" onChange="checkEditNo()"/>
              </div>
            </div>
            <div class="form-group">
              <label for="edit_name" class="col-sm-2 control-label">姓名</label>
              <div class="col-sm-10">
              <input type="text" class="form-control" id="edit_name" name="name">
              </div>
            </div>
            <div class="form-group">
              <label for="edit_balance" class="col-sm-2 control-label">余额</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" id="edit_balance" name="balance">
              </div>
            </div>
        </form>
       </div>
       <div class="modal-footer">
         <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
         <button type="button" class="btn btn-primary" onclick="updateAccount()">修改</button>
       </div>
     </div>
   </div>
 </div>
<script type="text/javascript">
  function createAccount(){
	  console.log($("#new_account_form").serialize());
	  $.post("${pageContext.request.contextPath}/account/insertAccount",
			  $("#new_account_form").serialize(),
			  function(data){
				  if(data=="OK"){
					  alert("账户新建成功！");
				  }else{
					  alert("账户新建失败！");
			  }
		  	  window.location.reload();
	  });
  }
</script>
  <script type="text/javascript">
  function updateAccount(){
	  $.post("${pageContext.request.contextPath}/account/updateAccount",
			  $("#update_account_form").serialize(),
			  function(data){
		  if(data=="OK"){
			  alert("账户修改成功！");
		  }else{
			  alert("账户修改失败！");
		  }
		  window.location.reload();
	  });
  }
  </script>
    <script type="text/javascript">
  function editAccount(id){
	  $.ajax({
		  type:"get",
		  url:"${pageContext.request.request.contextPath}/account/getAccountByid",
		  data:{"id":id},
		  success:function(data){
			$("#edit_id").val(data.id);
			$("#edit_no").val(data.no);
			$("#edit_name").val(data.name);
			$("#edit_balance").val(data.balance);
		  }
		  });
  }
  </script>
  <script type="text/javascript">
  function deleteAccount(id){
	  if(confirm("确实要删除该账户吗？")){
		  console.log(id);
		  $.post(
				  "${pageContext.request.contextPath}/account/deleteAccount",
				  {"id":id},
				  function(data){
					  if(data=="OK"){
						  alert("删除账户成功");
					  }else{
						  alert("删除账户失败");
					  }
					  window.location.reload();
				  });
	  }
  }
  </script>
  <script type="text/javascript">
  function checkNewNo(){
	  var no=$("#no").val().trim();
	  var noID="#no";
	  console.log("checkNewNo"+no+":"+noID);
	  checkExist(no,noID);
  }
  
  function checkEditNo(){
	  var no=$("#edit_no").val().trim();
	  var noID="#edit_no";
	  checkExist(no.noID);
  }
  
  function checkExist(no,noID){
	  console.log("checkExist"+no+":"+noID);
	  $.ajax({
		  type:"post",
		  url:"${pageContext.request.request.contextPath}/account/getAccountByNo",
		  data:{"no":no},
		  success:function(data){
			  if(data=="OK"){
				  alert("此账号已经存在,请重新输入!");
				  $(noID).val("");
				  $(noID).focus();
			  }
		  }
	  });
  }
  </script>
  <script type="text/javascript">
 
  </script>
  <script type="text/javascript">
 
  </script>
</body>
</html>