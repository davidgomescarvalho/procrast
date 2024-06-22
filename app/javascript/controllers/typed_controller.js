import { Controller } from "@hotwired/stimulus"
import Typed from 'typed.js';

// Connects to data-controller="typed"
export default class extends Controller {
  // static values = { sentences: Array }
  connect() {
    const options = { strings: ["Change your life by turning your procrastination into creation !", "Create a project now !"," “ Anything that can be done another day can be done today”" ], typeSpeed: 40, loop: true, showCursor: true, cursorChar: '|', backSpeed: 40, backDelay: 1000, startDelay: 1000}
    this.typed = new Typed(this.element, options);
  }
}
//
