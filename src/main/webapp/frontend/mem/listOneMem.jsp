<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.mem.model.*"%>
<%-- �����Ƚm�߱ĥ� Script ���g�k���� --%>

<%
  MemVO memVO = (MemVO) request.getAttribute("memVO"); //EmpServlet.java(Concroller), �s�Jreq��empVO����
%>

<html>
<head>
<title>���u��� - listOneMem.jsp</title>

<style>
  table#table-1 {
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
</style>

<style>
  table {
	width: 600px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
</style>

</head>
<body bgcolor='white'>

<h4>�����Ƚm�߱ĥ� Script ���g�k����:</h4>
<table id="table-1">
	<tr><td>
		 <h3>���u��� - ListOneMem.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>���u�s��</th>
		<th>���u�m�W</th>
		<th>¾��</th>
		<th>���Τ��</th>
		<th>�~��</th>
		<th>����</th>
		<th>����</th>
	</tr>
	<tr>
		<td>${memVO.mem_no}</td>
				<td>${memVO.mem_acc}</td>
				<td>${memVO.mem_pwd}</td>
				<td>${memVO.acc_status}</td>
				<td>${memVO.mem_name}</td>
				<td>${memVO.mem_email}</td>
				<td>${memVO.mem_mobile}</td>
				<td>${memVO.mem_city}</td>
				<td>${memVO.mem_dist}</td>
				<td>${memVO.mem_addr}</td>
				<td>${memVO.mem_reg_date}</td>
				<td>${memVO.mem_pic}</td>
				<td>${memVO.mem_report_count}</td>
				<td>${memVO.mem_card}</td>
	</tr>
</table>

</body>
</html>