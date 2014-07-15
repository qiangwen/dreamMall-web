<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<script type="text/javascript" src="${path}/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var $body = $("body");
		var arr = new Array();
		arr[0]={id:0};
		arr[1]={id:1};
		arr[2]={id:2};
		arr[3]={id:3};
		arr[4]={id:4};
		arr[5]={id:5};
		for(var i = 0 ; i < arr.length ; i++){
			var html = "<a id='a_"+arr[i].id+"' href='javascript:void(0);' onclick='show('"+arr[i].id+"');'>"+arr[i].id+"</a><hr>";

			$body.append(html);
			//var obj = arr[i];
			//$("#a_"+arr[i].id).click(function(){alert(obj.id)});
		}
	});
	
	function show(id){
		alert(id);
	}
	$(function(){
		$("#jsonp").click(function(){
			$.ajax({
				url:"/demo/jsonp.action",
				type:"GET",
				async:false,
				dataType:"jsonp",
				jsonp:"jsonpCallback",
				jsonpCallback:"showAge",
				success:function(data){
					//alert(data.name);
				}
				
				
			}
			);
			
		});
		
	});
	function showAge(data){
		alert(data.age);
	}
</script>
</head>
<body>
	<a id="dd" href="javascript:void(0);" onclick="show('ddddddd');">sfadsfsda   ${wen}</a>
	<a id="jsonp" href="">使用jsonp</a>
</body>
</html>

