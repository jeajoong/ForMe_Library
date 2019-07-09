package library.first.web.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import org.apache.ibatis.logging.LogFactory;

@WebListener
public class AppInitListener implements ServletContextListener {
  @Override
  public void contextInitialized(ServletContextEvent sce) {

    LogFactory.useLog4J2Logging();
    
    ServletContext sc = sce.getServletContext();
    sc.setAttribute("contextRootPath", sc.getContextPath()); 
  }
}


// ServletContext 자체의 의미를 모른다면 단순히 서블릿 컨테이너와 통신하여 서블릿의 정보를 얻는다라는 결론 밖에 없다.

// 'Java Servlet에 대해' , '※★서블릿 관련' => '잘모르는것들' 북마크 폴더 그림참조
//
//  Servlet, ServletConfig, ServletContext, ServletContextListener, ServletContainer--- 정의
//
// - Servlet은 웹 서버 내부에서 동작하는 작은 자바 프로그램.
//    http를 통해 웹 client들로부터 요청을 수신하고 응답.
//    init(), service(), destory()같이 내부적으로 규약이 존재.
//   
// - ServletConfig는 하나의 Servlet 초기화에 필요한 정보를 전달하기 위한 Config 객체.
//    Servlet당 하나만 생성.
//   
// - ServletContext는 하나의 Java Virtual Machin.
//    하나의 서블릿이 서블릿 컨테이너와 통신하기 위해서 사용되어지는 메소드들을 가지고 있다.
//
// - ServleteContextListener는
//    웹 어플리케이션의 생명주기를 감시하는 Listener이다.
//    ContextInitialized(), ContextDestroyed() -> 웹 어플리케이션 시작과 종료시 호출됨.
//
// - GenericServlet은 Protocol에 독립적인 Servlet을 위해 Abstract Class로 존재
// - HttpServlet은 GenericServlet을 상속받은 Servlet이며 Http Protocol을 지원하는 Servlet이다.
//
// - ServletContainer는 톰캣을 뜻함.


