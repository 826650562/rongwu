<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("basePath", request.getContextPath());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="${basePath }/js/jquery-1.11.1.min.js"></script>

</head>
<body>
	<input type="button" value="点击" onclick="getJson()" />

	<%-- <% response.sendRedirect("person/findAllPerson.action"); %> --%>
	<script type="text/javascript">
		function getJson() {
			jQuery.ajax({
				url : "person/findPerson.action",
				data : {
					p_name : '100'
				},
				type : "post",
				dataType : "json",
				success : function(xx) {},
				error : function(error) {}
			});
		}
	</script>
</body>
</html>