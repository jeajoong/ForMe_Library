package myLibrary.first.service.impl;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import myLibrary.first.dao.MemberDao;
import myLibrary.first.domain.Member;
import myLibrary.first.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService{

  @Autowired
  MemberDao memberDao;
  
  public MemberServiceImpl(MemberDao memberDao) {
  this.memberDao = memberDao;
  }
  
  
  @Override
  public int join(Member member) {
    return memberDao.join(member);
}

  @Override
  public Member get(String id, String pw) {
    HashMap<String,Object> paramMap = new HashMap<>();
    paramMap.put("id", id);
    paramMap.put("pw", pw);
    
    return memberDao.findByIdPassword(paramMap);
  }
  

  @Override
  public int ban(String id) {
    return 0;
}


}
