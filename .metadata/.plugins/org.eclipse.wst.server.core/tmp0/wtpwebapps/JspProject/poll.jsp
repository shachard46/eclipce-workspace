<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="dbMembers.jsp"%>
<%
	List<PollQuestion> pollQuestions = pollQuestionDatabase.getAllEntities();
%>
<!DOCTYPE html>
<html dir="rtl">
<head>
<link rel="stylesheet" type="text/css" href="style.css" />

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="header.jsp"%>
	<form action="dbPollAnswers.jsp" method="get">

		<table class="container poll_container">
			<%
				for (PollQuestion pollQuestion : pollQuestions) {
					String name = pollQuestion.getName();
					String id = pollQuestion.getId() + "";
			%>
			<tr>
				<%
					if (request.getSession().getAttribute("poll_results").equals("false")) {
				%>
				<td><label><%=name%></label> <span class="answer"><input
						type="radio" name="<%=id%>" value="<%=pollQuestion.getAns1()%>"><span
						class="answer_text"> <%=pollQuestion.getAns1()%></span></span> <span
					class="answer"><input type="radio" name="<%=id%>"
						value="<%=pollQuestion.getAns2()%>"><span
						class="answer_text"> <%=pollQuestion.getAns2()%></span></span> <span
					class="answer"><input type="radio" name="<%=id%>"
						value="<%=pollQuestion.getAns3()%>"><span
						class="answer_text"> <%=pollQuestion.getAns3()%></span></span> <span
					class="answer"><input type="radio" name="<%=id%>"
						value="<%=pollQuestion.getAns4()%>"><span
						class="answer_text"> <%=pollQuestion.getAns4()%></span></span></td>
				<%
					} else {
				%>
				<td><label><%=name%></label>
					<div class="answer"><%=pollQuestion.getAns1()%>
						<hr class="answer_mess"
							width=<%=(pollAnswerDatabase.pollAnswerCount(pollQuestion.getAns1()) * 20)%>>
					</div>

					<div class="answer">
						<%=pollQuestion.getAns2()%>
						<hr class="answer_mess"
							width=<%=(pollAnswerDatabase.pollAnswerCount(pollQuestion.getAns2()) * 20)%>>
					</div>

					<div class="answer"><%=pollQuestion.getAns3()%>
						<hr class="answer_mess"
							width=<%=(pollAnswerDatabase.pollAnswerCount(pollQuestion.getAns3()) * 20)%>>
					</div>

					<div class="answer"><%=pollQuestion.getAns4()%>
						<hr class="answer_mess"
							width=<%=(pollAnswerDatabase.pollAnswerCount(pollQuestion.getAns4()) * 20)%>>
					</div></td>
				<%
					}
				%>
			</tr>
			<%
				}
			%>
			<tr>
				<td><input type="submit" value="שלח" class="post_button">
				</td>
			</tr>
		</table>

	</form>


</body>
</html>