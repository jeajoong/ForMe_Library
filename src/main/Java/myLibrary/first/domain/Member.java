package myLibrary.first.domain;

import java.io.Serializable;

public class Member implements Cloneable, Serializable {
  private static final long serialVersionUID = 1L;
  
  private String id;
  private String pw;
  
  @Override
  public String toString() {
    return "Member [id=" + id + ", pw=" + pw + "]";
  }

  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }

  public String getPw() {
    return pw;
  }

  public void setPw(String pw) {
    this.pw = pw;
  }
  
  
}
