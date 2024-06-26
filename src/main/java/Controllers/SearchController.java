package Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
@Controller
@RequestMapping(path="/search")
public class SearchController {
	@RequestMapping(method=RequestMethod.POST)
	
	public String search(@RequestParam("search")String gmail,@RequestParam("islem") String islem) {
		System.out.println(islem);
		if(islem.equals("user")) {
			return "redirect:Home.jsp?company="+gmail;
		}
		return "redirect:Information.jsp?id="+gmail;
		
	}
	

}
