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
// read �������� ������ �ҷ��;� ��


// DB ���� �� �÷��� ������ Vector �� �ҷ����� ���� ��ü ����
  Vector name=new Vector();			// DB�� Name ���� �����ϴ� ����
  Vector email=new Vector();
  Vector inputdate=new Vector();
  Vector subject=new Vector();
  Vector cont=new Vector();

// ����¡ ó��
  int where=1;

  int totalgroup=0;					// ����� ����¡�� �׷����� �ִ� ����
  int maxpages=5;					// �ִ� ������ ���� ()
  int startpage=1;					// ������ �׷��� ���� ������
  int endpage=startpage+maxpages-1;	// ������ �׷��� ������ ������
  int wheregroup=1;					// ���� ��ġ�ϴ� �׷�
  
  if (request.getParameter("go") != null) {
	   where = Integer.parseInt(request.getParameter("go"));
	   wheregroup = (where-1)/maxpages + 1;
	   startpage=(wheregroup-1) * maxpages+1;  
	   endpage=startpage+maxpages-1; 
	   //gogroup ������ �Ѱܹ޾Ƽ� startpage, endpage, where �� �� ����
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
  int maxrows=5;			//����� ���ڵ� �� 
  int totalrows=0;
  int totalpages=0;

// DB ���� �� �÷��� ������ Vector �� �ҷ��ͼ� ����


// read �������� ������ �ҷ��;� ��








// ������ �׷���
 if (wheregroup > 1) {	// ���� ���� �׷��� 1 �ʰ��� ��
  out.println("[<A href=dbgb_show.jsp?gogroup=1>ó��</A>]"); 
  out.println("[<A href=dbgb_show.jsp?gogroup="+priorgroup +">����</A>]");
 } else {	// ���� ���� �׷��� 1 ������ ��
  out.println("[ó��]") ;
  out.println("[����]") ;
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
   out.println("[<A href=dbgb_show.jsp?gogroup="+ nextgroup+ ">����</A>]");
   out.println("[<A href=dbgb_show.jsp?gogroup="+ totalgroup + ">������</A>]");
  } else {
   out.println("[����]");
   out.println("[������]");
  }
  out.println ("��ü �ۼ� :"+totalrows); 

  %>




<TABLE border=0 width=600 cellpadding=0 cellspacing=0>
 <TR>
  <TD align=right valign=bottom width="117"><A href="dbgb_write.htm"><img src="image/write.gif" border="0"></TD>
 </TR>
</TABLE>

</body>
</html>