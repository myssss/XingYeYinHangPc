<?php

return array(
    // 额外配置文件
    'LOAD_EXT_CONFIG' => 'db,route',

    // cookie签名使用,防止用户伪造
    'COOKIE_SIGN' => 'your_cookie_sign_used_in_singed_cookie',

    // 微信授权，通过key、token调用智达接口并验证智达返回数据
    'AUTH_SUPPORT_FAKE_OPENID' => true,
    'AUTH_APP_ID' => 'wxdd96fef9dd93a941',
    'AUTH_CLIENT_ID' => 'zhida_app',
    'AUTH_CLIENT_PASSWORD' => 'izhida',
    /* CDN路径配置。配置之后可以在模版文件中使用__CDN__ */
//    '__CDN__' => 'https://static3.izhida.cn/cdn1/benz-film/v1.0.0',
    '__CDN__' => '/Public/static', // @readme <-- 上线时修改这里
    'URL_MODEL' => 3,
    'STORAGE_PATH' => WEB_ROOT_PATH . '/Data/Storage',
    'DEFAULT_FILTER' => '', // 默认参数过滤方法 用于I函数...。注意这块不能修改！！！！
    'MODULE_ALLOW_LIST' => array('Home', 'Cli', 'Api', 'Admin'),
    'SHOW_PAGE_TRACE' => false,
    'ERROR_PAGE' =>'/50x.html',

    'SITE_URL' => 'https://' . (isset($_SERVER['HTTP_HOST']) ? $_SERVER['HTTP_HOST'] : 'moli.gnhj.izhida.cn'),
    'PUBLISH_MODE' => 'development', // development,test,production



    'UPLOAD_SITEIMG_QINIU' => array(
        'maxSize' => 5 * 1024 * 1024,//文件大小
        'rootPath' => './',
        'saveName' => array('uniqid', ''),
        'driver' => 'Qiniu',
        'driverConfig' => array(
            'accessKey' => 'ggMPohY9_87Q69nDYUMwvR7XqlLYAREH-btbJG3U',
            'secrectKey' => 'OPzIqCWVMDs7tAYjPi9Hn7JkxBj2CtHARCCEnrdd',
            'domain' => '7xou29.media1.z0.glb.clouddn.com',
            'bucket' => 'zhida-stream',
//            'domain' => '7xjtzd.com2.z0.glb.qiniucdn.com',
//            'bucket' => 'zhida-yingxiaoyi',
        ),
    ),
);