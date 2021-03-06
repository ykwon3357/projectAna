package com.ana.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.ana.domain.UserVO;
import com.ana.service.EmailService;
import com.ana.service.UserHistoryService;
import com.ana.service.UserService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/register/*")
@AllArgsConstructor
@SessionAttributes("user")
public class RegisterController {

	@Autowired
	private UserService service;
	
	// 회원가입 페이지 보여주기
	@GetMapping("/signUp")
	public String showPage() {
		return "/register/signUp";
	}

	//checkEmail을 get방법으로 하면 에러 페이지를 보여주자
	@GetMapping("/checkEmail")
	public String getCheckEmail() {
		return "/error/404error";
	}
	
	// 이메일 중복 검사 (ajax로 값을 받아온다)
	@RequestMapping(value="/checkEmail", method=RequestMethod.POST)
	@ResponseBody
	public void checkEmail(UserVO user, String email,HttpServletRequest request, HttpServletResponse response)
throws IOException{
		JSONObject jso= new JSONObject();
		log.info("email check: " + email);
		log.info("user VO: "+ user);
		//한글 깨짐 방지
		response.setContentType("text/plain;charset=UTF-8");
		String msg="";
		String assureMsg="";
		//service에게 email을 주고 db를 뒤져오게한다
		if (service.canRegister(email)) {
			log.info("checkEmail에서 service 성공");
			msg="해당 이메일을 사용하실 수 있습니다";
			assureMsg="pass";
			jso.put("msg", msg);
			jso.put("assuredEmail", email);
			jso.put("assureMsg", assureMsg);
		} 
		else {
			log.info("checkEmail에서 service를 불렀더니 이미 db에 있는 이메일임!");
			msg="이미 등록된 이메일입니다!";
			assureMsg="fail";
			jso.put("msg", msg);
			jso.put("assureMsg", assureMsg);
		}
		PrintWriter out = response.getWriter();
		out.print(jso);
	}
	
	//인증메일을 발송하는 기능
	/*
	 * @RequestMapping(value = "/emailAuth", method = RequestMethod.POST)
	public ModelAndView sendAuthEmail(UserVO user, Model model) {
		log.info("email authentication: "+ user);	
		ModelAndView mv= new ModelAndView();
		
		//db에 중복되는 이메일이 없다면(신규가입자 재확인)
		 if(service.canRegister(user.getUserEmail())) {
			 //중복없는 6자리 난수를 생성해서 user객체에 넣어준다
			 user.setUserAuthCode(numberGen(6, 2));
			 log.info("userAuthCode: " + user.getUserAuthCode());
			 //이 user에게 이메일을 보낸다
			if(emailService.sendAuthEmail(user.getUserEmail(), user.getUserAuthCode())) {
				//성공적으로 보냈으면
				//db에 이 user를 pending상태로 저장시킨다
				service.register(user);
				//보낸 이메일 주소를 인증코드 확인 페이지에서 알수 있게 hidden값으로 들어갈 수 있게 넣는다
				model.addAttribute("email", user.getUserEmail());
				//인증코드 확인 페이지를 보여준다
				mv.setViewName("register/emailAuth");
			}
			else {
				//성공적으로 못보냇으면
				//회원가입 페이지로 돌려보낸다
				//실패했다고 알려준다(발송의 실패)--이거 구현해야함
				mv.setViewName("reister/signUp");
				return mv;
				
			}
		} else {
			//db에 이미 해당하는 email이 있으면
			//회원정보가 있다고 알리고 findPwd페이지로 다시 가게 한다
			mv.setViewName("account/myAccount/findPwd");
		} 
		 return mv;
	} */
	
	//emailAuth 페이지를 get방식으로 접근하면 에러페이지를 보여주자
	@RequestMapping(value = "/emailAuth", method = RequestMethod.GET)
	public String cannotGetEmailAuth() {
		log.info("emailAuth는 get방식으로 접근 불가!");
		return "/register/emailAuth";
	}
		
	@RequestMapping(value = "/emailAuth", method = RequestMethod.POST)
	public ModelAndView sendEmailAuthAndRegister(UserVO user, Model model) {
		log.info("email authentication 159: "+ user);
		
		ModelAndView mv= new ModelAndView();
		if(service.registerThis(user)) {
			model.addAttribute("email", user.getUserEmail());
			mv.setViewName("/register/emailAuth");
			return mv;
		} else {
			model.addAttribute("msg2", "already");
			mv.setViewName("/account/myAccount/findPwd");
			return mv;
		}
	}
	
	@GetMapping("/registerFail")
	public String showRegisterFail() {
		log.info("register fail!!!!");
		return "/error/registerFail";
	}
	
	//emailAuth 페이지에서 인증코드를 입력하고 인증코드 확인 버튼 누르면 실행되는 메서드
	 /*@PostMapping("/submitAuth")
	public String submitAuthNum(String enteredAuthCode, String email, Model model, RedirectAttributes rttr) {
		log.info("authNum: "+ enteredAuthCode);
		
		//사용자가 입력한 값(인증번호)를 받아와서 DB의 인증코드 값이랑 같다면
		if(service.matchAuthCode(email, enteredAuthCode)) {
			//해당하는 이메일 사용자의 상태를 activ로 변경시킨다
			service.grantActive(email);
			UserVO user=service.getUserById(email);
			//user_info_history에도 남기기
			userHistorySerivce.insertStatCodeChangeHistory(user.getUserNum(), "512", service.getUserById(email).getUserNum());
			//가져온 user의 비번은 빈문자열 처리해주기
			user.setUserPwd("");
			//변경해준 user객체를 가져와서 session에 담기
			model.addAttribute("user", user);
			log.info("user 인증성공 후 세션에 담아라~!! "+ user);
			
			return "/user/welcome";
		}
		
		//입력코드가 틀렸다면
		else {
			rttr.addFlashAttribute("msg", "인증코드가 틀렸습니다! 다시 인증코드를 입력하세요!");
			return "redirect:/register/emailAuth";
		}		
	}
	*/
	
	@PostMapping("/submitAuth")
	public String submitAuthCode(String email, String enteredAuthCode, RedirectAttributes rttr, HttpSession session ){
		
		if(service.grantActive(email, enteredAuthCode, session)) {
			return "/user/welcome";
		}
		rttr.addFlashAttribute("email", email);
		rttr.addFlashAttribute("msg", "인증코드 불일치! 인증이메일을 재발송 하세요");
		rttr.addFlashAttribute("msgAboutEmail", "fail");
		return "redirect:/register/emailAuth";
		
	}
	
	//인증코드를 재생성하고 이메일 재발송하는 메서드
	/*@PostMapping("/sendAgain")
	public String sendAuthEmailAgain(String email, RedirectAttributes rttr) {
		
		//email이 db에 있는 지 확인하고
		if(!(service.canRegister(email))) {
			//새로운 인증코드를 생성
			String authCode=numberGen(6, 2);
			//DB에 사용자의 인증코드를 업데이트 해주고(transactional사용해야해!!!)
			if(service.updateAuthCode(email, authCode)) {
				
				//사용자 인증코드를 다시 발송시킨다
				emailService.sendAuthEmail(email, authCode);
			};
			
			//인증코드가 재발송 되었다고 어떻게 다시 알려주지!!!!
			rttr.addFlashAttribute("msgAboutEmail", "emailSent");
			return "redirect:/register/emailAuth";
		}
		return "/register/registerFail";
	}*/
}
