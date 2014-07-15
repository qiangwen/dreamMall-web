package com.mall.web.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;

@Controller
@RequestMapping("/demo/")
public class DemoAction {
private HttpServletRequest request;
	
	private HttpServletResponse response;
	
	@ModelAttribute
	public void setRequestAndResponse(HttpServletRequest request,HttpServletResponse response){
		
		this.request = request;
		this.response = response;
	}
	@RequestMapping(value="model")
	public String say(Model model){
		model.addAttribute("wen", "qiang");
		return "demo";
		
	}
	
	@RequestMapping(value="jsonp",method=RequestMethod.GET)
	public void jsonp(){
		 try {  
		        response.setContentType("text/plain");  
		        response.setHeader("Pragma", "No-cache");  
		        response.setHeader("Cache-Control", "no-cache");  
		        response.setDateHeader("Expires", 0);  
		        PrintWriter out = response.getWriter();       
		        JSONObject resultJSON = new JSONObject();
		        resultJSON.put("name", "wen");
		        resultJSON.put("age", "17");
		        String jsonpCallback = request.getParameter("jsonpCallback");//客户端请求参数  
		        System.out.println("-------------------->"+jsonpCallback);
		        System.out.println("-------------------->"+resultJSON.toJSONString());
		        out.println(jsonpCallback+"("+resultJSON.toJSONString()+")");//返回jsonp格式数据  
		        out.flush();  
		        out.close();  
		      } catch (IOException e) {  
		       e.printStackTrace();  
		      }  
		
	}
	@RequestMapping("list")
	public ModelAndView list(){
		ModelAndView mv = new ModelAndView("list");
		mv.addObject("one","ddddddd").addObject("two", "rrrrrrrrrr");
		return mv;
	}
	
	@RequestMapping("modelmap")
	public String say2(ModelMap model){
		model.addAttribute("wen", "ddddvbgfff");
		return "demo";
		
	}
	
	@RequestMapping("modelmap2")
	public String say3(){
		return "redirect:modelmap.action";
		
	}
	
	@RequestMapping("modelmap3")
	public ModelAndView say4(){
		
		return new ModelAndView("redirect:list.action");
	}
}
