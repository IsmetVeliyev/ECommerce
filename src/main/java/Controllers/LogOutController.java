package Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@Controller
@RequestMapping(path="/log-out")
public class LogOutController {
	@RequestMapping(method=RequestMethod.GET)
	public String Logout(HttpServletRequest request ,HttpServletResponse response) {
		if(request.getSession().getAttribute("auth")!=null) {
			request.getSession().removeAttribute("auth");
			Cookie[] ck = request.getCookies();
			if(ck!=null) {
				for(int i=0;i<ck.length;i++) {
					ck[i].setMaxAge(0);
					response.addCookie(ck[i]);
				}
			}
			return "redirect:Home.jsp";
		}
		
		return "redirect:Home.jsp";
		
	}
}
