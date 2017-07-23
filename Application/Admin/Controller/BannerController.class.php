<?php
namespace Admin\Controller;

use Think\Controller;
use Tools\AdminController;

class BannerController extends AdminController
{
    public function index()
    {
        $list = M("Banner")->select();
        $this->assign('list', $list);
        $this->display();
    }

    public function bannerAdd()
    {
        M()->query($sql = 'TRUNCATE table `banner`');
        $activity = $_POST['banner'];
        foreach ($activity as $item) {
            if ($item['pic'] && $item['url']) {
                M("Banner")->add([
                    'pic' => $item['pic'],
                    'url' => $item['url'],
                    'rank' => $item['rank'],
                ]);
            }
        }
        $this->redirect('index');
    }

    public function delete()
    {
        M('Banner')->where(['id' => $_GET['id']])->delete();
        $this->redirect('index');
    }
}