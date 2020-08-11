<%@page import="java.io.PrintWriter"%>
<%@page import="member.Member_DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function result() {
		opener.document.fr.id.value = document.getElementById("finallyId").value;
		opener.document.fr.id.disabled = "disabled";
		window.close();
	}

</script>
</head>
<body>
	
	<%
	
		String userid = request.getParameter("userid");
	
		Member_DAO mdao = new Member_DAO();
		int result = mdao.idCheck(userid);
		
		 if(result == 0 ){
			PrintWriter sc = response.getWriter();
			sc.println("<script>");
			sc.println("alert('사용하실수 있습니다.')");
			sc.println("</script>");
		} 
		
	%>
		<button onclick="result()">사용하기</button>
	
	<%
	%>
		<form action="idcheck.jsp?userid=<%=userid %>" method="POST">
		아이디 : <input type="text" name="userid" value="<%=userid%>" id="finallyId"/>
				<input type="submit" value="중복확인"/>
		</form>
</body>
</html>