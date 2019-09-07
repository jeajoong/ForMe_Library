package myLibrary.first.dao;

import java.util.List;

import myLibrary.first.domain.MebBook;

public interface MebBookDao {
  List<MebBook> readList(String id);
  int insert(MebBook mebBook);
  int modify(MebBook mebBook);
  int remove(int bookNo); 
}
