package net.board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.board.db.BoardDAO;

public class BoardDeleteAction implements Action {
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");

		boolean result = false;
		boolean usercheck = false;
		int num = Integer.parseInt(request.getParameter("num"));

		BoardDAO boarddao = new BoardDAO();
		usercheck = boarddao.isBoardWriter(num, id);

		if (usercheck == false) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('삭제할 권한이 없습니다.');");
			out.println("location.href='./BoardList.bo';");
			out.println("</script>");
			out.close();
			return null;
		}

		result = boarddao.boardDelete(num);
		if (result == false) {
			return null;
		}

		forward.setRedirect(true);
		forward.setPath("./BoardList.bo");
		return forward;
	}
}