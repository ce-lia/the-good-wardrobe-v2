class Proportion < ApplicationRecord
  belongs_to :product
  belongs_to :material

  validates :material, uniqueness: { scope: :product, message: "already present in the product"}
  validate :percentage, :first_step?
  def first_step?
    @proportions_product = Product.find(product_id).proportion_ids
    array_percentage = []
    @proportions_product.each do |p|
      array_percentage << Proportion.find(p).percentage
    end
    if self.percentage > (100 - array_percentage.sum )
      errors.add(:percentage, "can't be greater than 100%")
    end
  end

  def owner
    self.product.user
  end
end
