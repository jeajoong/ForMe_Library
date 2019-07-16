package myLibrary.first.domain;

import java.io.Serializable;
import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class MebBook implements Cloneable, Serializable {
  private static final long serialVersionUID = 1L;
  
  private int no;
  private int bookNo;
  @JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
  private Date readDate;
  
  @Override
  public String toString() {
    return "MebBook [no=" + no + ", bookNo=" + bookNo + ", readDate=" + readDate + "]";
  }

  public int getNo() {
    return no;
  }
  
  public void setNo(int no) {
    this.no = no;
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
  
}
