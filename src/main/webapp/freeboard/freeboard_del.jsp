<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�� ���� </title>
</head>
<body>
	
	<center>
		<form name = "msgdel" method = post action = "freeboard_deldb.jsp">
			<!--  HTML �������� ����� ���� ������ ������ ���� �ٸ� �������� �ѱ涧
					id ������ page ������ ���� ó�� -->
			<input type="hidden" name ="id" value = "<%= request.getParameter("id") %>">
			<input type="hidden" name ="page" values = "<%= request.getParameter("page") %>">
			
			<table width = "70%" cellspacing "0" cellpadding="2">
				<tr> <td colspan = "2"  bgcolor = "#1f4f8f" height"1"> </td>
				</tr>
				<tr><td clospan = "2" bgcolor = "#DFEDFF" height="20" class = "notice">
					<b>�� ���� �ϱ�</b></td>
				</tr>
				<tr>
					<td clospan = "2" bgcolor = "#1F4F8F" height="1"></td>
				</tr>
				<tr>
					<td width = "124" height = "30" bgcolor = "#f4f4f4" align = "center" class = "input_style1">
						��� ��ȣ</td>
					<td width = "494"> <input type="password" name = password class = "input_style1">
					
					</td>
				</tr>
				<tr> <td colspan = "2" height = "1" class = "button"> </td>
				</tr>
				<tr> <td colspan = "2" height = "1" bgcolor = "#1F4F8F"> </td>
				</tr>
				<tr> <td colspan ="2" height = "10">
				</td>
				
								
				
				
			</table>
		
		
		</form>
	
	</center>
</body>
</html>