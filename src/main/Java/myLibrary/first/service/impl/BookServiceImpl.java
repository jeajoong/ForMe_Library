package myLibrary.first.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import myLibrary.first.dao.BookDao;
import myLibrary.first.dao.MemberDao;
import myLibrary.first.domain.Book;
import myLibrary.first.service.BookService;

@Service
public class BookServiceImpl implements BookService{

  BookDao bookDao;
  MemberDao memberDao;
  
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
