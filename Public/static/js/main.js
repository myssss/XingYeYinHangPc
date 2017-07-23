/**
 * Created by admin on 2017/3/13.
 */
function getQueryString(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
    var r = window.location.search.substr(1).match(reg);
    if (r != null) return unescape(r[2]); return null;
}
$(function () {

    var src = getQueryString('src');
    if (src && src>0) {
        $('html, body').animate({
            scrollTop: $("." + "news"+ src +"-block").offset().top
        }, 500);
    }

    $('.right-bar .list li, .news3-block ul li, .info .left-holder p, .more, .more-red').on('click', function(){
        console.log('click');
        if($(this).data('href')){
            location.href= $(this).data('href');
        }
    });

    $('#road_modal').on('show.bs.modal', function (event) {
        console.log('guang');
        var button = $(event.relatedTarget) // Button that triggered the modal
        var recipient = button.data('link') // Extract info from data-* attributes
        var modal = $(this)
        modal.find('.pic')[0].src= recipient;
    });

    $('#future_modal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget) // Button that triggered the modal
        var recipient = button.data('content') // Extract info from data-* attributes
        var title = button.data('title');
        var time = button.data('time');
        console.log(title);
        var modal = $(this);
        modal.find('.modal-body').html(recipient);
        modal.find('.modal-title').html(title);
        modal.find('.modal-time').html(time);
    });
    $('.nav .item').on('click', function () {
        var target = $(this).data('scroll');
        if (target) {
            $('html, body').animate({
                scrollTop: $("." + target).offset().top
            }, 500);
        }
    });

    $('.nav .item').on('click', function () {
        console.log('1111111');
        if($(this).data('href')){
            location.href= $(this).data('href');
        }
    });

    $('#video_modal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget) // Button that triggered the modal
        var recipient = button.data('video') // Extract info from data-* attributes
        console.log(recipient)
        var modal = $(this).find('video')[0];
        modal.src=recipient;
        modal.play();
    });

    $('#video_modal').on('hide.bs.modal', function (event) {
        var modal = $(this).find('video')[0];
        modal.pause();
    });

    $('.list-hd p').on('click', function(){
        if($(this).data('href')){
            location.href= $(this).data('href');
        }
    });
    var roadSwiper;
    $('.road-block .item').on('click', function () {
        var id = $(this).data('id');
        $('.choose').hide();
        $('.choose' + id).show();
        console.log(id);
        if (id == 2 && !roadSwiper)  {
            roadSwiper = new Swiper('.choose-swiper', {
                paginationClickable: true,
                nextButton: '.btn-next',
                prevButton: '.btn-pre',
                effect: 'fade'
            });
        }
    })
    var swiper = new Swiper('.l-swiper', {
        pagination: '.swiper-pagination',
        paginationClickable: true,
        autoplay : 4000,
    });

    var mswiper = new Swiper('.s-swiper', {
        pagination: '.swiper-pagination',
        paginationClickable: true,
        autoplay : 4000,
    });

    var mswiper = new Swiper('.c-swiper', {
        autoplay : 3000,
    });

});