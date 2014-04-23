$(document).ready(function() {
  HechoEnCdMx.init();
});

var HechoEnCdMx = {
  init: function () {
    var $badgeBtns = $('.cdmx-badge'),
      $codeSnippets = $('.code-snippet');
    
    $badgeBtns.on('click', function () {
      var $this = $(this);
      
      $codeSnippets.addClass('hide');
      $($this.attr('data-code-target'))
        .removeClass('hide')
        .find('textarea')
        .select();
    });
  }
};