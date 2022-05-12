<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("EUC-KR"); %>
<%@ include file = "dbconn_oracle.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link href = "filegb.css" rel = "systlesheet" type = "text/css">
<title>�� ���� - DB ���� ����</title>
</head>
<body>
[ <a href = "freeboard_list.jsp?page=<%= request.getParameter("page")%>"> �Խ��� ������� �̵� </a>]
<p><p>
<%
	String sql = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int cnt = 0;		//Delete �� �Ǿ����� Ȯ���ϴ� ����
	
	int id = Integer.parseInt(request.getParameter("id"));
	
	try{
		//DB �� ��й�ȣ�� form ���� ���� ��й�ȣ ��
		sql = "select * from freeboard where id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, id);
		rs = pstmt.executeQuery();
		
		if(!(rs.next())){
			out.println("�ش� ������ �������� �ʽ��ϴ�.");
		}else{
			// Password Ȯ�� �� ��ġ�ϸ� ����
			String pwd = rs.getString("password");
			if(pwd.equals(request.getParameter("password"))){
				sql = "delete freeboard where id = ? ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, id);
				cnt = pstmt.executeUpdate();
				
				if(cnt>0){
					out.println("���� �Ǿ����ϴ�.");
				}else{
					out.println("�������� �ʾҽ��ϴ�.");
				}
			}else{
				out.println("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
			}
		}
		
	}catch(Exception ex){
		out.println(ex.getMessage());
	}finally{
		if(rs != null)
			rs.close();
		if(pstmt != null)
			pstmt.close();
		if(conn != null)
			conn.close();
	}
	
%>

</body>
</html>