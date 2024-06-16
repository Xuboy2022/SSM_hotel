package com.mecol.hotel.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mecol.hotel.dao.CommentDao;
import com.mecol.hotel.entity.Comment;
import com.mecol.hotel.util.ResultUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class CommentServiceImpl implements CommentService
{
    @Autowired
    private CommentDao commentDao;

    @Override
    public List<Comment> selectCommentByRoom_info_id(Integer room_info_id) {
        return commentDao.selectCommentByRoom_info_id(room_info_id) ;
    }

    @Override
    public void insComment(Comment comment) {
        commentDao.insComment(comment);
    }

    @Override
    public ResultUtil getCommentList(Integer page, Integer limit) {
        PageHelper.startPage(page,limit);
        List<Comment> commentList=commentDao.getCommentList();
        PageInfo<Comment> commentPageInfo=new PageInfo<>(commentList);

        ResultUtil resultUtil=new ResultUtil();
        resultUtil.setCode(0);
        resultUtil.setData(commentPageInfo.getList());
        resultUtil.setCount(commentPageInfo.getTotal());
        return resultUtil;
    }

    @Override
    public void deleteComment(Integer comment_id) {
        commentDao.deleteComment(comment_id);
    }
}
