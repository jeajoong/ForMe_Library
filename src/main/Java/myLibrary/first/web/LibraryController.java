package myLibrary.first.web;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

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
import myLibrary.first.service.CalendarService;
import myLibrary.first.service.MemberService;

@Controller  // http://localhost:8080/myLibrary/first/library
@RequestMapping("/library")
public class LibraryController {

  @Autowired BookService bookService;
  @Autowired CalendarService calendarService;
  @Autowired MemberService memberService;
  
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
  
  //책 정보를 추가
  @RequestMapping(value = "/add", method = {RequestMethod.GET, RequestMethod.POST})
  @ResponseBody
  public int insert(@RequestBody String json, // RequestBody로 객체 하나하나 다 받으려고 하면 400오류남 이렇게 해야함
      HttpSession session) throws ParseException {
    
    System.out.println(json);
    
    JSONParser jsonParser = new JSONParser();
    JSONObject jsonObj = (JSONObject) jsonParser.parse(json);
    
    String bookName = (String) jsonObj.get("bookName");
    String bookAuthor = (String) jsonObj.get("bookAuthor");
    String price = (String) jsonObj.get("bookPrice");
    int bookPrice = Integer.parseInt(price);
    
    System.out.println(bookName);
    System.out.println(bookAuthor);
    System.out.println(bookPrice);
    
    Book book = new Book();
    book.setBookName(bookName);
    book.setBookAuthor(bookAuthor);
    book.setBookPrice(bookPrice);
    
    bookService.insert(book);
    return 1;
  }
  
  // 읽은 책 데이터 추가
  @RequestMapping(value = "insert/{no}", method = {RequestMethod.GET, RequestMethod.POST})
  @ResponseBody
  public String submit(
      @PathVariable int no, @RequestBody String readDate,
      HttpSession session) throws ParseException {

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

  
  // 날짜 수정하기
  @RequestMapping(value = "modify/{bookNo}", method = {RequestMethod.GET, RequestMethod.POST})
  @ResponseBody
  public String modify(
      @PathVariable int bookNo, @RequestBody String readDate,
      HttpSession session) throws ParseException {

    System.out.println(bookNo + "//" + readDate);  //읽은 날짜가 안넘어 오네?
    
    Member member = (Member) session.getAttribute("loginUser");
    String mId = member.getId();
                                                                  // 날짜 파싱해서 Date형태로 DB에 저장.
    JSONParser jsonParser = new JSONParser();                     // 파서 생성
    JSONObject jsonObj = (JSONObject) jsonParser.parse(readDate); // 파서가 쓸모없는거({},'') 지워줌
    String obj = (String) jsonObj.get("readDate");                // 원래 데이터 값(obj에 날짜정보만.)
    
    Date parseReadDate = Date.valueOf(obj);                       // Date형태로 변환
    
    System.out.println(mId+"//"+ bookNo +"//"+ parseReadDate);
    
    bookService.modify(mId, bookNo, parseReadDate);

    return "1"; 
  }
  // Date의 형태가 달라서 콘솔창의 오류가 나거나
  // <form>에 아무런 장치가 안되있는데 먼저 동작해서 오류인건지 확인할것.

  /* 달력 테스트 */
  // http://localhost:8080/myLibrary/first/library?method=init
  @RequestMapping(params="method=init")
  public String init() { //이건 jsp 렌더링 때문인것같은데?
    return "library/fullcalendar";
  }
  
  @RequestMapping(params="method=list")
  public String list(HttpSession session ,Model d) {
    
    Member member = (Member)session.getAttribute("loginUser");
    if(member.getId() == null) {
      return "로그인필요";
    } else {
      d.addAttribute("list", calendarService.list(member.getId()));
    }
    return "pageJsonReport";
  }
  
}
