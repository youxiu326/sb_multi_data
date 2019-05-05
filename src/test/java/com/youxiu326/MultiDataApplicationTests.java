package com.youxiu326;

import com.youxiu326.entity.Product;
import com.youxiu326.p.entity.User;
import com.youxiu326.p.repository.UserRepository;
import com.youxiu326.s.entity.Message;
import com.youxiu326.s.repository.MessageRepository;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class MultiDataApplicationTests {


    @Autowired
    @Qualifier("primaryJdbcTemplate")
    protected JdbcTemplate jdbcTemplate1;

    @Autowired
    @Qualifier("secondaryJdbcTemplate")
    protected JdbcTemplate jdbcTemplate2;

    /**
     * 测试不同 JdbcTemplate新增数据
     */
    @Test
    public void contextLoads() {

        Product primaryPro = new Product("这是主数据源");
        Product secondaryPro = new Product("这是从数据源");

        // 往第一个数据源中插入一条数据
        jdbcTemplate1.update("insert into product(id,name) values(?, ?)", 2, "这是主数据源");

        // 往第二个数据源中插入一条数据
        jdbcTemplate2.update("insert into product(id,name) values(?, ?)", 2, "这是从数据源");

    }


    @Autowired
    private UserRepository userRepository;

    @Autowired
    private MessageRepository messageRepository;


    /**
     * 使用这两个针对不同数据源的配置进行数据操作 spring data jpa
     * @throws Exception
     */
    @Test
    public void test() throws Exception {

        userRepository.save(new User("aaa", 10));
        userRepository.save(new User("bbb", 20));
        userRepository.save(new User("ccc", 30));
        userRepository.save(new User("ddd", 40));
        userRepository.save(new User("eee", 50));

        Assert.assertEquals(5, userRepository.findAll().size());

        messageRepository.save(new Message("o1", "aaaaaaaaaa"));
        messageRepository.save(new Message("o2", "bbbbbbbbbb"));
        messageRepository.save(new Message("o3", "cccccccccc"));

        Assert.assertEquals(3, messageRepository.findAll().size());

    }


}
