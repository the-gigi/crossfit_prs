
$(document).ready(function(){
  console.log('Registring event handler for activity selection');
  $('#id_activity').change(function(event){
    var a = $('#id_activity option:selected').text();
    var activities = jQuery.parseJSON($('#id_activities').val());
    var scoreType = activities[a];
    
    console.log('activity name: ' + a);
    console.log('score type: ' + scoreType);
    
    hide($('#id_weight_wrapper'));
    hide($('#id_unit_wrapper'));
    hide($('#id_reps_wrapper'));
    hide($('#id_time_wrapper'));
    
    switch (scoreType){
      case 'Weight':{
        show($('#id_weight_wrapper'));
        show($('#id_unit_wrapper'));
        break;
      } 
      case 'Reps':{
        show($('#id_reps_wrapper'), 'table');
        break;
      }
      case 'Time':{
        show($('#id_time_wrapper'), 'table');
        break;
      }
      default:{
        console.log('Unknown score type')
      }
    }    
  });
});

//console.log( $('#ixd').val());
//console.log( $("input[name='ixd'][type='hidden']"));

  
