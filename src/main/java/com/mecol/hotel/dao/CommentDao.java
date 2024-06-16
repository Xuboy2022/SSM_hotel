package com.mecol.hotel.dao;

import com.mecol.hotel.entity.Comment;

import java.util.List;

public interface CommentDao {
    List<Comment> selectCommentByRoom_info_id(Integer room_info_id);

    void insComment(Comment comment);

    List<Comment> getCommentList();

    void deleteComment(Integer comment_id);
}
