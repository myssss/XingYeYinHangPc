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
        <h1>{:$lesson.lesson_name}</h1>
    </div>
    <div class="panel-body">
        <div class="table-responsive">
            <table class="table table-striped table-bordered" id="users_table">
                <thead>
                <tr>
                    <th width="8%">id</th>
                    <th width="5%">姓名</th>
                    <th width="5%">手机号码</th>
                    <th width="10%">奖品名字</th>
                    <th width="20%">时间</th>
                </tr>
                </thead>
                <tbody>
                {:foreach from=$list item="item" name="list"}
                <tr>
                    <td class="vertical-mid">
                        {:$item.id|escape}
                    </td>
                    <td class="vertical-mid">
                        {:$item.name|escape}
                    </td>
                    <td class="vertical-mid">
                        {:$item.tel|escape}
                    </td>
                    <td class="vertical-mid">
                        {:$item.prize_name|escape}
                    </td>

                    <td class="vertical-mid">
                        {:$item.take_time|date_format:'Y-m-d H:i:s'}
                    </td>

                </tr>
                {:foreachelse}
                <td colspan="7" class="text-center">暂无</td>
                {:/foreach}
                </tbody>
            </table>
        </div>
    </div>
</div>


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
        var table = $('#users_table').DataTable({
            'bSort': false,
            "pagingType": "full_numbers",
            lengthChange: false,
            buttons: ['excel', 'csv'],

            "bLengthChange": false,
            "iDisplayLength": 15,
            'language': {
                "sProcessing": "处理中...",
                "sLengthMenu": "显示 _MENU_ 项结果",
                "sZeroRecords": "没有匹配结果",
                "sInfo": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
                "sInfoEmpty": "显示第 0 至 0 项结果，共 0 项",
                "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
                "sInfoPostFix": "",
                "sSearch": "搜索:",
                "sUrl": "",
                "sEmptyTable": "表中数据为空",
                "sLoadingRecords": "载入中...",
                "sInfoThousands": ",",
                "oPaginate": {
                    "sFirst": "首页",
                    "sPrevious": "上页",
                    "sNext": "下页",
                    "sLast": "末页"
                },
                "oAria": {
                    "sSortAscending": ": 以升序排列此列",
                    "sSortDescending": ": 以降序排列此列"
                }
            }
        });
        table.buttons().container().appendTo('#users_table_wrapper .col-md-6:eq(0)');

        jQuery("select").chosen({
            'min-width': '100px',
            'white-space': 'nowrap',
            disable_search_threshold: 10
        });
    });
</script>
{:/block}