package action;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import biz.DogBiz;
import vo.ActionForward;
import vo.Dog;

public class DogViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		DogBiz dogBiz = new DogBiz();
		boolean result = dogBiz.updateReadcount(id);
		Dog dog = dogBiz.getDog(id);
		Cookie cookie = new Cookie("image" + id, dog.getImage());
		cookie.setMaxAge(60 * 60 * 24); // 24시간 -> 1일
		response.addCookie(cookie);
		request.setAttribute("dog", dog);
		ActionForward forward = new ActionForward();
		forward.setUrl("dogView.jsp");
		
		return forward;
	}
}