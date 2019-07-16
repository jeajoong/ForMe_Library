package myLibrary.first.service;

import java.util.List;

import myLibrary.first.domain.Book;

public interface BookService {
  int insert(Book book);
  List<Book> list();
}
