class Payment < ApplicationRecord
  include Meilisearch::Rails
  belongs_to :invoice
end
