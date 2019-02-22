class Zoo < ApplicationRecord
    has_many :animals, dependent: :destroy
end
