package basic.ex01;

import org.springframework.context.support.GenericXmlApplicationContext;

public class MainClass {

	public static void main(String[] args) {
		
		/*
		Chef chef = new Chef();
		Restaurant res = new Restaurant(chef);
		Hotel hotel = new Hotel(res);
		hotel.reserveRestaurant();
		*/
		
		//"classpath:"는 src>main 폴더 아래의 두 폴더를 의미. 둘 중 하나에 :뒤에 쓴 경로가 하위 경로로 있어야 한다.
		GenericXmlApplicationContext ct = new GenericXmlApplicationContext("classpath:test-config.xml");
		
		Hotel hotel = ct.getBean("hotel", Hotel.class);
		
		hotel.reserveRestaurant();

	}

}
