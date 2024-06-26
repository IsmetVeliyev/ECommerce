package Controllers;
import org.springframework.stereotype.Controller;
import Dao.Dao;
import Models.Musteri;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import services.LgRgService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
@Controller
@RequestMapping(path="/register")
public class RegisterController {
	
	@RequestMapping(method=RequestMethod.POST)
	public String  CreateAccount(@RequestParam("fn")String fname,@RequestParam("ln")String lname,@RequestParam("gm") String gmail,
			@RequestParam("psd")String psd ,@RequestParam("cpsd")String cpsd, HttpServletRequest request,HttpServletResponse response
			) throws Exception {
		
		if(!psd.equals(cpsd)) {
			System.out.println("Sorun");
			return "redirect:Register.jsp";
		}
		Musteri mu = (Musteri) request.getSession().getAttribute("auth");
		LgRgService register = new LgRgService(Dao.getConnection());
		boolean sgnl =register.Register(new Musteri(fname,lname,gmail,psd));
		System.out.println(sgnl);
		if(!sgnl) {
			try {
				if(mu.getEmail().equals("super@345") && mu!=null)
					return "redirect:spHome.jsp";
			}catch(Exception e) {
				return "redirect:Register.jsp";
			}
		}
		
		if(mu!=null && mu.getEmail().equals("super@345")){
			return "redirect:spHome.jsp";
			
		}

		String rememberme = request.getParameter("remember-me");
		Musteri m=register.Login(gmail, psd);
		HttpSession session = request.getSession();
		if(rememberme!=null && rememberme.equals("on")) {
			session.setAttribute("auth", m);
			Cookie ck = new Cookie("em",gmail);
			Cookie ck1 = new Cookie("ps",psd);
			response.addCookie(ck);
			response.addCookie(ck1);		
		}
		return "redirect:Login.jsp";
	}
	

}
