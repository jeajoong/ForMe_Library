package myLibrary.first.service.impl;

import java.sql.Date;
import java.util.List;

import org.springframework.stereotype.Service;

import myLibrary.first.dao.BookDao;
import myLibrary.first.dao.MebBookDao;
import myLibrary.first.domain.Book;
import myLibrary.first.service.BookService;

@Service
public class BookServiceImpl implements BookService{

  BookDao bookDao;
  MebBookDao MebBookDao;
  
  public BookServiceImpl(BookDao bookDao) {
  this.bookDao = bookDao;
  }
  
  
  @Override // 책 추가용
  public int insert(Book book) {
    return 0;
}
  
  @Override // 읽은 책 추가용
  public int add(int memberNo, int bookNo, Date readDate) {
    return 0;
  }

  @Override
  public List<Book> list() {
    return bookDao.list();
}




}
