package myLibrary.first.service;

import myLibrary.first.domain.Member;

public interface MemberService {
  int join(Member member);//회원가입할떄.
  Member get(String id, String password);//로그인할때
  int ban(int no); //회원번호 주면 해당 회원 삭제
}
