package myLibrary.first.domain;

import java.io.Serializable;
import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class MebBook implements Cloneable, Serializable {
  private static final long serialVersionUID = 1L;
  
  private String id;
  private int bookNo;
  @JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
  private Date readDate;
  
  private Member member;
  private Book book;

  
  @Override
  public String toString() {
    return "MebBook [id=" + id + ", bookNo=" + bookNo + ", readDate=" + readDate + ", member=" + member + ", book="
        + book + "]";
  }
  
  
  public String getId() {
    return id;
  }
  
  public void setId(String id) {
    this.id = id;
  }
  
  public int getBookNo() {
    return bookNo;
  }

  public void setBookNo(int bookNo) {
    this.bookNo = bookNo;
  }

  public Date getReadDate() {
    return readDate;
  }

  public void setReadDate(Date readDate) {
    this.readDate = readDate;
  }

  public Member getMember() {
    return member;
  }

  public void setMember(Member member) {
    this.member = member;
  }

  public Book getBook() {
    return book;
  }

  public void setBook(Book book) {
    this.book = book;
  }
  
}
