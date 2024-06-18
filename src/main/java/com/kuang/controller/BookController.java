package com.kuang.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kuang.pojo.Books;
import com.kuang.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * @author Yac
 * @version JDK 17
 * @className BookMapper
 * @date 2024年06月06日 20:42
 */
@Controller
@RequestMapping("/book")
public class BookController {

    @Autowired
    @Qualifier("BookServiceImpl")
    private BookService bookService;

    /**
     * 查询全部的书籍，并返回到一个书籍展示页面（无分页查询）
     * @param model
     * @return
     */
    @RequestMapping("/allBook")
    public String list(Model model){
        List<Books> list = bookService.quertAllBook();
        model.addAttribute("list",list);
        return "allBook";
    }

    /**
     * 跳转添加页面
     * @return
     */
    @RequestMapping("/toAddBook")
    public String toAddPage(){
        return "addBook";
    }

    /**
     * 添加图书信息
     * @param books
     * @return
     */
    @RequestMapping("/addBook")
    public String addBook(Books books){
        System.out.println("addBook=>" +books);
        bookService.addBook(books);
        return "redirect:/book/allBooks";//重定向查询请求中
    }

    /**
     * 跳转更新页面  并回显页面信息
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("/toUpdateBook")
    public String toUpdateBook(int id,Model model){
        Books books = bookService.queryBookById(id);
        System.err.println("toUpdateBook=>" + books);
        model.addAttribute("QBook",books);
        return "updateBook";
    }

    /**
     * 更新图书信息
     * @param books
     * @return
     */
    @RequestMapping("/updateBook")
    public String updateBook(Books books){
        //System.err.println("updateBook=>" +books);
        bookService.updateBook(books);
        return "redirect:/book/allBooks";//重定向查询请求中
    }

    /**
     * 删除图书信息
     * @param id
     * @return
     */
    @RequestMapping("/deleteBook/{bookId}")
    public String deleteBook(@PathVariable("bookId") int id){
        bookService.deleteBookById(id);
        return "redirect:/book/allBooks";//重定向查询请求中
    }

    /**
     * 查询书籍数据（包含分页）
     * @param pn
     * @param model
     * @return
     */
    @RequestMapping("/allBooks")
    public String getBooks(@RequestParam(value = "pn",defaultValue = "1") Integer pn , Model model){
        // 这不是一个分页查询；
        // 引入PageHelper分页插件
        // 在查询之前只需要调用，传入页码，以及每页的大小
        PageHelper.startPage(pn,5);
        // startPage后面紧跟的这个查询就是一个分页查询
        List<Books> list = bookService.quertAllBook();
        // 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
        // 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数
        PageInfo pageInfo = new PageInfo(list,3);
        model.addAttribute("pageInfo",pageInfo);
        return "allBook";
    }

    /**
     * 根据图书名 --> 条件查询图书
     * @param queryBookName
     * @param model
     * @return
     */
    @RequestMapping("/queryBook")
    public String queryBook(String queryBookName, Model model, @RequestParam(value = "pn", defaultValue = "1") Integer pn) {
        if (queryBookName == null || queryBookName.trim().isEmpty()) {
            return "redirect:/book/allBooks";
        }

        // 其余代码保持不变
        List<Books> books = bookService.queryBookByName("%" + queryBookName + "%");
        System.err.println("queryBook=>"+books);

        PageHelper.startPage(pn,5);
        PageInfo pageInfo = new PageInfo(books,3);
        model.addAttribute("pageInfo",pageInfo);
        model.addAttribute("list",books);
        return "allBook";
    }


}
