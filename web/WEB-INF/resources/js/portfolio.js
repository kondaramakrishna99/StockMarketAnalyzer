 $(document).ready(function(){
      var i=1;
     $("#add_row").click(function(){
      
               window.location="/Users/Shabista/Desktop/AddStocks.html";
               
            
  });
     $("#delete_row").click(function(){
    	 if(i>=1){
		 $("#addr"+(i-1)).html('');
		 i--;
		 }
	 });

});