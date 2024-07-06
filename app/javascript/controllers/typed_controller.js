import { Controller } from "@hotwired/stimulus"
import Typed from 'typed.js';

// Connects to data-controller="typed"
export default class extends Controller {
  // static values = { sentences: Array }
  connect() {
    const options = { strings: ["Procrastination is the thief of time !", "Create a project now !","Don't push for tomorrow, do it today" ], typeSpeed: 40, loop: true, showCursor: true, cursorChar: '|', backSpeed: 40, backDelay: 1000, startDelay: 1000}
    this.typed = new Typed(this.element, options);
  }
}
//
