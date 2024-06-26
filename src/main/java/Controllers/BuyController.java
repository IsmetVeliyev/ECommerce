package Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import Models.*;
import java.util.*;
import jakarta.servlet.http.HttpServletRequest;
import Dao.Dao;
import services.*;

@Controller
@RequestMapping(path="/pay")
public class BuyController {
	@RequestMapping(method=RequestMethod.POST)
	public String buy(@RequestParam("payment")String yontem ,@RequestParam("id")String id,HttpServletRequest request) {
		try {
			Musteri mu = (Musteri)request.getSession().getAttribute("auth");
			OrderService os = new OrderService(Dao.getConnection());
			System.out.println(id);
			boolean auth =mu.getEmail().equals("super@345");
			String prm[]=null;
			if(!id.equals("cart")) {
				Order order = new Order();
				if(auth) {
					System.out.println(2);
				    prm = id.split(" ");
					order.setUrunId(Integer.parseInt(prm[0]));
					order.setEmail(prm[1]);
				}else {
					order.setUrunId(Integer.parseInt(id));
					order.setEmail(mu.getEmail());
				}
				order.setSayi(1);
				Date date = new Date();
				String d = date.toString();
				order.setTarih(d);
				order.setYontem(yontem);
				os.setOrders(order);
				if(auth)
					return "redirect:Information.jsp?id="+prm[1];
				
				return "redirect:Orders.jsp";
			}
			ArrayList<Cart> cartList = (ArrayList<Cart>) request.getSession().getAttribute("ses");
			for(Cart cart:cartList) {
				Order order = new Order();
				order.setUrunId(cart.getUrunId());
				order.setEmail(mu.getEmail());
				order.setFiyat(cart.getFiyat());
				order.setSayi(cart.getSayi());
				Date date = new Date();
				String d=date.toString();
				order.setTarih(d);
				order.setYontem(yontem);
				os.setOrders(order);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:Home.jsp";
		
	}

}
