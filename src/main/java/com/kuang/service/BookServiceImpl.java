package com.kuang.service;

import com.kuang.dao.BookMapper;
import com.kuang.pojo.Books;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Yac
 * @version JDK 17
 * @className BookMapper
 * @date 2024年06月06日 20:42
 */
@Service
public class BookServiceImpl implements BookService {

    //service调用dao层
    private BookMapper bookMapper;
    public void setBookMapper(BookMapper bookMapper) {
        this.bookMapper = bookMapper;
    }

    public int addBook(Books books) {
        return bookMapper.addBook(books);
    }

    public int deleteBookById(int id) {
        return bookMapper.deleteBookById(id);
    }

    public int updateBook(Books books) {
        return bookMapper.updateBook(books);
    }

    public Books queryBookById(int id) {
        return bookMapper.queryBookById(id);
    }

    public List<Books> quertAllBook() {
        return bookMapper.quertAllBook();
    }

    public List<Books> queryBookByName(String bookName) {
        return bookMapper.queryBookByName(bookName);
    }
}
