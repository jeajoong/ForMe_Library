package myLibrary.first.dao;

import java.util.List;
import myLibrary.first.domain.Book;

public interface BookDao {
  int insert(Book book);
  List<Book> list();
}


// 회사에서 알게된 충격적인 사실은 
// 오라클이면 프로시저를 이용해 웹에서 쓰는 자바코드를 대신할 수 있다는 것.
// 프로시저를 잘 짜게되면 자바단에서 하는것이 없어진다..