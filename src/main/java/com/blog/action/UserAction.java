package com.blog.action;

import com.blog.entity.Essay;
import com.blog.entity.User;
import com.blog.service.UserService;
import com.opensymphony.xwork2.ActionSupport;
import lombok.Getter;
import lombok.Setter;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

@Controller
@Scope("prototype")
@Getter
@Setter
public class UserAction extends ActionSupport {

    @Autowired
    private UserService userService;

    // - 表单信息 -
    // 用户信息
    private String username;
    private String password;
    private String password_repeat;

    // 文章相关
    private String title;
    private String content;
    private String essayId;

    // - 标签专用 -
    private List<Essay> essayList;
    private List<Essay> starList;

    private String keyword;

    // 登录
    public String login() {
        User user = userService.checkLogin(username, password);
        if (user != null) {
            HttpServletRequest request = ServletActionContext.getRequest();
            HttpSession session = request.getSession();
            session.setAttribute("Username", username);
            return SUCCESS;
        }
        return ERROR;
    }

    // 注册
    public String register() {
        if (userService.register(username, password, password_repeat)) return SUCCESS;
        return ERROR;
    }

    // 注销
    public String logout() {
        try {
            HttpServletRequest request = ServletActionContext.getRequest();
            HttpSession session = request.getSession(false); // 获取当前会话，如果没有则返回 null

            if (session != null) {
                session.invalidate(); // 清除会话信息
            }
            return SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
    }

    // 添加文章
    public String produce() {
        // 获取时间戳
        Timestamp ts = new Timestamp(new Date().getTime());

        // 获取作者用户名
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        String n = (String) session.getAttribute("Username");

        if (userService.produce("essay" + ts.getTime(), title, content, ts, n)) return SUCCESS;
        return ERROR;
    }

    // 查看文章列表
    public String list() {
        essayList = userService.getEssays();
        return SUCCESS;
    }

    // 查看收藏列表
    public String stars() {
        starList = userService.getAllStars();
        return SUCCESS;
    }

    // 删除文章
    public String deleteEssay() {
        userService.deleteEssay(essayId);
        return SUCCESS;
    }

    // 收藏文章
    public String starEssay() {
        userService.starEssay(essayId);
        return SUCCESS;
    }

    // 取消收藏文章
    public String unstarEssay() {
        userService.unstarEssay(essayId);
        return SUCCESS;
    }

    /*=====================
     *  非Action
    =======================*/
    // 判断是否收藏文章
    public boolean ifStar(String essayId) {
        return userService.ifStar(essayId);
    }

    // 获取所有收藏文章的ID
    public List getAllStars() {
        System.out.println("23333");
        return userService.getAllStars();
    }

    public String search() {
        // 调用Service层进行关键词搜索
        essayList = userService.search(keyword);
        return SUCCESS;
    }
}
