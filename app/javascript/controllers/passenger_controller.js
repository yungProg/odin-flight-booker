import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = [ "form" ]
    add(event) {
        event.preventDefault()
        const subForm = document.querySelector("#passenger-temp")
        const clone = document.importNode(subForm.content, true)
        this.formTarget.appendChild(clone)       
    }
    remove(event) {
        event.preventDefault()
        if (this.formTarget.children.length > 2) {
            this.formTarget.lastElementChild.remove()
        }
    }
}