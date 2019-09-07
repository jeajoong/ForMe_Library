package myLibrary.first.service;

import java.sql.Date;
import java.util.List;

import myLibrary.first.domain.Book;
import myLibrary.first.domain.MebBook;

public interface BookService {
  int insert(Book book);
  int add(String id, int bookNo, Date readDate);
  int modify(String id, int bookNo, Date readDate);
  List<Book> list();
  List<MebBook> readList(String id);
}
