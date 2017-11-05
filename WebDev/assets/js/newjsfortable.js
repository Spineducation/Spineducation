     $(document).ready(function(){
      var i=1;
     $("#hist_add_row").click(function(){
      $('#hist_mcq_row'+i).html("<td>"+ (i+1) +"</td><td><input name='hist_"+i+"question' type='text' placeholder='Max 450 char.' class='form-control input-md'  /> </td><td><input type='text' name='hist_ "+i+"optiona' placeholder='Max 450 char.' class='form-control'/> </td><td><select name='hist_"+i+"answera'><option value='null'></option><option value='true'>TRUE</option> <option value='false'>FALSE</option></select></td><td><input type='text' name='hist_"+i+"optionb' placeholder='Max 450 char.' class='form-control'/> </td><td><select name='hist_"+i+"answerb'><option value='null'></option><option value='true'>TRUE</option> <option value='false'>FALSE</option></select></td><td><input type='text' name='hist_"+i+"optionc' placeholder='Max 450 char.' class='form-control'/> </td><td><select name='hist_"+i+"answerc'><option value='null'></option><option value='true'>TRUE</option> <option value='false'>FALSE</option></select></td><td><input type='text' name='hist_"+i+"optiond' placeholder='Max 450 char.' class='form-control'/> </td><td><select name='hist_"+i+"answerd'><option value='null'></option><option value='true'>TRUE</option> <option value='false'>FALSE</option></select></td>");

      $('#hist_tab_logic').append('<tr id="hist_mcq_row'+(i+1)+'"></tr>');
      i++; 
  });
     $("#hist_delete_row").click(function(){
    	 if(i>1){
		 $("#hist_mcq_row"+(i-1)).html('');
		 i--;
		 }
	 });

});
     $(document).ready(function(){
      var i=1;
     $("#phys_add_row").click(function(){
      $('#phys_mcq_row'+i).html("<td>"+ (i+1) +"</td><td><input name='phys_"+i+"question' type='text' placeholder='Max 450 char.' class='form-control input-md'  /> </td><td><input type='text' name='phys_ "+i+"optiona' placeholder='Max 450 char.' class='form-control'/> </td><td><select name='phys_"+i+"answera'><option value='null'></option><option value='true'>TRUE</option> <option value='false'>FALSE</option></select></td><td><input type='text' name='phys_"+i+"optionb' placeholder='Max 450 char.' class='form-control'/> </td><td><select name='phys_"+i+"answerb'><option value='null'></option><option value='true'>TRUE</option> <option value='false'>FALSE</option></select></td><td><input type='text' name='phys_"+i+"optionc' placeholder='Max 450 char.' class='form-control'/> </td><td><select name='phys_"+i+"answerc'><option value='null'></option><option value='true'>TRUE</option> <option value='false'>FALSE</option></select></td><td><input type='text' name='phys_"+i+"optiond' placeholder='Max 450 char.' class='form-control'/> </td><td><select name='phys_"+i+"answerd'><option value='null'></option><option value='true'>TRUE</option> <option value='false'>FALSE</option></select></td>");

      $('#phys_tab_logic').append('<tr id="phys_mcq_row'+(i+1)+'"></tr>');
      i++; 
  });
     $("#phys_delete_row").click(function(){
    	 if(i>1){
		 $("#phys_mcq_row"+(i-1)).html('');
		 i--;
		 }
	 });

});
     $(document).ready(function(){
      var i=1;
     $("#ct_add_row").click(function(){
      $('#ct_mcq_row'+i).html("<td>"+ (i+1) +"</td><td><input name='ct_"+i+"question' type='text' placeholder='Max 450 char.' class='form-control input-md'  /> </td><td><input type='text' name='ct_"+i+"optiona' placeholder='Max 450 char.' class='form-control'/> </td><td><select name='ct_"+i+"answera'><option value='null'></option><option value='true'>TRUE</option> <option value='false'>FALSE</option></select></td><td><input type='text' name='ct_"+i+"optionb' placeholder='Max 450 char.' class='form-control'/> </td><td><select name='ct_"+i+"answerb'><option value='null'></option><option value='true'>TRUE</option> <option value='false'>FALSE</option></select></td><td><input type='text' name='ct_"+i+"optionc' placeholder='Max 450 char.' class='form-control'/> </td><td><select name='ct_"+i+"answerc'><option value='null'></option><option value='true'>TRUE</option> <option value='false'>FALSE</option></select></td><td><input type='text' name='ct_"+i+"optiond' placeholder='Max 450 char.' class='form-control'/> </td><td><select name='ct_"+i+"answerd'><option value='null'></option><option value='true'>TRUE</option> <option value='false'>FALSE</option></select></td>");

      $('#ct_tab_logic').append('<tr id="ct_mcq_row'+(i+1)+'"></tr>');
      i++; 
  });
     $("#ct_delete_row").click(function(){
    	 if(i>1){
		 $("#ct_mcq_row"+(i-1)).html('');
		 i--;
		 }
	 });

});