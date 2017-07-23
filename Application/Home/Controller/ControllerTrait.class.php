<?php
namespace Home\Controller;

use Think\Log;
use SignedCookie;
use Zhida\OAuthHelperV3;

trait ControllerTrait
{
    protected function get_user_info_from_cookie()
    {
        $cookie_secret = C('cookie_sign');
        $openid = \SignedCookie::get_cookie($this->cookie_uid_key, $cookie_secret, 86400 * 60);
        if (!$openid) {
            return false;
        }

        $user = M('User')->where(array('openid' => $openid))->find();
        return $user;
    }

    protected function  request_auth($redirect_url = '/')
    {
        $app_id = C('auth_app_id');
        $client_id = C('auth_client_id');
        $client_password = C('auth_client_password');
        $support_fake_openid = C('AUTH_SUPPORT_FAKE_OPENID') ? '1' : '';
        $helper = new OAuthHelperV3($app_id, $client_id, $client_password, $support_fake_openid);
        $site_url = C('SITE_URL');
        if (!$site_url) {
            $sys_protocal = isset($_SERVER['SERVER_PORT']) && $_SERVER['SERVER_PORT'] == '443' ? 'https://' : 'http://';
            $site_url = $sys_protocal . $_SERVER['HTTP_HOST'];
        }
        $callback_url = "{$site_url}/auth";
        $state = 1;
        SignedCookie::set_cookie("redirect_back", $redirect_url, C('cookie_sign'), 86400 * 60);
        $auth_url = $helper->auth_url($callback_url, $this->auth_type, $state);
//        dump($auth_url);
//        dump($callback_url);
//        die();
        redirect($auth_url);
        exit(0);
    }

    protected function get_url()
    {
        $sys_protocal = isset($_SERVER['SERVER_PORT']) && $_SERVER['SERVER_PORT'] == '443' ? 'https://' : 'http://';
        $php_self = $_SERVER['PHP_SELF'] ? $_SERVER['PHP_SELF'] : $_SERVER['SCRIPT_NAME'];
        $path_info = isset($_SERVER['PATH_INFO']) ? $_SERVER['PATH_INFO'] : '';
        $relate_url = isset($_SERVER['REQUEST_URI']) ? $_SERVER['REQUEST_URI'] : $php_self . (isset($_SERVER['QUERY_STRING']) ? '?' . $_SERVER['QUERY_STRING'] : $path_info);
        return $sys_protocal . (isset($_SERVER['HTTP_HOST']) ? $_SERVER['HTTP_HOST'] : '') . $relate_url;
    }

    public function auth()
    {
        //如果是分享出去的链接，重新授权
        if (!empty($_GET['from'])) {
            $this->request_auth();
            exit(0);
        }

        $app_id = C('auth_app_id');
        $client_id = C('auth_client_id');
        $client_password = C('auth_client_password');
        $support_fake_openid = C('AUTH_SUPPORT_FAKE_OPENID') ? '1' : '';
        $helper = new OAuthHelperV3($app_id, $client_id, $client_password, $support_fake_openid);

        $check = $helper->check_callback_param_signature($_GET);
        if (!$check) {
            exit('auth failed');
        }
        $data = $helper->callback_data($_GET);
        if (!$data['openid']) {
            exit('auth failed');
        }
        $openid = $data['openid'];
        $access_token = $data['access_token'];
        if ($this->auth_type == OAuthHelperV3::SCOPE_BASE) {
            $user = array(
                'openid' => $openid,
                'access_token' => $access_token
            );
        } else {
//            $user = $data['user'];
            unset($data['privilege']);
            $user = array();
            $user['openid'] = $data['user']['openid'];
            $user['access_token'] = $data['access_token'];
            $user['nickname'] = $data['user']['nickname'];
            $user['headimgurl'] = preg_replace('@(/0)$@', '/132', $data['user']['headimgurl']);
            $user['info'] = json_encode($data);
        }
        SignedCookie::set_cookie($this->cookie_uid_key, $openid, C('cookie_sign'), 86400 * 60);
        $old_user = M('User')->where(array('openid' => $openid))->find();
        if ($old_user) {
            M('User')->token(false)->where(array(
                'openid' => $openid,
                'info'=>$user['info']
            ))->save($user);
        } else {
            $user['expired_at'] = $_SERVER['REQUEST_TIME'];
            $user['reg_ip'] = $this->getIP();
            $user['last_visit'] = time();
            $user['last_ip'] = $this->getIP();
            $user['created_at']= time();
            M('User')->token(false)->add($user);
        }
        $_SESSION['is_wechat'] = 1;
        $_SESSION['openid'] = $openid;
        if ($data['state'] == 1) {
            $redirect_url = SignedCookie::get_cookie("redirect_back", C('cookie_sign'), 86400 * 60);
            if (empty($redirect_url)) {
                redirect("/");
                exit(0);
            }
            cookie("redirect_back", null);
            redirect($redirect_url);
            exit(0);
        }
        cookie("redirect_back", null);
        redirect("/");
        exit(0);
    }

    protected function log_user_action($user_id, $action_name,
                                       $action_value_str,
                                       $action_value_int = null)
    {
        M('UserActionLog')->add(array(
            'user_id' => $user_id,
            'action_name' => $action_name,
            'action_key' => hexdec(substr(md5($action_name), 0, 15)),
            'action_value_str' => $action_value_str,
            'action_value_int' => $action_value_int,
        ));
    }
    function getIP()
    {
        if (isSet($_SERVER)) {
            if (isSet($_SERVER["HTTP_X_FORWARDED_FOR"])) {
                $realip = $_SERVER["HTTP_X_FORWARDED_FOR"];
            } elseif (isSet($_SERVER["HTTP_CLIENT_IP"])) {
                $realip = $_SERVER["HTTP_CLIENT_IP"];
            } else {
                $realip = $_SERVER["REMOTE_ADDR"];
            }
        } else {
            if (getenv('HTTP_X_FORWARDED_FOR')) {
                $realip = getenv('HTTP_X_FORWARDED_FOR');
            } elseif (getenv('HTTP_CLIENT_IP')) {
                $realip = getenv('HTTP_CLIENT_IP');
            } else {
                $realip = getenv('REMOTE_ADDR');
            }
        }
        return current(explode(',', $realip));
    }

    function isWeixin()
    {
        //return true;
        if (strpos($_SERVER['HTTP_USER_AGENT'], 'MicroMessenger') !== false) {
            return true;
        }
        return false;
    }
    public function debug_open()
    {
        session('X-DEBUG', 1);
        echo 'success';
        redirect("/");
    }

    public function debug_close()
    {
        session('X-DEBUG', null);
        echo 'success';
    }

    public function test_magic()
    {
        cookie('X-PUB_MODE', 'development');
        redirect("/");
    }
}