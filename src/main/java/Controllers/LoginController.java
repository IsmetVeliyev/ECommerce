package Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import Dao.Dao;
import Models.Musteri;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import services.LgRgService;

@Controller
@RequestMapping(path="/login")
public class LoginController {
	
	@RequestMapping(method=RequestMethod.POST)
	public String LoginAccaunt(@RequestParam("gm")String gmail,@RequestParam("psw")String psw,HttpServletRequest request,HttpServletResponse response) throws Exception {
		LgRgService login = new LgRgService(Dao.getConnection());
		String rememberme = request.getParameter("remember-me");
		System.out.println(rememberme);
		Musteri mu =login.Login(gmail,psw);
		ModelAndView mv = new ModelAndView();
		if(mu.getEmail()==null)
			return "redirect:Login.jsp";
		HttpSession session = request.getSession();
		if(mu!=null) {
			if(mu.getEmail().equals("super@345")) {
				session.setAttribute("auth", mu);
				return "redirect:spHome.jsp";
			}
			session.setAttribute("auth", mu);
			if(rememberme!=null && rememberme.equals("on")) {
				Cookie ck = new Cookie("em",gmail);
				Cookie ck1 = new Cookie("ps",psw);
				response.addCookie(ck);
				response.addCookie(ck1);	
				
			}
			return "redirect:Home.jsp";
		}
		return "redirect:Login.jsp";
	}

}
