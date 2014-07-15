package com.mall.web.action;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/cookie/")
public class CookieAction {

	
	private HttpServletRequest request;
	
	private HttpServletResponse response;
	
	@ModelAttribute
	public void setRequestAndResponse(HttpServletRequest request,HttpServletResponse response){
		
		this.request = request;
		this.response = response;
	}
	
	@RequestMapping("setCookie")
	public ModelAndView setCookieMV(){
		
		ModelAndView mv = new ModelAndView("cookie");
		
		setCookie();
		
		return mv;
	}
	
	@RequestMapping("getCookie")
	@ResponseBody
	public String getCookieMV(){
		
		String firstCookie = getCookie("firstcookie");
		
		String secondCookie = getCookie("secondcookie");
		
		return "firstcookie="+firstCookie+";secondcookie="+secondCookie;
	}
	private void setCookie(){
		
		Cookie cookie = new Cookie("firstcookie", "vncookie");
		
		cookie.setMaxAge(100);
		
		response.addCookie(cookie);
		
	}
	
	private String getCookie(String name){
		Cookie[] cookies = request.getCookies();
		for(Cookie cookie:cookies){
			
			System.out.println(cookie.getName()+"="+cookie.getValue());
		}
		for(Cookie cookie:cookies){
			if(cookie.getName().equals(name)){
				return cookie.getValue();
				
			}
		}
		return "not found";
	}
	
}
