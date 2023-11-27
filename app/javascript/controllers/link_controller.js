import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "select","key","expire" ]
  connect(){
    select = this.selectTarget.value
    alert(select)
  }
}
