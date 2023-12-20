package com.blog.test;

import com.blog.dao.BaseDAO;
import com.blog.entity.Essay;
import com.blog.service.UserService;
import org.apache.struts2.ServletActionContext;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
// Replace with your actual context configuration
public class test {
    @Autowired
    private BaseDAO baseDAO;
    @Autowired
    private UserService userService;

    @Test
    public void test1() {
        Essay e = userService.getEssayById("essay1702999033865");
        System.out.println(e);
    }

    @Test
    public void test2() {
        String essayId = "essay1703071577655";
        Essay e = userService.getEssayById(essayId);
        String title = "测试中...";
        String content = "测试中...";
        String pictureFileName = "1.png";
        userService.updateEssay(essayId, title, content, pictureFileName);
    }

    @Test
    public void test3() {
        String essayId = "essay1703071577655";
        List<Essay> existingEssay = baseDAO.findByHQL("from Essay where essayId='" + essayId + "'");
        System.out.println(existingEssay);
    }

    @Test
    public void produce() throws IOException {
        // 获取时间戳
        Timestamp ts = new Timestamp(new Date().getTime());
        String n = "admin";
        String title = "111";
        String content = "222";
        String pictureFileName = "1.png";
        if (userService.produce("essay" + ts.getTime(), title, content, ts, n, pictureFileName)) {
            System.out.println("111");
        }
    }

    @Test
    public void printPath(){
        System.out.println(System.getProperty("user.dir"));
    }
}

