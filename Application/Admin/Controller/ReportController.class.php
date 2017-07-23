<?php
namespace Admin\Controller;

use Model\AuthModel;
use Think\Controller;
use Tools\AdminController;

class ReportController extends AdminController
{
    public function statistic()
    {
        $channel = $_GET['channel'];
        if (!$channel) {
            $channel = '__all__';
        }
        $url = "http://api2.izhida.cn/tongjiV2/report?app_stat_key=hTN4BCHYTsAfa272&app_stat_secret=E35tNhpdNkz6HRb8";
        $content = file_get_contents($url);
        $data = json_decode($content, true);
        $data_list = $data['data'];
        $event_meta_list = $this->get_event_meta();
        $this->assign('event_meta_list', $event_meta_list);
        $this->assign('data_list', $data_list[$channel]);
        $this->display();
    }

    private function get_event_meta()
    {
        $event_meta_list = array(
            array("screen_name" => "UV", "item_name" => "index_uv", "type" => 'uv',),
            array("screen_name" => "PV", "item_name" => "index_pv", "type" => 'pv',),


        );


        foreach ($event_meta_list as &$item) {
            if (empty($item['item_name'])) {
                if ($item['condition']['category'] == "system") {
                    $item['item_name'] = $item['condition']["event_action"];
                } else {
                    $arr = array();
                    if (!empty($item['event_value'])) {
                        $arr[] = $item['category'];
                        $arr[] = $item['event_action'];
                        $arr[] = $item['event_name'];
                        $arr[] = $item['event_value'];
                    } elseif (!empty($item['event_name'])) {
                        $arr[] = $item['category'];
                        $arr[] = $item['event_action'];
                        $arr[] = $item['event_name'];
                    } elseif (!empty($item['event_action'])) {
                        $arr[] = $item['category'];
                        $arr[] = $item['event_action'];
                    } elseif (!empty($item['category'])) {
                        $arr[] = $item['category'];
                    } else {
                        continue;
                    }
                    $item_name = join('$', $arr);
                    if ($item['type'] == 'pv') {
                        $item_name .= '$__pv__';
                    } else {
                        $item_name .= '$__uv__';
                    }
                    $item['item_name'] = $item_name;
                }
            }
        }
        unset($item);
        return $event_meta_list;
    }
}