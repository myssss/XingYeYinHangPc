<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="imagetoolbar" content="no">
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    {:assign var=projectId value=0}
    {:assign var=rem value=false}
    {:block name='projectx'}{:/block}
    {:if $rem == true}
    <meta name="viewport" content="width=device-width, minimum-scale=1, maximum-scale=1, user-scalable=no">
    <script>
        (function (doc, win) {
            var docEl = doc.documentElement,
                resizeEvt = 'orientationchange' in window ? 'orientationchange' : 'resize',
                recalc = function () {
                    window.clientWidth = docEl.clientWidth;
                    if (!window.clientWidth) return;
                    docEl.style.fontSize = 20 * (window.clientWidth / 640) + 'px';
                    window.base = 20 * (window.clientWidth / 640);
                };
            recalc();
            // Abort if browser does not support addEventListener
            if (!doc.addEventListener) return;
            win.addEventListener(resizeEvt, recalc, false);
            doc.addEventListener('DOMContentLoaded', recalc, false);
        })(document, window);
    </script>
    {:else}
    <script>
        if (/Android (\d+\.\d+)/.test(navigator.userAgent)) {
            var version = parseFloat(RegExp.$1);
            if (version > 2.3) {
                var phoneScale = parseInt(window.screen.width) / 640;
                document.write('<meta name="viewport" content="width=640, minimum-scale = ' + phoneScale + ', maximum-scale = ' + phoneScale + ', target-densitydpi=device-dpi">');
            } else {
                document.write('<meta name="viewport" content="width=640, target-densitydpi=device-dpi">');
            }
        } else {
            document.write('<meta name="viewport" content="width=640, user-scalable=no, target-densitydpi=device-dpi">');
        }
    </script>
    {:/if}
    <script>
        //判断访问终端
        var browser = {
            versions: function () {
                var u = navigator.userAgent, app = navigator.appVersion;
                return {
                    trident: u.indexOf('Trident') > -1, //IE内核
                    presto: u.indexOf('Presto') > -1, //opera内核
                    webKit: u.indexOf('AppleWebKit') > -1, //苹果、谷歌内核
                    gecko: u.indexOf('Gecko') > -1 && u.indexOf('KHTML') == -1,//火狐内核
                    mobile: !!u.match(/AppleWebKit.*Mobile.*/), //是否为移动终端
                    ios: !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/), //ios终端
                    android: u.indexOf('Android') > -1 || u.indexOf('Adr') > -1, //android终端
                    iPhone: u.indexOf('iPhone') > -1, //是否为iPhone或者QQHD浏览器
                    iPad: u.indexOf('iPad') > -1, //是否iPad
                    webApp: u.indexOf('Safari') == -1, //是否web应该程序，没有头部与底部
                    weixin: u.indexOf('MicroMessenger') > -1, //是否微信 （2015-01-22新增）
                    qq: u.match(/\sQQ/i) == " qq" //是否QQ
                };
            }(),
            language: (navigator.browserLanguage || navigator.language).toLowerCase()
        }
    </script>
    <title>{:block name='title'}{:/block}</title>
    {:if $projectId &&  strpos( $smarty.server.HTTP_HOST , 'dev.izhida.cn') !== false}
    <link rel="stylesheet" type="text/css" href="https://projectx.dev.izhida.cn/api/css/rem/{:$rem}/id/{:$projectId}"
          media="all"/>
    {:else}

    <link rel="stylesheet" type="text/css" href="__CDN__/css/main.min.css" media="all"/>
    {:/if}
    {:block name='css'}{:/block}
    <link rel="stylesheet" type="text/css" href="__CDN__/css/animate.min.css" media="all"/>
    <link rel="stylesheet" type="text/css" href="__CDN__/css/notify.css" media="all"/>
    <link rel="stylesheet" type="text/css" href="__CDN__/css/index.css" media="all"/>

</head>
<body>

{:*<audio src="__CDN__/audio/bg.MP3" autoplay loop preload="auto" id="bg" style="display: none"></audio>*}
{:if $projectId &&  strpos( $smarty.server.HTTP_HOST , 'dev.izhida.cn') !== false}
{:"https://projectx.dev.izhida.cn/api/html/id/`$projectId`"|file_get_contents}
{:else}
{:block name='body'}{:/block}
{:/if}

<script>
    window.base_resource_url = '__CDN__';


    var link = location.origin;
    var friend_title = '梅赛德斯-奔驰C级车与你共赏佳片';
    var friend_desc = '成就人生主角 夏日观影放送';
    var timeline_desc = '奔驰C-class携5月佳片强势来袭，参与互动赢取影票！';
    window.wxFriendData = {
        'link': link,
        'imgUrl': link + '/Public/static/images2/share.jpg',
        'title': friend_title,
        'desc': friend_desc,
        success: function () {
        }
    };
    window.wxTimelineData = {
        'link': link,
        'imgUrl': link + '/Public/static/images2/share.jpg',
        'title': timeline_desc,
        success: function () {
        }
    };
</script>
<script type="text/javascript"
        src="https://api2.izhida.cn/wechat_js_config?app_id=wx4c3c856ab83a946b&v=1.2.1&api_list=all&app_stat_key=nfQGJdpEFtNPMStJ"></script>
<script src="__CDN__/js/jquery-2.1.3.min.js"></script>
<script src="__CDN__/js/jquery-notify.min.js"></script>
<script src="__CDN__/js/toe.min.js"></script>
{:block name='js'}{:/block}
<script src="__CDN__/js/common.js"></script>
<script>
    window.wx && wx.ready(function () {
        wx.onMenuShareAppMessage(wxFriendData);
        wx.onMenuShareTimeline(wxTimelineData);
    });
</script>

</body>
</html>