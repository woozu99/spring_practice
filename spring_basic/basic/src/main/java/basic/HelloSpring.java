package basic;

import org.springframework.context.support.GenericXmlApplicationContext;

public class HelloSpring {

	public static void main(String[] args) {
		
		/**평소에 쓰던 객체 사용 방식**/
//		SpringTest st = new SpringTest();
//		st.hello();
		
		/**spring으로 객체가져오기(이러한 원리로 구동된다. 실제로는 이렇게 길게 쓰지 않는 방식을 사용)**/
		//new로 생성하지 않고 만들어 놓은 곳에서 객체를 가져오는 방식
		
		//xml객체 생성을 돕는 객체(매개값으로로 xml경로). classpath는 src/main/resources폴더를 지칭
		GenericXmlApplicationContext ct = new GenericXmlApplicationContext("classpath:test-config.xml");
		
		//매개값으로 ("id", className.class)
		SpringTest st = ct.getBean("test", SpringTest.class);
		
		ct.close();
		
	}

}
