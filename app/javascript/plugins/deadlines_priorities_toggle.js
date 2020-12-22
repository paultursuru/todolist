const deadlinesPrioritiesToggle = () => {
  $('#by_deadlines').click(function(){
    $(this).toggleClass("active");
    $('#by_priorities').toggleClass("active");
    $('#tasks_by_deadlines').toggleClass("d-none");
    $('#tasks_by_priorities').toggleClass("d-none");
  });
  $('#by_priorities').click(function(){
    $(this).toggleClass("active");
    $('#by_deadlines').toggleClass("active");
    $('#tasks_by_priorities').toggleClass("d-none");
    $('#tasks_by_deadlines').toggleClass("d-none");
  });
};

export { deadlinesPrioritiesToggle };
