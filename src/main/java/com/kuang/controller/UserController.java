package com.kuang.controller;

import com.kuang.pojo.User;
import com.kuang.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

/**
 * @author Yac
 * @version JDK 17
 * @className BookMapper
 * @date 2024年06月06日 20:42
 */
@Controller
public class UserController {

    @Autowired
    @Qualifier("UserServiceImpl")
    private UserService userService;

    /**
     * 跳转登录页面
     * @return
     */
    @RequestMapping("/user/toLogin")
    public String toLogin(){
        return "login";
    }

    /**
     * 用户登录
     * @param user
     * @param request
     * @return
     */
    @RequestMapping("/user/loginUser")
    public String loginUser(User user, HttpServletRequest request) {
        User userFinded = userService.loginUser(user);
        System.err.println(userFinded);
        if (userFinded == null) {
            request.setAttribute("msg", "用户名或密码有误，请重新输入。");
            return "login";
        } else {
            request.getSession().setAttribute("user", userFinded);
            request.setAttribute("msg", "登录成功。");
            return "redirect:/book/allBook";
        }
    }


    @RequestMapping("/user/toRegister")
    public String toRegister(){
        return "register";
    }

    @RequestMapping(value = "/user/register", method = RequestMethod.POST)
    public String register1(@RequestParam("username") String username,
                           @RequestParam("password") String password) {
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        userService.register(user);
        return "redirect:/user/toLogin"; // 注册成功后跳转到登录页面

    }

}