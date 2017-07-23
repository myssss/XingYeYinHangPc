{:extends file="groupuser_layout.tpl"}
{:block name="header_css" append}
    <link rel="stylesheet" href="/Public/static/admin/lib/DataTables-1.10.12/media/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet"
          href="/Public/static/admin/lib/DataTables-1.10.12/extensions/Buttons/css/buttons.bootstrap4.css">
    <link rel="stylesheet"
          href="/Public/static/admin/lib/DataTables-1.10.12/extensions/Select/css/select.dataTables.min.css">
    <link rel="stylesheet"
          href="/Public/static/admin/lib/DataTables-1.10.12/extensions/RowReorder/css/rowReorder.dataTables.min.css">
    <style>

    </style>
{:/block}
{:block name="content_title"}
{:/block}
{:block name="content_breadcrumb"}
    首页
{:/block}
{:block name="content_body"}
    <div class="panel panel-default">
        <div class="panel-heading">
            <button class="btn btn-default btn-add">添加</button>
        </div>
        <div class="panel-body">
            <form class="form-horizontal form-bordered" id="addForm" method="post"
                  action="{:$smarty.const.__MODULE__}/banner/bannerAdd">
                <div class="input-holder">
                    {:foreach $list as $item}
                    <div class="row" data-id="{:$item['id']}">
                        <div class="col-sm-5">
                            <div class="form-group">
                                <div class="col-md-11 ke_image_upload">
                                    <div class="input-group">
                                        <input type="text" class="video_url ke_image_upload_input form-control"
                                               style="padding: 8px;"
                                               readonly
                                               data-msg-required="分享图片不能为空"
                                               name="banner[{:$item@iteration}][pic]"
                                               value="{:$item['pic']}"/>
                                        <span class="input-group-btn">
                                                <button type="button" class="js-btn_qiniu_upload qiniu btn btn-default">上传</button>
                                            </span>
                                    </div>
                                    <div class="input-group">
                                        <label id="" class="error" for=""
                                               style="display: none;">请上传图片</label>
                                    </div>
                                    <div class="input-group">
                                        <img src="" alt=""
                                             style="{display: none;width: 120px; height: 120px;margin-top: 10px;}"
                                             class="ke_image_preview">
                                    </div>
                                    <div class="input-group">
                                        <span>建议尺寸：640像素 * 670像素;</span>
                                    </div>
                                </div>
                            </div>
                        </div><!-- col-sm-6 -->
                        <div class="col-sm-3">
                            <div class="form-group">
                                <input type="text" placeholder="输入活动链接" value="{:$item['url']}" name="banner[{:$item@iteration}][url]" class="form-control">
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <div class="form-group">
                                <input type="text" placeholder="优先级" value="{:$item['rank']}" name="banner[{:$item@iteration}][rank]" class="form-control">
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <button type="button" class="btn btn-default btn-delete" style="margin-top: 16px;">删除</button>
                        </div>
                    </div>
                {:/foreach}
            </div>

                <div class="form-group ml30" style="margin-left: 20px;padding: 30px">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                    <button type="submit" class="btn btn-primary">提交</button>
                </div>
        </form>
    </div>
    <div class="modal fade" id="confirmModel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title">警告</h4>
                </div>
                <div class="modal-body">
                    <p>确定要删除吗?</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" id="confirm_btn_certain">确定</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->

{:/block}
{:block name="body_js" append}
    <script type="text/javascript" language="javascript"
            src="/Public/static/admin/lib/DataTables-1.10.12/media/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" language="javascript"
            src="/Public/static/admin/lib/DataTables-1.10.12/media/js/dataTables.bootstrap4.min.js"></script>
    <script type="text/javascript" language="javascript"
            src="/Public/static/admin/lib/DataTables-1.10.12/extensions/Buttons/js/dataTables.buttons.min.js"></script>
    <script type="text/javascript" language="javascript"
            src="/Public/static/admin/lib/DataTables-1.10.12/extensions/Buttons/js/buttons.bootstrap4.min.js"></script>
    <script type="text/javascript" language="javascript"
            src="/Public/static/admin/lib/DataTables-1.10.12/extensions/Select/js/dataTables.select.min.js"></script>
    <script type="text/javascript" language="javascript"
            src="/Public/static/admin/lib/DataTables-1.10.12/extensions/Buttons/js/buttons.html5.min.js"></script>
    <script type="text/javascript" language="javascript"
            src="/Public/static/admin/lib/DataTables-1.10.12/extensions/Buttons/js/buttons.print.min.js"></script>
    <script type="text/javascript" language="javascript"
            src="/Public/static/admin/lib/DataTables-1.10.12/extensions/Buttons/js/buttons.colVis.min.js"></script>
    <script type="text/javascript" language="javascript"
            src="/Public/static/admin/lib/DataTables-1.10.12/extensions/RowReorder/js/dataTables.rowReorder.min.js"></script>
    <script type="text/javascript" language="javascript"
            src="/Public/static/admin/js/validator.js"></script>
    <script type="text/javascript" language="javascript"
            src="/Public/static/admin/lib/plupload-2.1.9/js/plupload.full.min.js"></script>
    <script type="text/javascript" language="javascript"
            src="/Public/static/admin/lib/qiniu/dist/qiniu.min.js"></script>
    <script src="http://cdn.bootcss.com/json2/20150503/json2.min.js"></script>
    <script>
        $(document).ready(function () {
            $('.btn-add').on('click', function () {
                var count = $('#addForm .row').length + 1;
                $('.input-holder').append('<div class="row">' +
                    '<div class="col-sm-5">' +
                    '<div class="form-group">' +
                    '<div class="col-md-11 ke_image_upload">' +
                    '<div class="input-group">' +
                    '<input type="text" class="video_url ke_image_upload_input form-control"' +
                    'style="padding: 8px;"' +
                    'readonly' +
                    'data-msg-required="分享图片不能为空"' +
                    'name="banner[' + count + '][pic]"' +
                    'value=""/>' +
                    '<span class="input-group-btn">' +
                    '<button type="button" class="js-btn_qiniu_upload qiniu btn btn-default">上传</button>' +
                    '</span>' +
                    '</div>' +
                    '<div class="input-group">' +
                    '<label id="" class="error" for=""' +
                    'style="display: none;">请上传图片</label>' +
                    '</div>' +
                    '<div class="input-group">' +
                    '<img src="" alt=""' +
                    'style="{display: none;width: 120px; height: 120px;margin-top: 10px;}"' +
                    'class="ke_image_preview">' +
                    '</div>' +
                    '<div class="input-group">' +
                    '<span>建议尺寸640像素 * 670像素;</span>' +
                    '</div>' +
                    '</div>' +
                    '</div>' +
                    '</div><!-- col-sm-6 -->' +
                    '<div class="col-sm-3">' +

                    '<div class="form-group">' +
                    '<input type="text" placeholder="输入活动链接" name="banner[' + count + '][url]" class="form-control">' +
                    '</div>' +
                    '</div>' +
                        '<div class="col-sm-2">'+
                            '<div class="form-group">'+
                                '<input type="text" placeholder="优先级" value="100" name="banner[' + count + '][rank]" class="form-control">'+
                        '</div>'+
                    '</div>'+
                    '</div>'
                    );
                qiniuupdate();
            });
            var row = null;
            $('#addForm').on('click', '.btn-delete', function () {
                $('#confirmModel').modal();
                row = $(this).closest('.row');
            });
            $('#confirm_btn_certain').on('click', function () {
                var id = $(row).data('id');
                if (id > 0) {
                    window.location.href = '/Admin/Banner/delete/id/' + id;
                }
            });
            qiniuupdate();
            function qiniuupdate() {
                var uploader = {};
                $.each($('.qiniu'), function (index, val) {
                    var oldText;
                    uploader[index] = Qiniu.uploader({
                        untimes: 'html5,flash,html4',
                        browse_button: val,
                        get_new_uptoken: false,
                        domain: 'http://tofax-salesman-cdn.izhida.cn/',
                        uptoken_url: '{:U('/Admin/Product/getToken')}',
                        container: $(val).parent().get(0),
                        max_file_size: '300mb',
                        flash_swf_url: 'http://cdn.bootcss.com/plupload/2.1.9/Moxie.swf',
                        max_retries: 3,
                        unique_names: true,
                        dragdrop: false,
                        multi_selection: false,
                        drop_element: $(val).parent().get(0),
                        chunk_size: '4mb',
                        auto_start: true,
                        filters: {
                            max_file_size: '300mb',
                            prevent_duplicates: true,
                            mime_types: [
                                {title: "Image files", extensions: "jpg,gif,png"}, // 限定jpg,gif,png后缀上传
                            ]
                        },
                        init: {
                            'UploadProgress': function (up, file) {
                                percentage = parseInt(file.percent, 10);
                                if (file.status !== plupload.DONE && percentage === 100) {
                                    percentage = 99;
                                }
                                var formatSpeed = plupload.formatSize(file.speed).toUpperCase();
                                $(val).addClass('disabled').text(percentage + '%');
                                // $('.progress .progress-bar').attr('aria-valuenow', percentage).css('width', percentage + '%');
                                // $('.progress .progress-bar').text( percentage + '% Complete Speed:'+formatSpeed + '/s' );
                            },
                            'BeforeUpload': function (up, file) {
                                if ($(val).hasClass('disabled')) {
                                    return false;
                                }
                                oldText = $(val).text();

                                // $('.progress .progress-bar').attr('aria-valuenow', 0).css('width', '0');
                                // $('.progress .progress-bar').text('');
                                // $('.progress').show();
                            },
                            'FileUploaded': function (up, file, info) {
                                var res = $.parseJSON(info);
                                var domain = up.getOption('domain');
                                url = domain + encodeURI(res.key);
                                console.log(val);
                                console.log(url);
                                $(val).closest('.input-group').find('.video_url').val(url);
                                //$('#videos-url').val(url);
                            },
                            'Error': function (up, err, errTip) {
                                alert(errTip);
                            },
                            'UploadComplete': function () {
                                setTimeout(function () {
                                    $(val).removeClass('disabled').text(oldText);
                                }, 100);
                            }
                        }
                    });
                });

            }
        });
    </script>
{:/block}