package myLibrary.first.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import myLibrary.first.dao.CalendarDao;
import myLibrary.first.domain.Calendar;
import myLibrary.first.service.CalendarService;

@Service
public class CalendarServiceImpl implements CalendarService {

  @Autowired
  CalendarDao calendarDao;
  
  public CalendarServiceImpl(CalendarDao calendarDao) {
    this.calendarDao = calendarDao;
  }
  
  
  @Override
  public Calendar list(String memberId) {
    return calendarDao.list(memberId);
  }

  @Override
  public void insertCalendar(Calendar calendar) {
    calendarDao.insertCalendar(calendar);
  }

  @Override
  public void updateCalendar(Calendar calendar) {
    calendarDao.updateCalendar(calendar);
  }

  @Override
  public void deleteCalendar(Map<String, Integer> userIdCalIdMap) {
    calendarDao.deleteCalendar(userIdCalIdMap);
  }
  
  
}
