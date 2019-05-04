<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.shachar.first.*"%>
<%@ page import="static com.shachar.first.Utils.*"%>

<%
	UserDatabase userDatabase = new UserDatabase();
	User user = userDatabase.getUserByEmail((String)request.getSession().getAttribute("currentUserEmail"));
	user.setLastSeenNow();
	userDatabase.updateField("last_seen", "email", user.getEmail(), formatDatabaseDate(user.getLastSeen()));
	request.getSession().removeAttribute("currentUserEmail");
	request.getSession().setAttribute("validUser", "disconnected");
	response.sendRedirect("forumBase.jsp");
%>