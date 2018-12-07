<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录界面</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/signin.css" rel="stylesheet">
</head>
<body>
 <div class="container">
  <form class="form-signin" action="${pageContext.request.contextPath}/signOn" method="post" onsubmit="return check()"> 
     <h2 class="form-signin-heading">个人银行后台系统登录</h2>
     <span style="color:red" id="message">${msg}</span>
     <label for="no" class="sr-only">用户账号</label>
     <input type="text" id="no" name="no" class="form-control" placeholder="用户账号" required autofocus><br>
     <label for="password" class="sr-only">用户密码</label>
     <input type="password" id="password" name="password" class="form-control" placeholder="用户密码" required>
   <div class="checkbox">
     <label><input type="checkbox" value="remember-me" id="remember-me">记住我</label>
  </div>
     <button class="btn btn-lg btn primary btn-block" type="submit">登录</button>
  </form>
  </div>
  
  <script src="${pageContext.request.contextPath }/js/jquery-3.3.1.js"></script>
  <script src="${pageContext.request.contextPath }/js/jquery.cookie.js"></script>
  <script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
  
  <script>
  $(document).ready(function(){
	  if($.cookie('passwprd')!=null){
		  $("#password").val($.cookie("password"));
	  }
	  if($.cookie('no')!=null){
		  $("#no").val($.cookie('no'));
	  }
  });
  </script>
  <script>
    function check(){
    	if($("#remember-me").prop("checked")==true){
    		var no=$("#no").val();
    		var password=$("#password").val();
    		$.cookie('no',no,{expires:7});
    		$.cookie('password',password,{expires:7});
    	}else{
    		$.cookie("no",null);
    		$.cookie("password",null);
    	}
    }
    
   
  </script>
</body>
</html>