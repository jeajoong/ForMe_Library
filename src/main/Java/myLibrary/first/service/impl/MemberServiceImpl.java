package myLibrary.first.service.impl;

import java.util.HashMap;

import org.springframework.stereotype.Service;

import myLibrary.first.dao.MemberDao;
import myLibrary.first.domain.Member;
import myLibrary.first.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService{

  MemberDao memberDao;
  
  public MemberServiceImpl(MemberDao memberDao) {
  this.memberDao = memberDao;
  }
  
  
  @Override
  public int join(Member member) {
    return 0;
}

  @Override
  public Member get(String id, String password) {
    HashMap<String,Object> paramMap = new HashMap<>();
    paramMap.put("id", id);
    paramMap.put("password", password);
    
    return memberDao.findByIdPassword(paramMap);
  }
  

  @Override
  public int ban(int no) {
    return 0;
}


}
