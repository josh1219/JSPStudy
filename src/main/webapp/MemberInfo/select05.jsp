<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB의 내용을 가져와서 출력하기</title>
</head>
<body>
<!-- 
Statement :
	- 단일로 한번만 실행할 때 빠른 속도를 가진다.
	- 쿼리에 인자를 부여할 수 없다. 변수를 쿼리에 적용할때 따옴표 처리를 잘 해줘야 한다.
	- 매번 컴파일을 수행해야 된다. (cache 를 사용하지 않음)
PreparedStatement
	- 쿼리에 인자를 부여할 수 있다. /  ? 사용
	- 최초에만 컴파일 필요(처음 컴파일 된 이후, 그 이후에는 컴파일을 수행하지 않는다.) -- > (cache 를 사용한다)
	- 여러번 수행할 때 빠른 속도를 가진다.
 -->
 
<%@ include file = "dbconn_oracle.jsp" %>

<table width = "500" border = "1">

	<tr>
		<th> 아이디 </th>	
		<th> 비밀번호 </th>
		<th> 이름 </th>
		<th> email </th>
		<th> city </th>
		<th> phone </th>
	</tr>
	
	<%
		//ResultSet 객체는 DB 의 테이블을 Select 해서 나온 결과의 레코드셋을 담는 객체
		ResultSet rs = null;	
		Statement pstmt = null;	//SQL 쿼리를 담아서 실행하는 객체
		
		try{
			String sql = "select * from mbTbl";
			pstmt = conn.createStatement();	// connection 객체의 createStatement() 로 stmt 를 활성화
			rs = pstmt.executeQuery(sql);
				// stmt.excuteQuery()	: select 한 결과를 ResultSet 객체로 저장해야하
				// stmt.excuteUpdate()	: insert, update, delete
			while(rs.next()){
					String id = rs.getString("id");
					String pw = rs.getString("pass");
					String name = rs.getString("name");
					String email = rs.getString("email");
					String city = rs.getString("city");
					String phone = rs.getString("phone");
		%>		
	
					
		<tr>
			<td> <%= id %> </td>	
			<td> <%= pw %> </td>
			<td> <%= name %> </td>
			<td> <%= email %> </td>
			<td> <%= city %> </td>
			<td> <%= phone %> </td>
		</tr>
	<%				
			}		
		}catch(Exception e){
			out.println("테이블 호출에 실패했습니다.");
			out.println(e.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();	
			if (conn != null)
				conn.close();
		}
		
		 %>

</table>


</body>
</html>