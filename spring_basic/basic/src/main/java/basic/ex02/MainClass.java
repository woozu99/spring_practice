package basic.ex02;

import org.springframework.context.support.GenericXmlApplicationContext;

public class MainClass {

	public static void main(String[] args) {
		
		GenericXmlApplicationContext ct = new GenericXmlApplicationContext("classpath:db-config.xml");
		
		DataBaseInfo dbInfo = ct.getBean("db1", DataBaseInfo.class);
		System.out.println(dbInfo.getUid());
		
		dbInfo = ct.getBean("db2", DataBaseInfo.class);
		System.out.println(dbInfo.getUid());
		
		System.out.println("------------------");
		
		MemberDAO dao = ct.getBean("dao", MemberDAO.class);
		dao.showDbInfo();
	}

}
