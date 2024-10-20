$(document).ready(function(){
  $('.left-menu-item-expand').click(function(e) {
    // e.preventDefault();
    $(this).find('.left-menu-expand-header').toggleClass('expanded');
    $(this).find('.sub-left-menu-expand-container').slideToggle('fast');
    $(this).find('.icon-expand').toggleClass('rotate');
  });
});