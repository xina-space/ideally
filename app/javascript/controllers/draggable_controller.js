import { Controller } from 'stimulus'
import { Sortable } from '@shopify/draggable'

export default class extends Controller {
  static targets = ['progress', 'idea']
  initialize() { }
  connect() {
    if (this.hasIdeaTarget) {
      this.ideaTargets.forEach(idea => {
        idea.setAttribute('style', 'z-index: 1000;')
      })
      const sortable = new Sortable(this.progressTargets, {
        draggable: 'li'
      })
      sortable.on('sortable:stop', function (event) {
        let url = event.dragEvent.source.getAttribute('data-url')
        let progress = event.newContainer.getAttribute('data-id')
        let data = { idea: { progress_id: progress } }
        let token = document.head.querySelector('meta[name="csrf-token"]').getAttribute('content')
        fetch(url, {
          method: 'PUT',
          credentials: 'same-origin',
          headers: {
            "X-CSRF-Token": token,
            "Accept": "application/json",
            "Content-type": "application/json"
          },
          body: JSON.stringify(data)
        })
      })
    }
  }
  disconnect() { }
}
