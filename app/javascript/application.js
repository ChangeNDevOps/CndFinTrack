// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "tabler"
import "jquery"
import "tom-select"
import "select2"

document.addEventListener("turbo:load", function() {
    $('.select2-multiple').select2({
        placeholder: "Sélectionnez des options",
        allowClear: true,
        width: '100%'
    });
});

import "trix"
import "@rails/actiontext"
