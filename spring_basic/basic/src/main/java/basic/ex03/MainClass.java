package basic.ex03;

import org.springframework.context.support.GenericXmlApplicationContext;

public class MainClass {

	public static void main(String[] args) {

		System.out.println("<scope-singletone(기본)>");
		
		GenericXmlApplicationContext ct = 
				new GenericXmlApplicationContext("classpath:prototype-config.xml");
		
		Person hong = ct.getBean("person1", Person.class);
		
		Person kim = ct.getBean("person1", Person.class);
		kim.setAge(30);
		kim.setName("김철수");
		
		System.out.println("hong의 주소: " + hong);
		System.out.println("kim의 주소: " + kim);
		System.out.println("hong과 kim은 같은 객체인가??? " + (hong == kim));
		
		System.out.println("-------------------------------");
		
		System.out.println("hong의 이름: " + hong.getName());
		System.out.println("hong의 나이: " + hong.getAge());
		System.out.println("kim의 이름: " + kim.getName());
		System.out.println("kim의 나이: " + kim.getAge());
		
		System.out.println("===============================");
		System.out.println("<scope-prototype>");
		
		ct = new GenericXmlApplicationContext("classpath:prototype-config.xml");
		
		hong = ct.getBean("person2", Person.class);
		
		kim = ct.getBean("person2", Person.class);
		kim.setAge(30);
		kim.setName("김철수");
		
		System.out.println("hong의 주소: " + hong);
		System.out.println("kim의 주소: " + kim);
		System.out.println("hong과 kim은 같은 객체인가??? " + (hong == kim));
		
		System.out.println("-------------------------------");
		
		System.out.println("hong의 이름: " + hong.getName());
		System.out.println("hong의 나이: " + hong.getAge());
		System.out.println("kim의 이름: " + kim.getName());
		System.out.println("kim의 나이: " + kim.getAge());
		
	}

}
