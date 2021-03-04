package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.model.Customer;
import com.model.Login;
import com.service.LoginService;

@Controller
public class EntranceExitController {

	@Autowired
	@Qualifier("us1")
	private LoginService login;

	@GetMapping("/user/{process}")
	@ResponseBody
	public ModelAndView loadLoginForm(ModelAndView mandv, @PathVariable String process) {
		Login lfb = new Login();
		mandv.addObject("formBeanObject", lfb);
		mandv.addObject("process", process);
		mandv.setViewName("login");
		return mandv;
	}

	@PostMapping("/processlogout")
	public ModelAndView processlogout(Customer customerobj, ModelAndView mandv, HttpServletRequest request) {
		HttpSession session = request.getSession();
		login.updateStatus(session.getAttribute("Username").toString(), 0);
		mandv.setViewName("index");
		return mandv;
	}

	public LoginService getLogin() {
		return login;
	}

	public void setLogin(LoginService login) {
		this.login = login;
	}
}
