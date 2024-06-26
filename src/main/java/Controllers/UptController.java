package Controllers;

import java.util.ArrayList;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import Dao.Dao;
import jakarta.servlet.http.HttpServletRequest;
import services.CartService;
import services.OrderService;
import Models.*;
@Controller
@RequestMapping(path="/upt")
public class UptController {
	@RequestMapping(method=RequestMethod.GET)
	public ResponseEntity<String> delete(@RequestParam("id")String id,@RequestParam("say")String say,@RequestParam("islem")String islem,@RequestParam("tarih")String tarih,
			@RequestParam("gmail")String gmail,
			HttpServletRequest request){
		System.out.println("1");
		if(islem.equals("cart")) {
			CartService cserv=null;
			ArrayList<Cart> cList = (ArrayList)request.getSession().getAttribute("ses");
			try {
				cserv = new CartService(Dao.getConnection());
				cserv.uptQuantity(Integer.parseInt(id), Integer.parseInt(say),gmail);
				
				for(int i=0;i<cList.size();i++) {
					if(cList.get(i).getUrunId()==Integer.parseInt(id)) {
						cList.get(i).setSayi(Integer.parseInt(say));
						
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			double Tfiyat = cserv.cartCost(cList);
			return ResponseEntity.ok(Tfiyat+"");
		}else if(islem.equals("order")) {
			System.out.println("2");
			OrderService oserv=null;
			try {
				oserv = new OrderService(Dao.getConnection());
				oserv.UptOrder(Integer.parseInt(id),Integer.parseInt(say),tarih,gmail);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return null;
		
	}
	

}
