<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2014 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

if(version_compare(PHP_VERSION,'5.3.0','<'))  die('require PHP > 5.3.0 !');

define('WEB_ROOT_PATH', realpath(dirname(__FILE__)));
define('DS', DIRECTORY_SEPARATOR);
define('APP_BASE_URL', 'http://' . $_SERVER['HTTP_HOST']);
define('APP_PATH', 'Application/');
define('RUNTIME_PATH', WEB_ROOT_PATH . '/Runtime/');
define('DATA_PATH', WEB_ROOT_PATH . '/Data/');
define('THINK_PATH', WEB_ROOT_PATH . '/../framework/ThinkPHP_3.2.h/');
define('APP_DEBUG', true); // @readme <-- 上线后修改这里
// 引入ThinkPHP入口文件
require THINK_PATH. '/ThinkPHP.php';
