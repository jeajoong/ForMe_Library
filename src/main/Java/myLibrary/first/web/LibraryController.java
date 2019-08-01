package myLibrary.first.web;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import myLibrary.first.domain.Book;
import myLibrary.first.domain.MebBook;
import myLibrary.first.domain.Member;
import myLibrary.first.service.BookService;

@Controller  // http://localhost:8080/myLibrary/app/library
@RequestMapping("/library")
public class LibraryController {

  private static final Logger logger = LogManager.getLogger(LibraryController.class);
  
  @Autowired BookService bookService;
  
  @GetMapping
  public String list(Model model, HttpSession session) {
    List<Book> books = bookService.list();
    model.addAttribute("list", books);
    
    Member member = (Member) session.getAttribute("loginUser");
    if (member != null) {
      String id = member.getId();
      List<MebBook> readBook = bookService.readList(id);
      model.addAttribute("readBook",readBook);
    } else {
    }
     
    return "library/list";
  }
  
  //책 정보를 추가하는 용.
  @GetMapping("/add")
  public int insert(Book book) {
    return 0;
  }
  
  
  // 읽은 책 데이터 넣을 때
  @RequestMapping(value = "insert/{no}", method = {RequestMethod.GET, RequestMethod.POST})
  @ResponseBody
  public String submit(
      @PathVariable int no, @RequestBody String readDate,
      HttpSession session) throws ParseException, java.text.ParseException {

    Member member = (Member) session.getAttribute("loginUser");
    String mId = member.getId();
    
    System.out.println("/////"+ readDate);
    
                                                                  // 날짜 파싱해서 Date형태로 DB에 저장.
    JSONParser jsonParser = new JSONParser();                     // 파서 생성
    JSONObject jsonObj = (JSONObject) jsonParser.parse(readDate); // 파서가 쓸모없는거({},'') 지워줌
    String obj = (String) jsonObj.get("readDate");                // 원래 데이터 값(obj에 날짜정보만.)
    
    Date parseReadDate = Date.valueOf(obj);                       // Date형태로 변환
    
    System.out.println(mId+"//"+ no +"//"+ parseReadDate);
    
    bookService.add(mId, no, parseReadDate);

    return "1"; 
  }

  
}
