import { Controller } from "stimulus"
import Rails from "@rails/ujs";

export default class extends Controller {

  static targets = [ 'listsDeadlines', 'listsPositions', 'listsPriorities' ];

  connect() {
  }
  refresh(event) {
    console.log(event)
    // this.listsDeadlinesTarget.innerHTML = ;

  }
}
