# Pin npm packages by running ./bin/importmap

pin 'application'
pin '@hotwired/turbo-rails', to: 'turbo.min.js'
pin '@hotwired/stimulus', to: 'stimulus.min.js'
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js'
pin_all_from 'app/javascript/controllers', under: 'controllers'

pin 'tabler', to: 'tabler.min.js'
pin 'jquery', to: 'https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js'
pin 'select2', to: 'https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js'
pin 'flatpickr' # @4.6.13
pin 'trix'
pin '@rails/actiontext', to: 'actiontext.esm.js'
pin 'tom-select' # @2.6.2
pin '@orchidjs/sifter', to: '@orchidjs--sifter.js' # @1.1.0
pin '@orchidjs/unicode-variants', to: '@orchidjs--unicode-variants.js' # @1.1.2
