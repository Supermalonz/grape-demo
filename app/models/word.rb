class Word < ApplicationRecord
  validates :title, presence: true
end
