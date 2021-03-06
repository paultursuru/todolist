const preferedOrderedTasksView = () => {
  // get prefered views btns
  let byDeadlinesBtn = document.getElementById('by_deadlines')
  let byPrioritiesBtn = document.getElementById('by_priorities')
  let byPositionsBtn = document.getElementById('by_positions')

  // get prefered views
  let byDeadlinesView = document.getElementById('tasks_by_deadlines')
  let byPrioritiesView = document.getElementById('tasks_by_priorities')
  let byPositionsView = document.getElementById('tasks_by_positions')

  // generate default prefered_view cookie
  if (document.cookie.split(';').some((item) => item.trim().startsWith('prefered_view='))) {

  } else { document.cookie = "prefered_view=by_positions" }

  // a weird way to check if user_signed_id to avoid js errors, any of the 6 elements from line 3 to 10 exists only if user_signed_in
  if ( byDeadlinesBtn ) {

    if (document.cookie.split(';').some((item) => item.includes('prefered_view=by_deadlines'))) {
      // show prefered view
      byDeadlinesBtn.classList.add('active');
      byDeadlinesView.classList.remove('d-none');

      // hide not prefered view
      byPrioritiesBtn.classList.remove('active');
      byPositionsBtn.classList.remove('active');
      byPrioritiesView.classList.add('d-none');
      byPositionsView.classList.add('d-none');
    } else if (document.cookie.split(';').some((item) => item.includes('prefered_view=by_priorities'))) {
      // show prefered view
      byPrioritiesBtn.classList.add('active');
      byPrioritiesView.classList.remove('d-none');

      // hide not prefered view
      byDeadlinesBtn.classList.remove('active');
      byPositionsBtn.classList.remove('active');
      byDeadlinesView.classList.add('d-none');
      byPositionsView.classList.add('d-none');
    } else if (document.cookie.split(';').some((item) => item.includes('prefered_view=by_positions'))) {
      // show prefered view
      byPositionsBtn.classList.add('active');
      byPositionsView.classList.remove('d-none');

      // hide not prefered view
      byDeadlinesBtn.classList.remove('active');
      byPrioritiesBtn.classList.remove('active');
      byDeadlinesView.classList.add('d-none');
      byPrioritiesView.classList.add('d-none');
    }
  }
};


export { preferedOrderedTasksView };
