<%@page import="member.Member_DAO"%>
<%@page import="member.Member_Bean"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
			
	<%-- 		<jsp:useBean id="join" class="member.MemberBean">
			<jsp:setProperty name="join" property="*">
			</jsp:useBean> --%>
			
		<%
						String id = request.getParameter("id");
									String passwd =	request.getParameter("passwd");
									String passwd2 = request.getParameter("passwd2");
									String name = request.getParameter("name");
									int age = Integer.parseInt(request.getParameter("age"));
									String gender = request.getParameter("gender");
									String email = request.getParameter("email");
									String email2 = request.getParameter("email2");
									String address = request.getParameter("address");
									String tel = request.getParameter("tel");
									String mtel = request.getParameter("mtel");
									
									Member_Bean bean = new Member_Bean();
									bean.setId(id);
									bean.setPasswd(passwd);
									bean.setName(name);
									bean.setAge(age);
									bean.setGender(gender);
									bean.setEmail(email);
									bean.setAddress(address);
									bean.setTel(tel);
									bean.setMtel(mtel);
									if(!passwd.equals(passwd2)){
									PrintWriter sc = response.getWriter();
											sc.println("<script>");
											sc.println("alert('비밀번호가 일치하지 않습니다.')");
											sc.println("history.back()");
											sc.println("</script>");
									} else if(!email.equals(email2)){
										PrintWriter sc = response.getWriter();
											sc.println("<script>");
											sc.println("alert('이메일이 일치하지 않습니다.')");
											sc.println("history.back()");
											sc.println("</script>");
									} 
									Member_DAO mdao = new Member_DAO();
									int result = mdao.insertMember(bean);
									if(result == 1 ){
										PrintWriter sc = response.getWriter();
										sc.println("<script>");
										sc.println("alert('회원가입이 완료되셨습니다.')");
										sc.println("location.href='../index.jsp'");
										sc.println("</script>");
									} else if(result == 0){
										PrintWriter sc = response.getWriter();
										sc.println("<script>");
										sc.println("alert('회원가입에 실패하셨습니다.')");
										sc.println("history.back()");
										sc.println("</script>");
									}
									
								
					%>
			