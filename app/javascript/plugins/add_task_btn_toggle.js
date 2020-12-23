const addTaskBtnToggle = () => {
  $(document).ready(function(){
    let scrollTop = 0;
    $(window).scroll(function(){
      scrollTop = $(window).scrollTop();
       $('.counter').html(scrollTop);

      if (scrollTop >= 250) {
        $('#navbar_todo').addClass('scrolled-nav');
      } else if (scrollTop < 250) {
        $('#navbar_todo').removeClass('scrolled-nav');
      }
    });
  });
};

export { addTaskBtnToggle };
