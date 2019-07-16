package myLibrary.first.dao;

import java.util.List;
import myLibrary.first.domain.Book;

public interface MebBookDao {
  List<Book> list();
  int add(int bookNo); 
  int remove(int bookNo); 
}
