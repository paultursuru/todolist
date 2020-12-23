const deadlinesPrioritiesToggle = () => {
  const sortingBtns = document.getElementsByClassName('deadlines-priorities-btn');
  const taskCardsList = document.getElementsByClassName('main-lists');

  for (let item of sortingBtns) {
    item.addEventListener("click", () => {
      for (let oldlink of sortingBtns) { oldlink.classList.remove('active'); };
      item.classList.add('active');
      document.cookie = `prefered_view=${item.id}`
      let listToToggleId = `tasks_${item.id}`
      let visibleList = document.getElementById(listToToggleId)
      for (let taskList of taskCardsList) { taskList.classList.add('d-none'); };
      visibleList.classList.remove('d-none');
    });
  }
};

export { deadlinesPrioritiesToggle };
