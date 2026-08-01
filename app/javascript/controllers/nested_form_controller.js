// app/javascript/controllers/nested_form_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["container", "template", "totalHtOutput", "totalTvqOutput", "totalTpsOutput", "totalOutput"]

  connect() {
    console.log("Contrôleur Stimulus 'NestedForm' connecté avec succès !")
    this.refreshAllCalculations()
  }

  add(event) {
    event.preventDefault()
    const content = this.templateTarget.innerHTML.replace(/NEW_RECORD/g, new Date().getTime())
    this.containerTarget.insertAdjacentHTML('beforeend', content)
    this.calculateGlobalTotal()
  }

  remove(event) {
    event.preventDefault()

    const wrapper = event.target.closest('.nested-fields')

    if (wrapper.dataset.newRecord === "true") {
      wrapper.remove()
      this.calculateGlobalTotal()
    } else {
      wrapper.querySelector("input[name*='[_destroy]']").value = "1"
      wrapper.style.display = "none"
      this.calculateGlobalTotal()
    }
  }

  calculateRowTotal(event) {
    const row = event.target.closest('.nested-fields')
    this.updateRowTotal(row)
  }

  updatePriceFromProduct(event) {
    const select = event.target
    const row = select.closest('.nested-fields')
    const priceInput = row.querySelector('.item-unit_price')

    // Récupérer l'option actuellement sélectionnée dans le select natif sous Tom Select
    const selectedOption = select.options[select.selectedIndex]

    if (selectedOption && selectedOption.dataset.unit_price) {
      // Assigner le prix récupéré au champ Prix unitaire
      priceInput.value = parseFloat(selectedOption.dataset.unit_price).toFixed(2)

      // Forcer le calcul du sous-total de la ligne
      this.updateRowTotal(row)
    }
  }

  updateRowTotal(row) {
    const quantityInput = row.querySelector('.item-quantity')
    const priceInput = row.querySelector('.item-unit_price')
    const rowTotalInput = row.querySelector('.item-row-total')

    const quantity = quantityInput ? parseFloat(quantityInput.value) || 0 : 0
    const price = priceInput ? parseFloat(priceInput.value) || 0 : 0

    const rowTotal = quantity * price

    if (rowTotalInput) {
      rowTotalInput.value = rowTotal.toFixed(2)
    }
    this.calculateGlobalTotal()
  }

  calculateGlobalTotal() {
    let globalTotal = 0
    const rows = this.containerTarget.querySelectorAll('.nested-fields')
    console.log('ALL')

    rows.forEach(row => {
      const destroyInput = row.querySelector("input[name*='[_destroy]']")
      if (destroyInput && destroyInput.value === "1") return

      const rowTotalInput = row.querySelector('.item-row-total')
      const rowTotal = rowTotalInput ? parseFloat(rowTotalInput.value) || 0 : 0

      globalTotal += rowTotal
    })
    console.log(globalTotal)
    if (this.hasTotalHtOutputTarget) {
      this.totalHtOutputTarget.value = globalTotal.toFixed(2)
    }
    if (this.hasTotalTvqOutputTarget) {
      this.totalTvqOutputTarget.value = (globalTotal * 0.09975).toFixed(2)
    }
    if (this.hasTotalTpsOutputTarget) {
      this.totalTpsOutputTarget.value = (globalTotal * 0.05).toFixed(2)
    }
    if (this.hasTotalOutputTarget) {
      this.totalOutputTarget.value = (globalTotal * 1.14975).toFixed(2)
    }
  }

  refreshAllCalculations() {
    this.containerTarget.querySelectorAll('.nested-fields').forEach(row => {
      this.updateRowTotal(row)
    })
  }
}
