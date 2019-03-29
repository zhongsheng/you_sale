import { Controller } from "stimulus"

export default class extends Controller {
    static targets = [ "name", "output" ]

    greet() {
        alert('hi')
        this.outputTarget.textContent =
            `Hello, ${this.nameTarget.value}!`
    }
}
