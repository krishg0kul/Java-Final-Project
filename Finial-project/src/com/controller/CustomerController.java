package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.model.Customer;
import com.model.Login;
import com.service.CustomerService;
import com.service.LoginService;

@Controller
@RequestMapping("/")
public class CustomerController {

	@Autowired
	@Qualifier("us1")
	private LoginService login;

	@Autowired
	@Qualifier("us2")
	private CustomerService customer;

	@PostMapping("welcome")
	public ModelAndView processLoginForm(Login logi, ModelAndView mandv, @ModelAttribute("formBeanObject") Login loginn,
			HttpServletRequest request) {
		System.out.println("login form check:" + logi.getName());
		HttpSession session = request.getSession();
		session.setAttribute("Username", logi.getName());
		Customer lb = new Customer();
		try {
			if (login.checkUser(logi.getName(), logi.getPassword())) {
				if (login.checkStatus(logi.getName())) {
					if (login.updateStatus(logi.getName(), 1)) {
						System.out.println("hai loggedin");
						mandv.addObject("CustomerBean", lb);
						mandv.setViewName("welcome");
						return mandv;
					}
				}

				else {
					System.out.println("No update status");
					mandv.addObject("CustomerBean", lb);
					mandv.setViewName("welcome");
					return mandv;

				}
			} else {
				System.out.println("register status");
				logi.setStatus(0);
				if (login.registerUser(logi)) {
					System.out.println("user registered");
					System.out.println("1 registered");
					mandv.addObject("CustomerBean", lb);
					mandv.setViewName("welcome");
					return mandv;
				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mandv;
	}

	@PostMapping("DisplayWelcome")
	public ModelAndView processcustomer(Customer customerobj, ModelAndView mandv, HttpServletRequest request,
			@ModelAttribute("CustomerBean") Customer c) {
		System.out.println(customerobj.getCustomerMobile() + ":" + customerobj.getCustomerName());
		HttpSession session = request.getSession();
		System.out.println("check2=" + session.getAttribute("Username"));
		String Name = customer.checkCustomer(customerobj);
		session.setAttribute("CustomerName", Name);
		session.setAttribute("CustomerMobile", customerobj.getCustomerMobile());
		c.setCustomerName(Name);
		System.out.println("customer : " + Name);
		mandv.setViewName("displayWelcome");
		return mandv;
	}

	public LoginService getLogin() {
		return login;
	}

	public void setLogin(LoginService login) {
		this.login = login;
	}

	public CustomerService getCustomer() {
		return customer;
	}

	public void setCustomer(CustomerService customer) {
		this.customer = customer;
	}

}
