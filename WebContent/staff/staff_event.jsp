<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Companies List</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<link href="/company_management/WebContent/myStyle.css" rel="stylesheet" type="text/css" />
<body>
<div class="header_resize" style="display: flex; flex-direction: row; align-items: baseline;">
		<div class="logo">
			<h1>
				<a href="<c:url value='/staff/home_page_staff.jsp' />">Event Catering System</a>
			</h1>
		</div>
		<div style="margin-left: 20px">
			Welcome
			<c:out value='${LOGIN_USER.lastName}' />
			<c:out value='${LOGIN_USER.firstName}' />
		</div>
		<div style="margin-left: 20px" class="logout">
			<a href="<c:url value='/UserController?action=logout' />">Log Out</a>
		</div>
	</div>


	<form action="<c:url value='/EventController?listStaffEvent' />" method="get">
		<table >
			<tr>
				<td>date (*): <c:out value='${event.date}' /></td>
				<td><input type="date" id="datePicker" name="date" value="<c:out value='${event.date}' />" class="text16"></td>
				<td><c:out value='${errorMsgs.dateError}' /></td>
			</tr>

			<tr>
				<td>Start Time (*):</td>
				<td><input type="time" name="startTime" value="<c:out value='${event.startTime}'/>" class="text45"></td>
				<td><c:out value='${errorMsgs.startTimeError}' /></td>
			</tr>
		</table>
		<br>
		<input name="action" value="listStaffEvent" type="hidden"><input type="submit" value="Submit">
	</form>
	<br><br>
	<table border="1" class="myTable">
			<tr class="myTableRow">
				<th class="myTable20">Event Name</th>
				<th class="myTable20">Date</th>
				<th class="myTable35">Start Time</th>
				<th class="myTable20">Duration</th>
				<th class="myTable30">Hall Name</th>
				<th class="myTable30">Event Status</th>
				<th class="myTable30">Estimated Cost</th>
				<th class="myTable30">Action</th>
			</tr>

			<c:forEach items="${EVENTS}" var="item" varStatus="status">
				<tr class="myTableRow">
					<td class="myTable20 "><c:out value="${item.name}" /></td>
					<td class="myTable35 "><c:out value="${item.date}" /></td>
					<td class="myTable20 "><c:out value="${item.startTime}" /></td>
					<td class="myTable30 "><c:out value="${item.duration}" /></td>
					<td class="myTable20 "><c:out value="${item.hallName}" /></td>
					<td class="myTable20 "><c:out value="${item.eventStatus}" /></td>
					<td class="myTable30 "><c:out value="${item.estCost}" /></td>

					<td> <a href="<c:url value='/EventController?action=listSpecificStaffEvent&id=${item.id}' />">View</a></td>

				</tr>
			</c:forEach>
		</table>
		
</body>
</html>