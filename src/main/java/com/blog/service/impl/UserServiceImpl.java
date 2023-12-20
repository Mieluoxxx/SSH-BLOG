package com.blog.service.impl;

import com.blog.dao.BaseDAO;
import com.blog.entity.Essay;
import com.blog.entity.User;
import com.blog.entity.Userstar;
import com.blog.service.UserService;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

@Service
@Scope("prototype")
public class UserServiceImpl implements UserService {

    @Autowired
    private BaseDAO baseDAO;

    // 验证登录
    @Override
    public User checkLogin(String username, String password) {
        User u = new User();
        u.setUsername(username);
        u.setPassword(password);
        List users = baseDAO.find(u);

        if (!users.isEmpty()) return (User) users.get(0);
        else return null;
    }

    // 注册
    @Override
    public boolean register(String username, String password, String password_repeat) {
        if (password.equals(password_repeat)) {
            User newUser = new User();
            newUser.setUsername(username);
            newUser.setPassword(password);
            newUser.setType("user");
            List users = baseDAO.find(newUser);
            if (users.isEmpty()) {
                return baseDAO.add(newUser);
            } else {
                return false;
            }
        } else {
            return false;
        }
    }

    // 发布文章
    @Override
    public boolean produce(String id, String title, String content, Timestamp time, String author, String picture) {
        //System.out.println("ID: " + id + "\ntitle: " + title + "\nContent: " + content);
        if (title.isEmpty() || content.isEmpty()) {
            return false;
        } else {
            Essay newEssay = new Essay();
            newEssay.setEssayId(id);
            newEssay.setTitle(title);
            newEssay.setContent(content);
            newEssay.setTime(time);
            newEssay.setAuthor(author);
            newEssay.setPicture(picture);
            return baseDAO.add(newEssay);
        }
    }

    @Override
    public Essay getEssayById(String essayId) {
        List<Essay> essayList = baseDAO.findByHQL("from Essay where essayId='" + essayId + "'");
        if (!essayList.isEmpty()) {
            Essay essay = essayList.get(0);
            return essay;
        }
        return null;
    }

    // 获取所有文章
    @Override
    public List getEssays() {
        String hql = "FROM Essay e ORDER BY e.time DESC";
        return baseDAO.findByHQL(hql);
    }

    // 获取所有收藏的文章
    @Override
    public List getAllStars() {

        // 获取当前登录的用户名
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        String n = (String) session.getAttribute("Username");

        // 所有收藏文章的ID
        List essayIds = baseDAO.findByHQL("select essayId from Userstar us where us.username=" + n);

        Essay[] resultList = new Essay[essayIds.size()];

        for (int i = 0; i < resultList.length; i++) {
            System.out.println(essayIds.get(i));
        }
        return null;
    }

    // 删除自己的文章
    @Override
    public boolean deleteEssay(String essayId) {
        Essay essayResult = (Essay) baseDAO.findByHQL("from Essay where essayId='" + essayId + "'").get(0);
        return baseDAO.delete(essayResult);
    }

    // 判断是否收藏
    @Override
    public boolean ifStar(String essayId) {
        // 获取当前登录的用户名
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        String n = (String) session.getAttribute("Username");

        Userstar r = new Userstar();
        r.setUsername(n);
        r.setEssayId(essayId);

        return !baseDAO.find(r).isEmpty();
    }

    // 收藏
    @Override
    public boolean starEssay(String essayId) {
        // 获取当前登录的用户名
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        String n = (String) session.getAttribute("Username");

        // 构建收藏关系对象
        Userstar us = new Userstar();
        us.setrId("" + new Timestamp(new Date().getTime()));
        us.setUsername(n);
        us.setEssayId(essayId);

        return baseDAO.add(us);
    }

    // 取消收藏
    @Override
    public boolean unstarEssay(String essayId) {
        Userstar userStarResult = (Userstar) baseDAO.findByHQL("from Userstar where essayId='" + essayId + "'").get(0);
        return baseDAO.delete(userStarResult);
    }

    @Override
    public List search(String keyword) {
        return baseDAO.search(keyword);
    }

    @Override
    public boolean updateEssay(String essayId, String title, String content, String pictureFileName) {
        List<Essay> existingEssay = baseDAO.findByHQL("from Essay where essayId='" + essayId + "'");
        if (existingEssay.isEmpty()) {
            return false;
        }
        Essay essay = existingEssay.get(0);
        essay.setTitle(title);
        essay.setContent(content);
        essay.setPicture(pictureFileName);
        return baseDAO.update(essay);
    }


    @Override
    public boolean updateEssay(String essayId, String title, String content) {
        List<Essay> existingEssay = baseDAO.findByHQL("from Essay where essayId='" + essayId + "'");
        if (existingEssay.isEmpty()) {
            return false;
        }
        Essay essay = existingEssay.get(0);
        essay.setTitle(title);
        essay.setContent(content);
        return baseDAO.update(essay);
    }
}