package action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import biz.CartBiz;
import biz.DogBiz;
import vo.ActionForward;
import vo.Dog;

public class DogListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		CartBiz cartBiz = new CartBiz();
		ArrayList<String> images = new ArrayList<String>();
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				if (cookies[i].getName().startsWith("image")) {
					images.add(cookies[i].getValue());
				}
			}
		}
		request.setAttribute("images", images);
		DogBiz dogBiz = new DogBiz();
		List<Dog> dogs = dogBiz.getDogs();
		request.setAttribute("dogs", dogs);
		ActionForward forward = new ActionForward();
		forward.setUrl("dogList.jsp");

		return forward;
	}
}