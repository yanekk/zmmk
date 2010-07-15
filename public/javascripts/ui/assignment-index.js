jQuery(function(){
   $("#assignments").sortable({axis: "y", update: function(){
           var ids = new Array();
           $("#assignments li.assignment").each(function(){
                ids.push($(this).attr("id").match("assignment_([0-9]+)")[1]);
           });
           var lesson_module_id = $("#lesson_module_id").val();
           ids = "order[]="+ids.join("&order[]=");
           $.post("/lesson_modules/"+lesson_module_id+"/assignments/update_order", "_method=put&"+ids, function(response){
                if (response.error)
                   alert(response.error);
           }, "json");
       }
   });
});

