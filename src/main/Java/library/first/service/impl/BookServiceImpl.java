package library.first.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import library.first.dao.BookDao;
import library.first.domain.Book;
import library.first.service.BookService;

@Service
public class BookServiceImpl implements BookService{

  BookDao bookDao;

  public BookServiceImpl(BookDao bookDao) {
  this.bookDao = bookDao;
  }
  
  
  @Override
  public int insert(Book book) {
    return 0;
}


  @Override
  public List<Book> list() {
    return bookDao.list();
}


}
