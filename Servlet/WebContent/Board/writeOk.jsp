<%@page import="practice.BoardVO"%>
<%@page import="practice.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	BoardDAO dao = new BoardDAO();
	BoardVO vo = new BoardVO();
	vo.setTitle(request.getParameter("title"));
	vo.setWriter(request.getParameter("writer"));
	vo.setContents(request.getParameter("contents"));
	dao.insertOne(vo);
	response.sendRedirect("boardList.jsp");
%>