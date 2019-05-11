<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ page import="com.shachar.first.*"%> <%@ page
import="static com.shachar.first.Utils.*"%> <%@include file="dbMembers.jsp"%>
<%
	List<QuizQuestion> quizQuestions = quizQuestionDatabase.getAllEntities();
%>
<html dir="rtl">
  <head>
    <title>FirstForum</title>
    <link rel="stylesheet" type="text/css" href="style.css" />
    <script type="text/javascript" src="functions.js"></script>
  </head>

  <body>
    <%@include file="header.jsp"%>
    <form
      action="quiz.jsp"
      method="post"
      accept-charset="UTF-8"
      name="quiz"
      onsubmit="return checkQuiz()"
    >
      <table class="container poll_container">
       <%	
       	for(QuizQuestion question : quizQuestions){ 
       		int id = question.getId();
       		String name = question.getName();
       		List<String> answers = question.getAllAnswers();
 	   %>
        <tr>
          <td>
          <label><%=name %></label>
       <%	
        int h = 1;
       	for(String answer : answers){
       %>	
            <span class="answer" id="q_<%=id %>_<%=h%>">
              <input type="radio" name="q_<%=id %>" value="<%=h %>" />
              <span class="answer_text"> <%=answer%> </span>
            </span>
      <%
			h++;          	
         }
     %>
          </td>
        </tr>
      <%
       	}
      %>
        <tr>
          <td><input type="submit" value="שלח" class="post_button" /></td>
        </tr>
      </table>
    </form>
  </body>
</html>
