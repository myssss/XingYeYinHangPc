<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="__CDN__/admin/images/favicon.ico" type="image/png">
    <title>{:block name=title}{:C('SITE_TITLE')}{:/block}</title>

    {:block name=header_css}
        <link href="__CDN__/admin/css/style.default.css" rel="stylesheet">
        <link href="__CDN__/admin/css/jquery.gritter.css" rel="stylesheet">
    {:/block}

    {:block name=header_js}
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="__CDN__/admin/js/html5shiv.js"></script>
    <script src="__CDN__/admin/js/respond.min.js"></script>
    <![endif]-->
    {:/block}
</head>

<body id="{:block name="page_id"}{:/block}">

<!-- Preloader -->
<div id="preloader">
    <div id="status"><i class="fa fa-spinner fa-spin"></i></div>
</div>

<section>
    <div class="leftpanel">
        <div class="logopanel">
            <h1><span>[</span>周大虾<span>]</span></h1>
        </div><!-- logopanel -->

        <div class="leftpanelinner">
            <h5 class="sidebartitle">Navigation</h5>
            <ul class="nav nav-pills nav-stacked nav-bracket">

                {:foreach from=$menu item=item}
                    <li class='{:$item.active_class} {:if $item.auth_level == 0}nav-parent{:/if} {:if $item.active_class == 'active' && $item.auth_level == 0} nav-active {:/if}'>
                        <a href="{:$smarty.const.__MODULE__}/{:$item.auth_c}/{:$item.auth_a}">
                            <span>{:$item.auth_name}</span>
                        </a>
                        {:if count($item.children) > 0}
                            <ul class="children" style="display: {:if $item.active_class === 'active'} block {:/if};">
                                {:foreach from=$item['children'] item=v}
                                <li class="{:$v.active_class}"><a href="{:$smarty.const.__MODULE__}/{:$v.auth_c}/{:$v.auth_a}">{:$v.auth_name}</a></li>
                                {:/foreach}
                            </ul>
                        {:/if}
                    </li>
                {:/foreach}
            </ul>
        </div>
        <!-- leftpanelinner -->
    </div><!-- leftpanel -->

    <div class="mainpanel">
        <div class="headerbar">
            <a class="menutoggle"><i class="fa fa-bars"></i></a>
            <div class="header-right">
                <ul class="headermenu">
                    <li>
                        <div class="btn-group">
                            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                                <img src="__CDN__/admin/images/photos/loggeduser.png" alt="" />
                                Admin
                                <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu dropdown-menu-usermenu pull-right">
                                <li><a href="#"><i class="glyphicon glyphicon-log-out"></i>修改密码</a></li>
                                <li><a href="#"><i class="glyphicon glyphicon-log-out"></i>退出</a></li>
                            </ul>
                        </div>
                    </li>
                </ul>
            </div><!-- header-right -->
        </div>
        <!-- headerbar -->
        <div class="pageheader" style="display: none;">
            <h2><i class="fa fa-pencil"></i>{:block name="content_breadcrumb"}{:/block}</h2>
            <div class="breadcrumb-wrapper">
                <span class="label">You are here:</span>
                <ol class="breadcrumb">
                    <li><a href="index.html">Bracket</a></li>
                    <li><a href="general-forms.html">Forms</a></li>
                    <li class="active">Form Layouts</li>
                </ol>
            </div>
        </div>

        <div class="contentpanel" id="js-content-body">
            {:block name="content_body"}{:/block}
        </div><!-- contentpanel -->
    </div><!-- mainpanel -->
</section>

{:block name="body_js"}

<script src="__CDN__/admin/js/jquery-1.10.2.min.js"></script>
<script src="__CDN__/admin/js/jquery-migrate-1.2.1.min.js"></script>
<script src="__CDN__/admin/js/jquery-ui-1.10.3.min.js"></script>
<script src="__CDN__/admin/js/bootstrap.min.js"></script>
<script src="__CDN__/admin/js/modernizr.min.js"></script>
<script src="__CDN__/admin/js/jquery.sparkline.min.js"></script>
<script src="__CDN__/admin/js/toggles.min.js"></script>
<script src="__CDN__/admin/js/retina.min.js"></script>
<script src="__CDN__/admin/js/jquery.cookies.js"></script>

<script src="__CDN__/admin/js/flot/flot.min.js"></script>
<script src="__CDN__/admin/js/flot/flot.resize.min.js"></script>
<script src="__CDN__/admin/js/morris.min.js"></script>
<script src="__CDN__/admin/js/raphael-2.1.0.min.js"></script>
<script src="__CDN__/admin/js/chosen.jquery.min.js"></script>

<script src="__CDN__/admin/js/custom.js"></script>
{:/block}
</body>
</html>