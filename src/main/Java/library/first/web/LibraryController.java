package library.first.web;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.eomcs.lms.domain.Announce;

import library.first.domain.Book;
import library.first.service.BookService;

@Controller
@RequestMapping("/library")
public class LibraryController {

  private static final Logger logger = LogManager.getLogger(LibraryController.class);
  
  @Autowired BookService bookService;
  
  
  @GetMapping
  public String list(Model model) {

    List<Book> books = bookService.list();
    model.addAttribute("list", books);

    return "library/list";
  }

  
  @GetMapping("/add")
  public int insert(Book book) {
  
      
    return 0;
      
  }
  
}
