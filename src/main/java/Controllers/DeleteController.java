package Controllers;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import Dao.Dao;
import Models.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.util.ArrayList;
import services.CartService;
import services.ClientService;
import services.OrderService;
import services.ProductServices;

@Controller
@RequestMapping(path="/delete")
public class DeleteController {
	
	@RequestMapping(method=RequestMethod.GET)
	public ResponseEntity<String> delete(@RequestParam("id")String id,@RequestParam("islem") String islem,@RequestParam("tarih")String tarih,@RequestParam("gmail")String gmail ,HttpServletRequest request,HttpServletResponse resp) {
		try {
			if(islem.equals("cart")) {
				Musteri mu = (Musteri)request.getSession().getAttribute("auth");
				CartService cartService = new CartService(Dao.getConnection());
				cartService.deleteCartProduct(Integer.parseInt(id),mu.getEmail());
				ArrayList<Cart> cartList = (ArrayList<Cart>) request.getSession().getAttribute("ses");
				for(int i=0;i<cartList.size();i++) {
					if(cartList.get(i).getUrunId()==Integer.parseInt(id)) {
						cartList.remove(i);	
					}
				}
				double Tfiyat = cartService.cartCost(cartList);
				return ResponseEntity.ok(Tfiyat+"");
			}else if(islem.equals("musteri")) {
				ClientService clientService = new ClientService(Dao.getConnection());
				ProductServices productService = new ProductServices(Dao.getConnection());
				clientService.removeClient(id);
				productService.DeleteEmailProduct(id);
			}else if(islem.equals("urun")) {
				ProductServices pservices= new ProductServices(Dao.getConnection());
				pservices.DeleteProduct(id);	
			}else if(islem.equals("cartS")) {
				CartService cservice = new CartService(Dao.getConnection());
				cservice.deleteCartProduct(Integer.parseInt(id),gmail);
				
			}else if(islem.equals("order")) {
				System.out.print(tarih);
				OrderService orderService = new OrderService(Dao.getConnection());
				orderService.deleteOrder(id, gmail,tarih);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ResponseEntity.ok("Product deleted successfully");
		
	}

}
