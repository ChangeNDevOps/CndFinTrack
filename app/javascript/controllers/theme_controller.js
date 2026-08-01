import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="theme"
export default class extends Controller {
  static targets = [ "form", "resetButton" ]

  initialize() {
    this.themeConfig = {
      theme: 'light',
      'theme-base': 'gray',
      'theme-font': 'sans-serif',
      'theme-primary': 'teal',
      'theme-radius': '1',
    }
    this.url = new URL(window.location)
  }

  connect() {
    this.checkItems()
  }

  checkItems() {
    for (const key in this.themeConfig) {
      const value = window.localStorage[`tabler-${key}`] || this.themeConfig[key]
      if (value) {
        const radios = this.formTarget.querySelectorAll(`[name="${key}"]`)
        radios?.forEach((radio) => {
          radio.checked = radio.value === value
        })
      }
    }
  }

  change(event) {
    const { name, value } = event.target

    for (const key in this.themeConfig) {
      if (name === key) {
        document.documentElement.setAttribute(`data-bs-${key}`, value)
        window.localStorage.setItem(`tabler-${key}`, value)
        this.url.searchParams.set(key, value)
      }
    }
    window.history.pushState({}, "", this.url)
  }

  reset() {
    for (const key in this.themeConfig) {
      document.documentElement.removeAttribute(`data-bs-${key}`)
      window.localStorage.removeItem(`tabler-${key}`)
      this.url.searchParams.delete(key)
    }
    this.checkItems()
    window.history.pushState({}, "", this.url)
  }
}
