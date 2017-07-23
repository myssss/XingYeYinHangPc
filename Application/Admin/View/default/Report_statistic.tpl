{:extends file="groupuser_layout.tpl"}
{:block name="header_css" append}
    <link rel="stylesheet" href="/Public/static/admin/lib/DataTables-1.10.12/media/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="/Public/static/admin/lib/DataTables-1.10.12/extensions/Buttons/css/buttons.bootstrap4.css">
{:/block}
{:block name="content_title"}
{:/block}
{:block name="content_breadcrumb"}
    首页
{:/block}
{:block name="content_body"}
    <div class="panel panel-default">
        <div class="panel-heading">
        </div>
        <div class="panel-body">
            <div class="table-responsive">
                <table class="table table-striped table-bordered" id="users_table">
                        <thead>
                        <tr>
                            <th>日期</th>
                            {:foreach from=$event_meta_list item=event_config}
                                <th>{:$event_config['screen_name']|escape}</th>
                            {:/foreach}
                        </tr>
                        </thead>
                        <tbody class="text-left">
                        {:foreach from=$data_list item=data}
                            <tr>
                                <td>{:$data['date']}</td>
                                {:foreach from=$event_meta_list item=event_config}
                                    <td>
                                        {:$data[$event_config['item_name']]|default:0}
                                    </td>
                                {:/foreach}
                            </tr>
                        {:/foreach}
                        </tbody>
                </table>
            </div>
        </div>
    </div>
{:/block}
{:block name="body_js" append}
    <script type="text/javascript" language="javascript" src="/Public/static/admin/lib/DataTables-1.10.12/media/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" language="javascript" src="/Public/static/admin/lib/DataTables-1.10.12/media/js/dataTables.bootstrap4.min.js"></script>
    <script type="text/javascript" language="javascript" src="/Public/static/admin/lib/DataTables-1.10.12/extensions/Buttons/js/dataTables.buttons.min.js"></script>
    <script type="text/javascript" language="javascript" src="/Public/static/admin/lib/DataTables-1.10.12/extensions/Buttons/js/buttons.bootstrap4.min.js"></script>

    <script type="text/javascript" language="javascript" src="//cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"></script>
    <script type="text/javascript" language="javascript" src="//cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/pdfmake.min.js"></script>
    <script type="text/javascript" language="javascript" src="//cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/vfs_fonts.js"></script>


    <script type="text/javascript" language="javascript" src="/Public/static/admin/lib/DataTables-1.10.12/extensions/Buttons/js/buttons.html5.min.js"></script>
    <script type="text/javascript" language="javascript" src="/Public/static/admin/lib/DataTables-1.10.12/extensions/Buttons/js/buttons.print.min.js"></script>
    <script type="text/javascript" language="javascript" src="/Public/static/admin/lib/DataTables-1.10.12/extensions/Buttons/js/buttons.colVis.min.js"></script>

    <script>
        $(document).ready(function() {
            var table = $('#users_table').DataTable({
                'bSort': false,
                "pagingType":   "full_numbers",
                lengthChange: false,
                buttons: ['excel', 'csv' ],
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
            table.buttons().container().appendTo( '#users_table_wrapper .col-md-6:eq(0)' );

            jQuery("select").chosen({
                'min-width': '100px',
                'white-space': 'nowrap',
                disable_search_threshold: 10
            });
        });
    </script>
{:/block}