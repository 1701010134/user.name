<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>个人银行后台系统</title>
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>

<!-- 自定义样式 -->
<link href="${pageContext.request.contextPath}/css/dashboard.css" rel="stylesheet">

<!-- 基于bootstrap的titatoggle滑动按钮样式 -->
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="https://cdn.bootcdn.net/ajax/libs/titatoggle/2.1.2/titatoggle-dist.css" rel="stylesheet">

<!-- bootstrap-table -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.15.3/dist/bootstrap-table.min.css">
<!-- Latest compiled and minified JavaScript -->
<script src="https://unpkg.com/bootstrap-table@1.15.3/dist/bootstrap-table.min.js"></script>
<!-- Latest compiled and minified Locales -->
<script src="https://unpkg.com/bootstrap-table@1.15.3/dist/locale/bootstrap-table-zh-CN.min.js"></script>

<link href="css/titatoggle-dist.css" rel="stylesheet">     
<script src="../js/echarts.min.js"></script>
<script src="../js/index.js"></script>
<script src="../js/shandong.js"></script>
<link rel="stylesheet" href="../css/index.css">
</head>
<body>
<!-- 网页头部 -->
<a class="btn btn-default" href="#" role="button">Link</a>
<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
    <a class="navbar-brand" href="#">银行后台系统1.0</a>
    </div>
  </div>
</nav>

<div class="container-fluid" id="wrapper">
   <!-- 网页左边导航栏 -->
  <div class="col-sm-3 col-md-2 sidebar" id="sidebar-wrapper" role="navigation" style="margin-top:20px;margin-left:-12px;">
    <ul class="nav sidebar-nav">
      <li><a href="#" onclick="opens(1)" id="li1" class="sidebar-brand sidebarwidth" onmouseover="mousein(1)" onmoseout="mouseout(1)">首页</a></li>
      <li>
        <a href="#" class="dropdown-toggle sidebarwidth" data-toggle="dropdown" id="li2" class="dropdown" onmouseover="mousein(2)" onmoseout="mouseout(2)">二级菜单<span class="caret"></span></a>
        <ul class="dropdown-menu" role="menu">
          <li><a href="http://www.baidu.com" target="_Self" style="padding-top:10px">Action</a></li>
          <li><a href="#" style="padding-top:10px">Another action</a></li>
          <li><a href="#" style="padding-top:10px" >Something else here</a></li>
          <li><a href="#" style="padding-top:10px">Separated link</a></li>
          <li><a href="#" style="padding-top:10px">One more separated link</a></li>
         </ul>
        </li>
      <li><a href="#" class="sidebarwidth" onclick="opens(2)" action="${pageContext.request.contextPath}/account/selectAccounts" id="li3" onmouseover="mousein(3)" onmoseout="mouseout(3)">账户管理</a></li>
      <li><a href="#" class="sidebarwidth" onclick="opens(3)" action="${pageContext.request.contextPath}/account/ApprovalselectAccounts" id="li4" onmouseover="mousein(4)" onmoseout="mouseout(4)">借贷管理</a></li>
      <li><a href="#" class="sidebarwidth" onclick="opens(4)" id="li5" onmouseover="mousein(5)" onmoseout="mouseout(5)">理财管理</a></li>
      <li><a class="glyphicon glyphicon-off sidebarwidth" href="${pageContext.request.contextPath}/signOut" id="li6" onmouseover="mousein(6)" onmoseout="mouseout(6)">退出</a></li>
    </ul>
  </div>
 </div>
 <jsp:include page="account_right_chart.jsp"></jsp:include>
 <jsp:include page="account_right_save.jsp"></jsp:include>
 <jsp:include page="approval_right.jsp"></jsp:include>
 <jsp:include page="invest_right.jsp"></jsp:include>


<script type="text/javascript"> 

  function queryAccount(){
	  console.log($("#query_account_form").serialize());
	  $.post("${pageContext.request.contextPath}/account/selectAccount",
			  $("#query_account_form").serialize(),
			  function(data){
				  if(data=="OK"){
					  alert("账户查询成功！");
				  }else{
					  alert("账户查询失败！");
			  } 
	  });
  }
</script>

<script type="text/javascript">
<!-- 页面内跳转 -->
function opens(obj){
	   for(var i = 1 ; i <= 4 ; i++){
	      if(i == obj){
	          document.getElementById("dis"+i).style.display="block";
	      }else
	    	  document.getElementById("dis"+i).style.display="none";
	}
	}

  function createAccount(){
	  console.log($("#new_account_form").serialize());
	  alert("createAccount");
	  $.post("${pageContext.request.contextPath}/account/insertAccount",
			  $("#new_account_form").serialize(),
			  function(data){
				  if(data=="OK"){
					  alert("账户新建成功！");
					  $("#addModal").modal("hide");
				  }else{
					  alert("账户新建失败！");
					  $("#addModal").modal("hide");
			  }
				  
	  });
  }
</script>

<script type="text/javascript">
  function createApprovalAccount(){
	  console.log($("#new_approvalaccount_form").serialize());
	  $.post("${pageContext.request.contextPath}/approval/insertApprovalAccount",
			  $("#new_approvalaccount_form").serialize(),
			  function(data){
				  if(data=="OK"){
					  alert("借款账户新建成功！");
					  $("#addApprovalModal").modal("hide");
				  }else{
					  alert("借款账户新建失败！");
					  $("#addApprovalModal").modal("hide");
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
		  if(data!=""){
			  alert("账户修改成功！");		  
			  $('#table').bootstrapTable('updateRow', {
				     index: 0,//从0开始
				     replace:true,
				     row: {
				       id:data.id,
				       no:data.no,
				       name:data.name,
			           balance:data.balance
				     }
				    }); 
			  $("#updateModal").modal("hide");
		  }else{
			  alert("账户修改失败！");
			  $("#updateModal").modal("hide");
		  }
		  });
  }

  </script>
 
<script type="text/javascript">
  function updateApprovalAccount(){
	  
	  var id = $("#edit_approvalid").val();
	  var no = $("#edit_approvalno").val();
	  var name = $("#edit_approvalname").val();
	  var status = $("#edit_approvalstatus").val();
	  var loan = $("#edit_approvalloan").val();
	  var a = {
			  id2:id,
			  no2:no,
			  name2:name,
			  status:status,
			  loan:loan
	  }
	  console.log(a)
		  $.ajax({
              type:"post",
			  url:"${pageContext.request.contextPath}/approval/updateApprovalAccount",
			  dataType:"text",
			  contentType:"application/json",
			  data:JSON.stringify(a),
			  success:function(data){
				  alert("success");
				  console.log(data);
				  if(data=="OK"){
					  $('#approval_table').bootstrapTable('updateRow', {
						     index: 0,//从0开始
						     replace:true,
						     row: {
						       id:data.id2,
						       no:data.no2,
						       name:data.name2,
					           loan:data.loan,
					           status:data.status
						     }
						    }); 
					  $("#updateApprovalModal").modal("hide");
				  }else{
					  console.log(data);
					  alert("账户修改失败！");
					  $("#updateApprovalModal").modal("hide");
				  }
			  },error:function(data){
				  alert("error");
				  console.log(data);
				  
			  }
	  });
		  }
	  
  </script>
 
  <script type="text/javascript">
  $(document).ready(function(){
	  $('#table').on('click-row.bs.table', function (e, row, $element, field) {//bootstraptable点击行事件
	  $.ajax({
		  type:"get",
		  url:"${pageContext.request.contextPath}/account/getAccountByid",
		  data:{"id":row.id},
		  success:function(data){
			$("#edit_id").val(data.id);
			$("#edit_no").val(data.no);
			$("#edit_name").val(data.name);
			$("#edit_balance").val(data.balance);
		  }
		  });
  });
	  });
  </script>
  
<script type="text/javascript">
$(document).ready(function(){
	  $('#approval_table').on('click-row.bs.table', function (e, row, $element, field) {//bootstraptable点击行事件
		  $.ajax({
			  type:"get",
			  url:"${pageContext.request.contextPath}/approval/getApprovalAccountByid",
			  data:{"id2":row.id2},
			  success:function(data){
				$("#edit_approvalid").val(data.id2);
				$("#edit_approvalno").val(data.no2);
				$("#edit_approvalname").val(data.name2);
				$("#edit_approvalloan").val(data.loan);
				$("#edit_approvalstatus").val(data.status);
			  }
			  });
});
});
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
					 
				  });
	  }
  }
  </script>
  
    <script type="text/javascript">
  function deleteApprovalAccount(id2){
	  if(confirm("确实要删除该账户吗？")){
		  console.log(id2);
		  $.post(
				  "${pageContext.request.contextPath}/approval/deleteApprovalAccount",
				  {"id2":id2},
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
$(document).ready(function(){
	var status=new Array()
	  $.post("${pageContext.request.contextPath}/approval/getApprovalAccountstatus",
	  {"status":status},
      function(status){
		  var i=0;
		  while(i<status.length){
		  if(status[i]==1){
			  $(".cb").eq(i).prop("checked",true);
		  }else{
			  $(".cb").eq(i).prop("checked",false);
		  }
		  i++;
		  }
	  });
});
</script>

<script type="text/javascript"> <!--bug-->
function setApprovalAccountstatus(id2,status){
	    var index = $(".cb").index(this);
	    alert("index="+index);
		var flage = $(".cb").eq(index).is(":checked");
		alert("flage="+flage);
		var status;
	    if(flage){
	    	status = 0;
	    }else{
	    	status = 1;
	    }
	
$.ajax({
	  type:"post",
	  url:"${pageContext.request.contextPath}/approval/setApprovalAccountstatus",
	  data:{"id2":id2,"status":status},
	  success:function(data){
		  alert("id2="+id2);
		  if(data=="OK"){
			  alert("已设置为审核通过！");
		  }else{
			  alert("已设置为审核不通过！");
		  }
	  }
});
}
</script>
 
<script type="text/javascript">
  function checkNewNo(){
	  var no=$("#no").val().trim();
	  var noID="#no";
	  console.log("checkNewNo1:"+no+","+noID);
	  checkExist(no,noID);
  }
  
  function checkEditNo(){
	  <!--trim() 方法用于删除字符串的头尾空格。 -->
	  var no=$("#edit_no").val().trim();
	  var noID="#edit_no";
	  console.log("checkNewNo2:"+no+","+noID);
	  checkExist(no,noID);
  }
  
  function checkExist(no,noID){
	  console.log("checkExist3:"+no+","+noID);
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
  function checkNewApprovalNo(){
	  var no2=$("#no2").val().trim();
	  var noID2="#no2";
	  console.log("checkNewNo"+no2+":"+noID2);
	  checkApprovalExist(no2,noID2);
  }
  
  function checkEditApprovalNo(){
	  <!--trim() 方法用于删除字符串的头尾空格。 -->
	  var no2=$("#edit_approvalno").val().trim();
	  var noID2="#edit_approvalno";
	  checkApprovalExist(no2,noID2);
  }
  
  function checkApprovalExist(no2,noID2){
	  console.log("checkExist"+no2+":"+noID2);
	  $.ajax({
		  type:"post",
		  url:"${pageContext.request.contextPath}/approval/getApprovalAccountByNo",
		  data:{"no2":no2},
		  success:function(data){
			  if(data=="OK"){
				  alert("此账号已经存在,请重新输入!");
				  $(noID2).val("");
				  $(no2).focus();
			  }
		  }
	  });
  }
 </script>
 <script type="text/javascript">
  <!--侧边栏开关 -->
  $(document).ready(function() {
	  var trigger = $('.hamburger'),
	  overlay = $('.overlay'),
	  isClosed = false;

	  trigger.click(function() {
	    hamburger_cross();
	  });
	  overlay.click(function() {
	    hamburger_cross();
	    $('#wrapper').toggleClass('toggled');
	  });

	  function hamburger_cross() {
	    if (isClosed == true) {
		  trigger.removeClass("glyphicon glyphicon-option-vertical");
		  trigger.addClass("glyphicon glyphicon-remove");
	      trigger.removeClass('is-open');
	      trigger.addClass('is-closed');
	      isClosed = false;
	    } else {
	      trigger.addClass("glyphicon glyphicon-option-vertical");
	      trigger.removeClass("glyphicon glyphicon-remove");
	      trigger.removeClass('is-closed');
	      trigger.addClass('is-open');
	      isClosed = true;
	    }
	  }

	  $('[data-toggle="offcanvas"]').click(function() {
	    $('#wrapper').toggleClass('toggled');
	  });
	});
  
  function mousein(obj){//bug
    for(i=1;i<=6;i++){
	 if(obj==i){  
	      $("#li"+i).addClass("black");
	  }else{
		  $("#li"+i).addClass("white");
		  }
	  }
  }

  function mouseout(obj){//bug
	  for(i=1;i<=6;i++){
		if(obj==i){
		  $("#li"+i).addClass("white");
		 }else{
		  $("#li"+i).addClass("black");
		 }
		}
	 }


</script>
<script type="text/javascript">//账户管理页面初始化表格

function addAccountButton(value, row, index) {
    return [
    '<A id="accountupdate" class="btn btn-default" href="#" data-toggle="modal" data-target="#updateModal"><span class="glyphicon glyphicon-pencil"></span></A>&nbsp&nbsp',
    '<A class="btn btn-default accountdelete" href="#" onClick="deleteAccount(id)"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></A>',
    ].join('');
  }
    
$('#table').bootstrapTable({
	  url: '${pageContext.request.contextPath}/account/initAccount',
	  pagination: true, 
	  search: true,
	  columns: [{
	    field: 'id',
	    title: 'ID'
	  }, {
	    field: 'no',
	    title: 'NO'
	  }, {
	    field: 'name',
	    title: 'NAME'
	  }, {
		    field: 'balance',
		    title: 'BALANCE',
	  },{
		  field:'操作',
		  title:'operate',
	      formatter: addAccountButton//表格中增加按钮
	  }]
	});
</script>

<script type="text/javascript">//借贷页面初始化表格
function addApprovalUpdateButton(value, row, index) {
    return [
    '<A class="btn btn-default" href="#" data-toggle="modal" data-target="#updateApprovalModal"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></A>'
    ].join('');
  }
function addApprovalUpdateStatusButton(value, row, index){
	return [
	    '<div class="checkbox checkbox-slider--default"><label><input type="checkbox"  id="ck" class="cb" onClick="setApprovalAccountstatus(id2,status)"><span>TiTaToggle+ ${approval.status}</span></label></div>'
	    ].join('');
}

$('#approval_table').bootstrapTable({
	  url: '${pageContext.request.contextPath}/approval/initApprovals',
	  pagination: true, 
	  search: true,
	  columns: [{
	    field: 'id2',
	    title: 'APPROVALID'
	  }, {
	    field: 'no2',
	    title: 'APPROVALNO'
	  }, {
	    field: 'name2',
	    title: 'APPROVALNAME'
	  }, {
		    field: 'loan',
		    title: 'APPROVALLOAN',
	  },{
		  field:'status',
		  title:'APPROVALSTAUTS',
		  formatter: addApprovalUpdateStatusButton//表格中增加审核按钮
	  },{
		  field:'操作',
		  title:'APPROVALOPERATE',
	      formatter: addApprovalUpdateButton//表格中增加修改按钮
	  }]
	});
</script>
</body>
</html>