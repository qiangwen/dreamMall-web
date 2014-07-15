<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
 <script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
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
</script>
</head>
<body>
	<a id="dd" href="javascript:void(0);" onclick="show('ddddddd');">sfadsfsda</a>
</body>
</html>

