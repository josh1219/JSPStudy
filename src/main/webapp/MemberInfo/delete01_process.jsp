<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete 를 통한 데이터 삭제</title>
</head>
<body>

<%@ include file = "dbconn_oracle.jsp" %>

<%
	//form 에서 넘겨 Request 객체의 getParameter 로 변수의 값을 받는다.
	request.setCharacterEncoding("UTF-8"); // 폼에서 넘김 한글을 처리하기 위함
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	
	Statement stmt = null;
	ResultSet rs = null;
	String sql = null;
	
	try{
		//레코드 삭제 , 폼에서 넘긴 ID , Passwd와 DB의 ID와 Passwd가 일치할때 레코드 제거, id (Primary key)
		sql = "select id, pass from mbTbl where id = '"+id+"'";
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		
		if(rs.next()){	// ID가 존재할때
			// rs의 결과 레코드를 변수에 할당.
			String rId = rs.getString("id");
			String rPass = rs.getString("pass");
			
			// 패스워드가 일치하는지 확인
			if(passwd.equals(rPass)){	// 폼의 password와 DB의 Password가 일치할때
				sql = "delete mbTbl where id = '" + id + "'";
				stmt.executeUpdate(sql);
				
				out.println("테이블에서 해당 아이디 : "+id+" 가 삭제되었습니다.");
				// out.println(sql);
			}else{	// 폼의 password와 DB의 Password가 일치하지 않을때
				out.println("패스워드가 일치하지 않습니다.");
			}
			
		}else{	// ID가 존재하지 않을때
			out.println("해당 ID 가 존재하지 않습니다.");
		}
		
		out.println(sql);
	}catch(Exception ex){
		out.println(ex.getMessage());
		out.println(sql);
	}finally{
		if(rs != null)
			rs.close();
		if(stmt != null)
			stmt.close();
		if(conn != null)
			conn.close();
	}
%>	
	
</body>
</html>