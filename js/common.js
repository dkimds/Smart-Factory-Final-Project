
/********************** ready **********************/
$(document).ready(function(){
  //탭
  $(".tab").each(function(){
    var tab = $(this);
    var dt = tab.children("dt");
    var anc = dt.children("a");
    var pos = 0;
    var padTop = 0;

    anc.on("click",function(){
      dt.removeClass("on");
      $(this).parent("dt").addClass("on");
    })

    if(!dt.hasClass("on")){
      dt.eq(0).addClass("on");
    }

    for(var i=0;i<dt.length;i++){
      dt.eq(i).css({"left" : pos + "%"});
      pos += (100 / dt.length);

      if(padTop <= dt.eq(i).children("a").height()){
        padTop = dt.eq(i).children("a").height();
      }
    }

    tab.css({
      "padding-top" : padTop + "px"
    })
    dt.css({
      "width" : (100 / dt.length) + "%"
    })

    anc.css({
      "height" : padTop + "px"
    })
  })

  //qnaBox
  $(".qnaBox").each(function(){
    $("> .question",this).on("click",function(){
      if(!$(this).parent(".qnaBox").hasClass("on")){
        $(this).parent(".qnaBox").addClass("on");
      }else{
        $(this).parent(".qnaBox").removeClass("on");
      }
    })
  })
})

/********************** resize **********************/
$(window).resize(function(){
})

/********************** scroll **********************/
$(window).scroll(function(){
})
