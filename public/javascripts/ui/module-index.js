jQuery(function(){
   $("#modules").sortable({axis: "y", update: function(){
           var ids = new Array();
           $("#modules li.module").each(function(){
                ids.push($(this).attr("id").match("lesson_module_([0-9]+)")[1]);
           });
           ids = "order[]="+ids.join("&order[]=");
           $.post("/lesson_modules/update_order", "_method=put&"+ids, function(response){
                if (response.error)
                   alert(response.error);
           }, "json");
       }
   });
});

