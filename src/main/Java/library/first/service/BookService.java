package library.first.service;

import java.util.List;

import library.first.domain.Book;

public interface BookService {
  int insert(Book book);
  List<Book> list();
}
