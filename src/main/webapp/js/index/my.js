// 轮播图js
$(function () {
    $(".smallpics li").mouseenter(function () {
        $(".big").attr("src",$(this).children("img").attr("src"));
    })
});
// 轮播图js
// 分类列表选择案例
$(function(){
    $("#book-list .list li").mouseenter(function(){
        $(this).find("div").addClass("list-select").addClass("up").parents("li").siblings().find("div").removeClass("list-select").removeClass("up")
    }).click(function () {
        $(this).find("div").addClass("list-active").parents("li").siblings().find("div").removeClass("list-active")
    })
});
// 分类列表选择案例
//漫画项选择案例
$(function () {
    $(".book-item li").mouseenter(function () {
        $(this).toggleClass("more-up")
    })
});
//漫画项选择案例
// 点赞案例
$(function () {
    $(".focus .likes").text(" 喜欢 ❤")
    $(".focus .unlike").text(" 不喜欢 💔")
    $(".com-data").find(".likes").click(function(){
        $(this).attr("href","").toggleClass("likes-select")
    });
    $(".blog-excerpt-bottom").find(".likes").click(function(){
        $(this).attr("href","").toggleClass("likes-select")
    });
    $(".focus").on("click",".likes",function(){
        $(this).toggleClass("likes").toggleClass("unlike").text(" 不喜欢 💔");
    })
    $(".focus").on("click",".unlike",function(){
        $(this).toggleClass("unlike").toggleClass("like").text(" 喜欢 ❤");
    })
})
// 点赞案例
// 个人中心信息列表选择案例
$(function(){
    $("#user-info .user-tab li").mouseenter(function(){
        $(this).addClass("userlist-select").siblings().removeClass("userlist-select")
    }).mouseleave(function(){
        $(this).removeClass("userlist-select")
    }).click(function () {
        $(this).addClass("userlist-active").siblings().removeClass("userlist-active")
    })
});
// 个人中心信息列表选择案例
// 更改个人头像
$(function () {
    $("#change-info .info-head a").click(function(){
        $("#changeIcon").click();
    });
    $("#changeIcon").change(function () {
        var filePath = $(this).val();
        var fileType = filePath.substring(filePath.lastIndexOf("."));
        if (fileType == ".jpg" || fileType == ".png" ||fileType == ".JPG" || fileType == ".JPEG") {
            $(".img").attr("src", URL.createObjectURL($(this)[0].files[0]));
            $("#changeImgModal").modal({
                backdrop: "static"
            });
        } else {
            var flag = confirm("上传图片格式不正确，请重新选择(.jpg或.png)");
        }
    });
    $("#changeImgModal").find("#change").click(function(){
        if(confirm("确定上传此图片为新头像?")){
            $("#form-change-icon").submit();
        }else{
            $("#close").click();
        }
    })
});


// 更改个人头像

