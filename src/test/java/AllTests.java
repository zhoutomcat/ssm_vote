import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.junit.runners.Suite.SuiteClasses;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yc.bean.VoteUser;
import com.yc.biz.VoteBiz;
import com.yc.utils.Encrypt;

//以后由spring来管理所有的bean
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath*:beans.xml")
public class AllTests {

	@Autowired
	ApplicationContext ac;

	@Test
	public void testLogin() {
		VoteBiz vb = (VoteBiz) ac.getBean("voteBizImpl");
		VoteUser voteUser = new VoteUser();
		voteUser.setUname("a");
		voteUser.setPwd(Encrypt.md5AndSha("a"));
		System.out.println(vb.login(voteUser));
	}

	@Test
	public void testIsUsernameExist() {
		VoteBiz vb = (VoteBiz) ac.getBean("voteBizImpl");
		VoteUser voteUser = new VoteUser();
		voteUser.setUname("b");
		voteUser.setPwd(Encrypt.md5AndSha("a"));
		
		System.out.println(vb.isUsernameExist(voteUser));
	}

}
