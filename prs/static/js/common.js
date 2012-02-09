function show(e, display){
  if (!display){
    display = 'block';
  }
  if (e.hasClass('hide')){
    e.removeClass('hide');
  }
  
  e.css('display', display);
}

function hide(e){
  if (!e.hasClass('hide')){
    e.addClass('hide');
  }
  e.css('display', 'none');
}

