package net.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.db.BoardBean;
import net.board.db.BoardDAO;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardAddAction implements Action {
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		BoardDAO boarddao = new BoardDAO();
		BoardBean boarddata = new BoardBean();
		ActionForward forward = new ActionForward();

		String realFolder = "";
		String saveFolder = "/boardupload";

		int fileSize = 5 * 1024 * 1024;

		realFolder = request.getRealPath(saveFolder);

		boolean result = false;

		try {
			MultipartRequest multi = null;

			multi = new MultipartRequest(request, realFolder, fileSize,
					"UTF-8", new DefaultFileRenamePolicy());

			boarddata.setBOARD_ID(multi.getParameter("BOARD_ID"));
			boarddata.setBOARD_SUBJECT(multi.getParameter("BOARD_SUBJECT"));
			boarddata.setBOARD_CONTENT(multi.getParameter("BOARD_CONTENT"));
			boarddata.setBOARD_FILE(multi.getFilesystemName((String) multi
					.getFileNames().nextElement()));

			result = boarddao.boardInsert(boarddata);

			if (result == false) {
				return null;
			}

			forward.setRedirect(true);
			forward.setPath("./BoardList.bo");
			return forward;

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;
	}
}