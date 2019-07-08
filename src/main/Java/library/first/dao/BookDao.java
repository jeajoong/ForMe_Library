package library.first.dao;

import java.util.List;

import library.first.domain.Book;

public interface BookDao {
  int insert(Book book);
  List<Book> list();
}
