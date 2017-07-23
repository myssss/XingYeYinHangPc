<?php
namespace Tools;
use Tools\Qiniu;
use Think\Controller;

class AdminController extends Controller {

    public function _initialize()
    {
        $this->assign('menu', $this->getMenu());
    }

    public function getMenu()
    {
        $auths = [
            [
                'auth_id' =>'1',
                'auth_name' =>'中奖用户信息',
                'auth_pid' =>'0',
                'auth_c' =>'Prize',
                'auth_a' =>'index',
                'auth_path' =>'1',
                'auth_level' =>'1',
            ],
            [
                'auth_id' =>'2',
                'auth_name' =>'统计',
                'auth_pid' =>'0',
                'auth_c' =>'Report',
                'auth_a' =>'statistic',
                'auth_path' =>'2',
                'auth_level' =>'1',
            ],
        ];
        $menu = [];
        foreach ($auths as $item) {
            if ($item['auth_pid'] == 0) {
                if (CONTROLLER_NAME == $item['auth_c']) {
                    $item['active_class'] = 'active';
                } else {
                    $item['active_class'] = '';
                }
                $menu[] = $item;
            } else {
                if (CONTROLLER_NAME == $item['auth_c'] && ACTION_NAME == $item['auth_a']) {
                    $item['active_class'] = 'active';
                } else {
                    $item['active_class'] = '';
                }
                $menu[$item['auth_pid'] -1]['children'][] = $item;
            }
        }
        return $menu;
    }

    public function getToken(){
        $qiniu = new Qiniu(C('UPLOAD_SITEIMG_QINIU')['accessKey'], C('UPLOAD_SITEIMG_QINIU')['secrectKey'],C('UPLOAD_SITEIMG_QINIU')['domain'],  C('UPLOAD_SITEIMG_QINIU')['bucket'] );
        $uploadToken = $qiniu->uploadToken(array('scope' => 'tofax-salesman'));
        $this->ajaxReturn([
            'uptoken' => $uploadToken
        ]);
    }
}