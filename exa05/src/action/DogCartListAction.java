package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import biz.CartBiz;
import vo.ActionForward;
import vo.Cart;

public class DogCartListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		CartBiz cartBiz = new CartBiz();
		ArrayList<Cart> cartList = cartBiz.getCartList(request);
		int totalMoney = 0;
		for (int i = 0; i < cartList.size(); i++) {
			int money = cartList.get(i).getPrice() * cartList.get(i).getQty();
			totalMoney += money;
		}
		request.setAttribute("totalMoney", totalMoney);
		request.setAttribute("cartList", cartList);
		ActionForward forward = new ActionForward();
		forward.setUrl("dogCartList.jsp");
		
		return forward;
	}
}