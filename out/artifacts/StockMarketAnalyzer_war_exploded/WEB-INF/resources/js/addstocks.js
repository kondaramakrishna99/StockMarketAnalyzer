 $(document).ready(function(){
      var i=1;
     $("#search").click(function(){
        $("#tab_logic").append('<tr><td></td><td><input type="text" name="name0"  placeholder="Company" class="form-control"/></td><td><input type="text" name="mail0" placeholder="Quantity" class="form-control"/></td><td><button type="button" class="btn btn-success" role="button" id="search">Analyze</button></td></tr>');    

  
      $('#tab_logic').on('click', '#search', function(){
        window.location="/Users/Shabista/Desktop/Analyze.html";
});
   });   

});