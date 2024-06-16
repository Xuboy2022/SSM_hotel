package com.mecol.hotel.service;

import com.mecol.hotel.entity.Comment;
import com.mecol.hotel.util.ResultUtil;

import java.util.List;

public interface CommentService {
    List<Comment> selectCommentByRoom_info_id(Integer room_info_id);

    void insComment(Comment comment);

    ResultUtil getCommentList(Integer page, Integer limit);

    void deleteComment(Integer comment_id);
}
