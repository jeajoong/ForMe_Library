package myLibrary.first.dao;

import java.util.List;

import myLibrary.first.domain.Book;
import myLibrary.first.domain.MebBook;

public interface MebBookDao {
  List<Book> list();
  int insert(MebBook mebBook);
  int remove(int bookNo); 
}
