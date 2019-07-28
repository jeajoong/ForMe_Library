package myLibrary.first.service;

import java.sql.Date;
import java.util.List;

import myLibrary.first.domain.Book;

public interface BookService {
  int insert(Book book);
  int add(int memberNo, int bookNo, Date readDate);
  List<Book> list();
}