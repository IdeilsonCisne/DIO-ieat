class Restaurant < ApplicationRecord
    has_many :products #obs Colocar sempre no plural, caso seja has_one, colocar sempre no singular
    belongs_to :user #obs: Colocar sempre no singular

    def total_of_products
        products.count
    end
end
