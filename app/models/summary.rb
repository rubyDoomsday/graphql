class Summary < ApplicationRecord
  has_many :metrics, dependent: :destroy
end
