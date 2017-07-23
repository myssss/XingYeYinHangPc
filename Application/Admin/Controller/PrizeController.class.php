<?php
namespace Admin\Controller;

use Think\Controller;
use Tools\AdminController;

class PrizeController extends AdminController
{
    public function index()
    {
        $sql = "select p.id, p.type,p.prize_name, p.take_time, u.tel, u.name  from prize p left join `user` u on p.user_id = u.id where p.is_get=1 ORDER BY p.take_time DESC;";
        $list = M()->query($sql);
        $this->assign('list', $list);
        $this->display();
    }

}