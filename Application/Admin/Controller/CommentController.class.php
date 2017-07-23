<?php
namespace Admin\Controller;

use Think\Controller;
use Tools\AdminController;

class CommentController extends AdminController
{
    public function index()
    {
        $list = M("Comment")->select();
        $this->assign('list', $list);
        $this->display();
    }
}