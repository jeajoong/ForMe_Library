package myLibrary.first.dao;

import java.util.Map;

import myLibrary.first.domain.Member;

public interface MemberDao {
  int join(Member member);  // 회원가입 할떄.
  Member findByIdPassword(Map<String,Object> paramMap);  // 패스워드 찾을 때.
  int ban(String id);  // id 넘겨주면 해당 회원 삭제
}
