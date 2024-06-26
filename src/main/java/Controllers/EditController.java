package Controllers;

import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import Dao.Dao;
import Models.Musteri;
import Models.Urun;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.ProductServices;

@Controller
@RequestMapping(path="/edit")
public class EditController {
	@RequestMapping(method=RequestMethod.GET)
	public String share(@RequestParam("pimage")String pimage,@RequestParam("pname")String pname,@RequestParam("pcategory")String pcategory,@RequestParam("pquantity")int pquantity,
	@RequestParam("pprice")double pprice,@RequestParam("id")String gmail ,@RequestParam("urunID")int urunid,HttpServletRequest request) {
		Urun urun = new Urun(pname,pprice,pcategory,pquantity,pimage,gmail);
		urun.setUrunId(urunid);
		ProductServices pserv;
		try {
			Musteri mu = (Musteri) request.getSession().getAttribute("auth");
			pserv = new ProductServices(Dao.getConnection());
			pserv.UpdateProduct(urun);
			System.out.println(mu.getEmail());
			if(mu.getEmail().equals("super@345")) {
				return "redirect:Information.jsp?id="+gmail;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:Home.jsp";
	}
}
