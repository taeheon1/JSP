package biz;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import vo.Cart;
import vo.Dog;

public class CartBiz {

	public void addCart(HttpServletRequest request, Dog dog) {
		HttpSession session = request.getSession();
		ArrayList<Cart> cartList = (ArrayList<Cart>) session.getAttribute("cartList");
		if (cartList == null) {
			cartList = new ArrayList<Cart>();
		}
		Cart cart = null;
		boolean newCart = true;
		for (int i = 0; i < cartList.size(); i++) {
			cart = cartList.get(i);
			if (dog.getKind().equals(cart.getKind())) {
				newCart = false;
				cart.setQty(cart.getQty() + 1);
				// 지금 찾아진 카트 객체(cart) 상품이 있으면 수량만 증가
			}
		}
		if (newCart) {
			cart = new Cart();
			cart.setImage(dog.getImage());
			cart.setKind(dog.getKind());
			cart.setPrice(dog.getPrice());
			cart.setQty(1);
			cartList.add(cart);
		}
		session.setAttribute("cartList", cartList);
	}

	public ArrayList<Cart> getCartList(HttpServletRequest request) {
		HttpSession session = request.getSession();
		ArrayList<Cart> cartList = (ArrayList<Cart>) session.getAttribute("cartList");

		return cartList;
	}

	public void removeCartItem(HttpServletRequest request, String[] kinds) {
		HttpSession session = request.getSession();
		ArrayList<Cart> cartList = (ArrayList<Cart>) session.getAttribute("cartList");
		for (int i = 0; i < kinds.length; i++) {
			for (int j = 0; j < cartList.size(); j++) {
				if (kinds[i].equals(cartList.get(j).getKind())) {
					cartList.remove(cartList.get(j));
				}
			}
		}
	}
}