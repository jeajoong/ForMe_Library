package myLibrary.first.web;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import myLibrary.first.domain.Member;
import myLibrary.first.service.MemberService;

@Controller
@RequestMapping("/auth")
public class AuthController {

  final static Logger logger = LogManager.getLogger(AuthController.class);
  
  static final String REFERER_URL = "refererUrl";

  @Autowired MemberService memberService;
  @Autowired ServletContext servletContext;
  
  @GetMapping("form")
  public void form(
      @RequestHeader(value="Referer",required=false) String refererUrl,
      HttpSession session) {
    
    logger.debug("refererUrl: " + refererUrl);
    
    if (refererUrl != null && !refererUrl.endsWith("/auth/login")) {
      session.setAttribute(REFERER_URL, refererUrl);
    } else {
      session.removeAttribute(REFERER_URL);
    }
  }
  
//  @GetMapping("joinform")
//  public String joinForm(
//      @RequestHeader(value="Referer",required=false) String refererUrl,
//      HttpSession session) {
//    
//    return "auth/joinform";
//  }
  
  @PostMapping("join/{id}")
  @ResponseBody
  public String join(@PathVariable String id, @RequestBody String pw) throws ParseException {
    
    JSONParser jsonParser = new JSONParser();
    JSONObject jsonObj = (JSONObject) jsonParser.parse(pw); 
    String password = (String) jsonObj.get("pw");
    
    Member newMember = new Member();
    newMember.setId(id);
    newMember.setPw(password);
    
    memberService.join(newMember);
    
    return "1";
  }
  
  
  
  @PostMapping("login/{id}")
  @ResponseBody
  public String login(
      @PathVariable String id,
      @RequestBody String pw,
      @RequestBody String saveId,
      HttpSession session,
      HttpServletResponse response) throws ParseException {

    System.out.println(id);
    System.out.println(pw);
    System.out.println(saveId);
    
    
    JSONParser jsonParser = new JSONParser();
    JSONObject jsonObj = (JSONObject) jsonParser.parse(pw); 
    String password = (String) jsonObj.get("pw");
    
    
    Cookie cookie;
    if (saveId != null) {
      cookie = new Cookie("id", id);
      cookie.setMaxAge(60 * 60 * 24 * 15); // 15일간 쿠키를 보관한다.
      
    } else {
      cookie = new Cookie("id", "");
      cookie.setMaxAge(0); // 기존의 쿠키를 제거한다.
    }
    response.addCookie(cookie); 

    Member member = memberService.get(id, password);

    if (member == null) {
      return "0"; // fail
    }

    session.setAttribute("loginUser", member);

    String refererUrl = (String) session.getAttribute(REFERER_URL);
    
    logger.debug("refererUrl: " + refererUrl);
    
    if (refererUrl == null) {      
      return "1"; // 웹 애플리케이션 루트(컨텍스트 루트)를 의미한다.
      
    } else { // 사실상 이거 필요없음..
      return "redirect:" + refererUrl;
    }
  }
  
  
  
  @GetMapping("logout")
  public String logout(HttpSession session) throws Exception {
    
    logger.debug("세션 무효화시킴!");
    logger.debug("loginUser: " + session.getAttribute("loginUser"));
    session.invalidate();
    
    return "redirect:../library";
  }
}










