var getTabbedContent = {
  init: function() {
    $(".tab_item").click(function() {
      var controller = $(this).attr("controller");
      var action     = $(this).attr("action");
      if(controller && action) {
        getTabbedContent.getContent($(this), controller, action);
      }
    });
  },

  getContent: function(obj, controller, action) {
    var class_name  = obj.attr("id").replace("_tab", "_content");
    var content_box = $("ul." + class_name + " li");
    content_box.load("/"+controller+"/"+action);
  }
}

$(document).ready(function(){
  getTabbedContent.init();
});
