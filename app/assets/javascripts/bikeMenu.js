$(".false_clicked").on("click", function(){
  console.log("############ YAAAAAAHH!!!! IN THE JQUERY!!!!!")
  $(".stolen_form").css("display", "inline");
});
$(".true_clicked").on("click", function(){
  $(".stolen_form").css("display", "none");
});