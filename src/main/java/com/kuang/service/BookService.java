package com.kuang.service;

import com.kuang.pojo.Books;

import java.util.List;

/**
 * @author Yac
 * @version JDK 17
 * @className BookMapper
 * @date 2024年06月06日 20:42
 */
public interface BookService {

    //添加一本书
    int addBook(Books books);

    //删除一本书
    int deleteBookById(int id);

    //修改一本书
    int updateBook(Books books);

    //查询一本书
    Books queryBookById(int id);

    //查询全部的书
    List<Books> quertAllBook();

    //根据图书名查询信息
    List<Books> queryBookByName(String bookName);
}
