package Controllers;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import Models.Musteri;
import services.ClientService;
import Dao.Dao;
@Controller
@RequestMapping(path="/uptuser")
public class UptUserController {
	@RequestMapping(method=RequestMethod.POST)
	public ResponseEntity<String> update(@RequestParam("ad")String ad,@RequestParam("soyad")String soyad,@RequestParam("email")String gmail,@RequestParam("sifre")String sifre) {
		Musteri m = new Musteri();
		String rsp=null;
		System.out.println("1");
		m.setAd(ad);
		m.setSoyad(soyad);
		m.setEmail(gmail);
		m.setSifre(sifre);
		try {
			ClientService cservice = new ClientService(Dao.getConnection());
		    rsp =cservice.uptUser(m);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		if(rsp.equals("+")) {
			return ResponseEntity.ok(rsp);
			
		}
		System.out.println("2");
		return ResponseEntity.ok("-");
	}

}
