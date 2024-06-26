package Controllers;
import services.ProductServices;
import Models.Urun;
import jakarta.servlet.http.HttpServletResponse;
import Dao.Dao;

import java.io.IOException;
import java.net.http.HttpResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(path="/share")
public class ShareProductControlller {
	@RequestMapping(method=RequestMethod.GET)
	public void share(@RequestParam("pimage")String pimage,@RequestParam("pname")String pname,@RequestParam("pcategory")String pcategory,@RequestParam("pquantity")int pquantity,
	@RequestParam("pprice")double pprice,@RequestParam("id")String gmail ,@RequestParam("yetki")String yetki,HttpServletResponse resp) {
		Urun urun = new Urun(pname,pprice,pcategory,pquantity,pimage,gmail);
		ProductServices pserv;
		try {
			pserv = new ProductServices(Dao.getConnection());
			pserv.shareProduct(urun);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		try {
			if(yetki.equals("super")) {
				resp.sendRedirect("Information.jsp?id="+gmail);
				
			}else {
				resp.sendRedirect("Home.jsp");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
