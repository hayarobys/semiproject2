package bst.member.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bst.member.db.YZMemberDAO;

public class MemListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	// ctmz1.jsp 로 이동 전에 size, color, image 리스트 보내주기.
		
		ActionForward forward=new ActionForward();
/*		HttpSession session = request.getSession();
		String id =(String)session.getAttribute("id");
		
		if(id==null){			
			forward.setRedirect(true);
			forward.setPath("./로그인페이지로 보내자!.me");
			return forward;
		}*/
		
		try{
		
			YZMemberDAO memDAO = new YZMemberDAO();
			List list = new ArrayList();
			
			list = memDAO.memList();
			
			request.setAttribute("list", list);
			
			forward.setRedirect(false);
			forward.setPath("/myPage/mypage_admin_userlist.jsp");
			return forward;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
