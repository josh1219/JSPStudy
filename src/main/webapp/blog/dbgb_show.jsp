<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*,java.util.*" %> 
<html>
<head>
<title>Guest Board</title>
<link href = "freeboard.css" rel="stylesheet" type="texy/css">
<Script language = "javascript"></Script>
</head>
<body>
<%@ include file = "dbconn_oracle.jsp" %>
<%
// read 형식으로 값들을 불러와야 함


// DB 에서 각 컬럼의 값들을 Vector 로 불러오기 전에 객체 생성
  Vector name=new Vector();			// DB의 Name 값만 저장하는 벡터
  Vector email=new Vector();
  Vector inputdate=new Vector();
  Vector subject=new Vector();
  Vector cont=new Vector();

// 페이징 처리
  int where=1;

  int totalgroup=0;					// 출력할 페이징의 그룹핑의 최대 갯수
  int maxpages=5;					// 최대 페이지 갯수 ()
  int startpage=1;					// 페이지 그룹의 시작 페이지
  int endpage=startpage+maxpages-1;	// 페이지 그룹의 마지막 페이지
  int wheregroup=1;					// 현재 위치하는 그룹
  
  if (request.getParameter("go") != null) {
	   where = Integer.parseInt(request.getParameter("go"));
	   wheregroup = (where-1)/maxpages + 1;
	   startpage=(wheregroup-1) * maxpages+1;  
	   endpage=startpage+maxpages-1; 
	   //gogroup 변수를 넘겨받아서 startpage, endpage, where 의 값 구함
	  } else if (request.getParameter("gogroup") != null) {
	   wheregroup = Integer.parseInt(request.getParameter("gogroup"));
	   startpage=(wheregroup-1) * maxpages+1;  
	   where = startpage ; 
	   endpage=startpage+maxpages-1; 
	  }
  
  int nextgroup=wheregroup+1;
  int priorgroup= wheregroup-1;

  int nextpage=where+1;
  int priorpage = where-1;
  int startrow=0;
  int endrow=0;
  int maxrows=5;			//출력할 레코드 수 
  int totalrows=0;
  int totalpages=0;

// DB 에서 각 컬럼의 값들을 Vector 에 불러와서 저장


// read 형식으로 값들을 불러와야 함








// 페이지 그룹핑
 if (wheregroup > 1) {	// 현재 나의 그룹이 1 초과일 때
  out.println("[<A href=dbgb_show.jsp?gogroup=1>처음</A>]"); 
  out.println("[<A href=dbgb_show.jsp?gogroup="+priorgroup +">이전</A>]");
 } else {	// 현재 나의 그룹이 1 이하일 때
  out.println("[처음]") ;
  out.println("[이전]") ;
 }
 if (name.size() !=0) { 
  for(int jj=startpage; jj<=endpage; jj++) {
   if (jj==where) 
    out.println("["+jj+"]") ;
   else
    out.println("[<A href=dbgb_show.jsp?go="+jj+">" + jj + "</A>]") ;
   } 
  }
  if (wheregroup < totalgroup) {
   out.println("[<A href=dbgb_show.jsp?gogroup="+ nextgroup+ ">다음</A>]");
   out.println("[<A href=dbgb_show.jsp?gogroup="+ totalgroup + ">마지막</A>]");
  } else {
   out.println("[다음]");
   out.println("[마지막]");
  }
  out.println ("전체 글수 :"+totalrows); 

  %>




<TABLE border=0 width=600 cellpadding=0 cellspacing=0>
 <TR>
  <TD align=right valign=bottom width="117"><A href="dbgb_write.htm"><img src="image/write.gif" border="0"></TD>
 </TR>
</TABLE>

</body>
</html>