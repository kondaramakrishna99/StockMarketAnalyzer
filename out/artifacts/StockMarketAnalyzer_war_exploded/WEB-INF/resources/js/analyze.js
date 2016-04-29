$(function() {
    $('input[name="analyze"]').on('click', function() {
        if ($(this).val() == 'stanalysis') {
             $('#chart').show();
      $('#tabnew_logic').show();
	  $('#graph').hide();
      $('#tabnew1_logic').hide();
	  $('#tabnew2_logic').hide();
            
        }
        else if ($(this).val() == 'ltanalysis')  {
         $('#chart').hide();
      $('#tabnew_logic').hide();
           $('#graph').show();
      $('#tabnew1_logic').show();
	  $('#tabnew2_logic').hide();
	  
        }
		
		else if ($(this).val() == 'historydata')  {
          $('#chart').hide();
      $('#tabnew_logic').hide();
           $('#graph').hide();
      $('#tabnew1_logic').hide();
	  $('#tabnew2_logic').show();
        }
    });
    
    
    
});