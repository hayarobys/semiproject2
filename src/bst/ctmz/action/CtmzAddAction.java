package bst.ctmz.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import bst.ctmz.db.CtmzDAO;
import bst.ctmz.db.CtmzDTO;

public class CtmzAddAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		CtmzDAO ctmzDAO=new CtmzDAO();
	   	CtmzDTO ctmzDTO=new CtmzDTO();
	   	ActionForward forward=new ActionForward();
		
	   	String realFolder="";
   		String saveFolder="/image";
   		
   		int fileSize=5*1024*1024;
   		
   		realFolder = request.getSession().getServletContext().getRealPath(saveFolder);
   		System.out.println(realFolder);
		
   		boolean result=false;
   		
   		try{
   			
   			MultipartRequest multi=null;
   			
   			multi=new MultipartRequest(request,
   					realFolder,
   					fileSize,
   					"utf-8",
   					new DefaultFileRenamePolicy());
   			
   			ctmzDTO.setCTMZ_NO(Integer.parseInt(multi.getParameter("CTMZ_NO")));
   			ctmzDTO.setCTMZ_MODEL(multi.getParameter("CTMZ_MODEL"));
	   		ctmzDTO.setCTMZ_COLOR(multi.getParameter("CTMZ_COLOR"));
	   		ctmzDTO.setCTMZ_PRICE(Integer.parseInt(multi.getParameter("CTMZ_PRICE")));
	   		ctmzDTO.setCTMZ_IMAGE1(
	   				multi.getFilesystemName((String)multi.getFileNames().nextElement()));
	   		ctmzDTO.setCTMZ_IMAGE2(
	   				multi.getFilesystemName((String)multi.getFileNames().nextElement()));
	   		
	   		result=ctmzDAO.addCtmz(ctmzDTO);
	   		
	   		if(result==false){
	   			System.out.println("상품 추가 실패");
	   			return null;
	   		}
	   		System.out.println("상품 추가 완료");
	   		
	   		forward.setRedirect(true);
	   		forward.setPath("./kanye/main.html");
	   		return forward;
	   		
  		}catch(Exception ex){
   			ex.printStackTrace();
   		}
  		return null;
	}
	
}
