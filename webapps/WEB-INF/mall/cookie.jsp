<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<script type="text/javascript" src="${path}/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${path}/js/jquery.cookie.js"></script>
<script type="text/javascript">

	var GetCookieValue = function(cookieName){
		//js实现
		/* var cookieValue = document.cookie;
		var cookieArray = cookieValue.split(";");
		var resultCookieValue = null;
		for(var i=0;i<cookieArray.length;i++){
			if(cookieArray[i].indexOf(cookieName)!=-1){
				resultCookieValue =cookieArray[i].split("=")[1];
				break;
			}
		}
		return resultCookieValue; */
		//jquery.cookie
		var cookieValue = $.cookie(cookieName);
		return cookieValue;
		
	}

	var SetCookieValue = function(cookieName,cookieValue,expire){
		
		var expDate = new Date();
		expDate.setTime(expDate.getTime()+expire);
		var expString = ((expire=="-1") ? "" : (";expires="+expDate.toGMTString()));
		//js实现
		//document.cookie=cookieName+"="+cookieValue+expString;
		//jquery.cookie
		$.cookie(cookieName,cookieValue,{expires:expire});
		
		
	}
	var getDocumentCookie = function(){
		//alert(GetCookieValue("firstcookie"));
		//var cookieValue = GetCookieValue("firstcookie");
		document.getElementById("spanId").innerHTML=GetCookieValue("firstcookie");
		
	}
	$(function(){
		$("#spanId").text(GetCookieValue("firstcookie"));
		SetCookieValue("secondcookie","secondValue",30*60);
	});
</script>
</head>
<body><!-- onload="getDocumentCookie();" -->
	<a id="dd" href="${path}/cookie/getCookie.action" >发送cookie</a>
	<span id="spanId"></span>
</body>
</html>

