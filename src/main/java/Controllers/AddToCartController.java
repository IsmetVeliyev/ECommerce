package Controllers;

import java.io.IOException;
import java.util.ArrayList;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import Models.Cart;
import Dao.Dao;
import Models.Musteri;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import services.CartService;
@Controller
@RequestMapping(path="/add")
public class AddToCartController {
	@RequestMapping(method=RequestMethod.GET)
	public ResponseEntity<String> addToCart(@RequestParam("id")int id ,HttpServletRequest request,HttpServletResponse response) {
		Musteri mu = (Musteri)request.getSession().getAttribute("auth");
		ArrayList<Cart> cList = (ArrayList)request.getSession().getAttribute("ses");
		Cart cart = new Cart();
		cart.setUrunId(id);
		cart.setSayi(1);
		cart.setEmail(mu.getEmail());
		CartService cservice=null;
		boolean a=true;
		for(int i=0;i<cList.size();i++) {
			if(cList.get(i).getUrunId()==id) {
				cList.get(i).setSayi(cList.get(i).getSayi()+1);
				a=false;
			}
		}
		if(a)
		cList.add(cart);
		try {
		    cservice = new CartService(Dao.getConnection());
			cservice.addToCart(cart);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		int say =cservice.getCount(cList);
		return ResponseEntity.ok(say+"");
	}

}
