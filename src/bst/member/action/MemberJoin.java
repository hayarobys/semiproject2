package bst.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bst.member.db.YZMemberDAO;
import bst.member.db.YZMemberDTO;



public class MemberJoin implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
		YZMemberDAO memberdao = new YZMemberDAO();
		YZMemberDTO dto = new YZMemberDTO();
		ActionForward forward = null;

		dto.setMEM_ID(request.getParameter("MEMBER_ID"));
		dto.setMEM_PASSWORD(request.getParameter("MEMBER_PW"));
		dto.setMEM_NAME(request.getParameter("MEMBER_NAME"));

		dto.setMEM_EMAIL(request.getParameter("MEMBER_EMAIL"));
		dto.setMEM_HOME(request.getParameter("MEMBER_ADDR1")+request.getParameter("MEMBER_ADDR2"));
		dto.setMEM_PHONE(request.getParameter("MEMBER_PHONE1")+request.getParameter("MEMBER_PHONE2")+request.getParameter("MEMBER_PHONE3"));
		dto.setMEM_GRADE(0);
		dto.setDate(new java.sql.Date(new java.util.Date().getTime()));

		memberdao.insertMember(dto);

		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();

		out.println("<script>");
		out.println("alert('회원가입에 성공하였습니다.');");
		out.println("location.href='./register_done.jsp';");
		out.println("</script>");
		out.close();

		return forward;
	}
}
