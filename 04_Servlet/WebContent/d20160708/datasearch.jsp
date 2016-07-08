<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="dao.MakeConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   String name = request.getParameter("name");
   Connection conn = null;
   PreparedStatement pstmt = null;
   ResultSet rs = null;
   
   if(name==null || name.equals("")){
      out.println("ERROR");
   }else{
      conn = MakeConnection.getInstance().getConnection();

      StringBuffer sb = new StringBuffer();

      
      sb.append("SELECT * FROM PHOTOSEARCH ");
      sb.append("WHERE name = ? ");
      pstmt = conn.prepareStatement(sb.toString());

      pstmt.setString(1, name);
      rs = pstmt.executeQuery();
      
      if(rs.next()){
          String path = rs.getString("imgpath");
          out.println(path);      
      }else{
    	  out.println("ERROR2");
      }
      
      if(rs!=null) rs.close();
      if(pstmt!=null) pstmt.close();
      //if(conn!=null) conn.close();
   }
%>