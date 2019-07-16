package myLibrary.first.domain;

import java.io.Serializable;

public class Book implements Cloneable, Serializable{
  private static final long serialVersionUID = 1L;
  
  private int bookNo;
  private String bookName;
  private String bookAuthor;
  private int bookPrice;
  

  public String toString() {
    return "book [bookNo=" + bookNo + ", bookName=" + bookName + ", bookAuthor=" + bookAuthor + ", bookPrice="
        + bookPrice + "]";
  }

  public int getBookNo() {
    return bookNo;
  }
  public void setBookNo(int bookNo) {
    this.bookNo = bookNo;
  }
  public String getBookName() {
    return bookName;
  }
  public void setBookName(String bookName) {
    this.bookName = bookName;
  }
  public String getBookAuthor() {
    return bookAuthor;
  }
  public void setBookAuthor(String bookAuthor) {
    this.bookAuthor = bookAuthor;
  }
  public int getBookPrice() {
    return bookPrice;
  }
  public void setBookPrice(int bookPrice) {
    this.bookPrice = bookPrice;
  }
  
}
