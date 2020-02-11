package myLibrary.first.dao;

import java.util.Map;

import myLibrary.first.domain.Calendar;

public interface CalendarDao {
  Calendar list(String memberId);
  void insertCalendar(Calendar calendar);
  void updateCalendar(Calendar calendar);
  void deleteCalendar(Map<String, Integer> userIdCalIdMap);
}
