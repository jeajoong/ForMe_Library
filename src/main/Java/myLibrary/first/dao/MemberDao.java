package myLibrary.first.dao;

import myLibrary.first.domain.Member;

public interface MemberDao {
  int join(Member member); // 회원가입 할떄.
  int ban(int no); // 번호 넘겨주면 해당 회원 삭제
}
