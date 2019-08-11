package myLibrary.first.service.impl;

import java.sql.Date;
import java.util.List;

import org.springframework.stereotype.Service;

import myLibrary.first.dao.BookDao;
import myLibrary.first.dao.MebBookDao;
import myLibrary.first.domain.Book;
import myLibrary.first.domain.MebBook;
import myLibrary.first.service.BookService;

@Service
public class BookServiceImpl implements BookService{

  BookDao bookDao;
  MebBookDao mebBookDao;
  
  public BookServiceImpl(BookDao bookDao, MebBookDao mebBookDao) {
  this.bookDao = bookDao;
  this.mebBookDao = mebBookDao;
  }
  
  
  @Override // 책 추가용
  public int insert(Book book) {
    return bookDao.insert(book);
}
  
  @Override // 읽은 책 추가용
  public int add(String id, int bookNo, Date readDate) {
    MebBook mebBook = new MebBook();
    mebBook.setId(id);
    mebBook.setBookNo(bookNo);
    mebBook.setReadDate(readDate);
    
    return mebBookDao.insert(mebBook);
  }

  @Override // 책 목록
  public List<Book> list() {
    return bookDao.list();
}


  @Override // 유저의 읽은책 목록
  public List<MebBook> readList(String id) {
    return mebBookDao.readList(id);
  }



}
