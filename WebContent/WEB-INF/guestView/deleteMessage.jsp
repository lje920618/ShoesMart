<%@page import="guestbook.service.InvalidPassowrdException"%>
<%@page import="guestbook.service.DeleteMessageService"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%
	int messageId = Integer.parseInt(request.getParameter("messageId"));
	String password = request.getParameter("password");
	boolean invalidPassowrd = false;
	try{
		DeleteMessageService deleteService = DeleteMessageService.getInstance();
		deleteService.deleteMessage(messageId, password);
	}catch(InvalidPassowrdException ex){
		invalidPassowrd = true;
	}
%>
<html>
<head>
<title>방명록 메시지 삭제함</title>
</head>
<body>
<% if(!invalidPassowrd){ %>
메시지를 삭제하였습니다.
<% } else { %>
입력한 암호가 올바르지 않습니다. 암호를 확인해주세요.
<% } %>
<br/>
<a href="NikeItemView.jsp">[목록보기]</a>
</body>
</html>