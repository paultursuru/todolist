const newTaskBtn = () => {
  const new_task_btn = document.getElementById('new_task_btn')
  new_task_btn.addEventListener("click", () => {
    document.getElementById("task_title").focus();
    document.documentElement.scrollTop = 0;
  });
};

export { newTaskBtn };
