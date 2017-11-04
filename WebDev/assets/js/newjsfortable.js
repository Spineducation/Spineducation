     $(document).ready(function(){
      var i=1;
     $("#add_row").click(function(){
      $('#addr'+i).html("<td>"+ (i+1) +"</td><td><input name='question"+i+"' type='text' placeholder='Max 450 char.' class='form-control input-md'  /> </td><td><input type='text' name='"+i+"optiona' placeholder='Max 450 char.' class='form-control'/> </td><td><select name='"+i+"answera'><option value='null'></option><option value='true'>TRUE</option> <option value='false'>FALSE</option></select></td><td><input type='text' name='"+i+"optionb' placeholder='Max 450 char.' class='form-control'/> </td><td><select name='"+i+"answerb'><option value='null'></option><option value='true'>TRUE</option> <option value='false'>FALSE</option></select></td><td><input type='text' name='"+i+"optionc' placeholder='Max 450 char.' class='form-control'/> </td><td><select name='"+i+"answerc'><option value='null'></option><option value='true'>TRUE</option> <option value='false'>FALSE</option></select></td><td><input type='text' name='"+i+"optiond' placeholder='Max 450 char.' class='form-control'/> </td><td><select name='"+i+"answerd'><option value='null'></option><option value='true'>TRUE</option> <option value='false'>FALSE</option></select></td>");

      $('#tab_logic').append('<tr id="addr'+(i+1)+'"></tr>');
      i++; 
  });
     $("#delete_row").click(function(){
    	 if(i>1){
		 $("#addr"+(i-1)).html('');
		 i--;
		 }
	 });

});