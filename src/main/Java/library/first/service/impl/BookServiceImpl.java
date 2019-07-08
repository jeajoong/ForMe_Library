package library.first.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import library.first.domain.Book;
import library.first.service.BookService;

@Service
public class BookServiceImpl implements BookService{

  BookService bookService;

  public BookServiceImpl(BookService bookService) {
  this.bookService = bookService;
  }
  
  
  @Override
  public int insert(Book book) {
    return 0;
}


  @Override
  public List<Book> list() {
    return null;
}


}
