package myLibrary.first.web;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import myLibrary.first.domain.Book;
import myLibrary.first.service.BookService;

@Controller  // http://localhost:8080/myLibrary/app/library
@RequestMapping("/library")
public class LibraryController {

  private static final Logger logger = LogManager.getLogger(LibraryController.class);
  
  @Autowired BookService bookService;
  
  
  @GetMapping
  public String list(Model model) {

    List<Book> books = bookService.list();
      System.out.println(books);
    
    model.addAttribute("list", books);

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
  public String submit(@PathVariable int no, @PathVariable Date readDate, HttpSession session) throws ParseException {

    logger.debug("ajax.R.bookNo/" + no);
    session.getAttribute("loginUser");
    

    return "1"; // 성공적일때.
  }

  
  
  
  
  
  
  
  
  
  
  
  
  
}
