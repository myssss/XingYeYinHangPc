<?php
namespace Admin\Controller;
use Model\AuthModel;
use Think\Controller;
use Tools\AdminController;

class IndexController extends AdminController {
    public function index()
    {
        $this->redirect('Report/statistic');
    }
}