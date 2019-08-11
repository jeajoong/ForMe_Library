package myLibrary.first.dao;

import java.util.List;
import myLibrary.first.domain.Book;

public interface BookDao {
  int insert(Book book);
  List<Book> list();
}

