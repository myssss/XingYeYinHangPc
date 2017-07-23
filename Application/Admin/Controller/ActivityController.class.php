<?php
namespace Admin\Controller;

use Think\Controller;
use Tools\AdminController;

class ActivityController extends AdminController
{
    public function index()
    {
        $list = M("Activity")->select();
        $this->assign('list', $list);
        $this->display();
    }

    public function activityAdd()
    {
//        dump($_POST);
//        die();
        M()->query($sql = 'TRUNCATE table `activity`');
        $activity = $_POST['activity'];
        foreach ($activity as $item) {
            if ($item['pic'] && $item['url']) {
                M("Activity")->add([
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
        M('Activity')->where(['id' => $_GET['id']])->delete();
        $this->redirect('index');
    }
}