package testsuite;

import dao.MyMemberDao;
import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;
import module.TestadminCheck;

public class TestAll extends TestCase {

	public static Test suite() {
		TestSuite suite = new TestSuite("All test");
		
		// 앞에서 만든 테스트케이스 클래스들을 한꺼번에 테스트하는 방법
		suite.addTest(new TestSuite(TestadminCheck.class));
		
		return suite;
	}
}
