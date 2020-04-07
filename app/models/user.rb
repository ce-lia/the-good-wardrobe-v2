class User < ApplicationRecord
  has_merit

  has_many :products
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def products_lifetime
    lifetime = 0
    average_lifetime = 0
      if products.count > 0
        products.each do |product|
          if product.discard_date != nil && product.purchase_date != nil
            lifetime += (product.discard_date - product.purchase_date)
          elsif product.discard_date == nil && product.purchase_date != nil
            lifetime += (Date.today - product.purchase_date)
          elsif product.discard_date != nil && product.purchase_date == nil
            lifetime += (product.discard_date - product.created_at.to_date)
          elsif product.discard_date == nil && product.purchase_date == nil
            lifetime += (Date.today - product.created_at.to_date)
          end
        end
        average_lifetime = (lifetime / products.count.to_f) / 365
      end
    average_lifetime
  end

  def second_hand_percentage
    self.products.where(second_hand: true).count.to_f / self.products.count.to_f
  end

  def organic_recycled_materials
    @composition_hash = Hash.new
    self.products.each do |product|
      if product.second_hand != true
          product.proportions.each do |proportion|
          @composition_hash[proportion.material.name] =+ proportion.percentage
          end
      end
    end
    total_composition = @composition_hash.values.reduce(:+)
    good_materials = ["Recycled polyester", "Organic cotton", "Recycled cotton","Organic hemp", "Recycled hemp", "Organic linen", "Recycled linen", "Organic wool", "Recycled wool", "Organic silk", "Recycled silk"]
    good_composition = @composition_hash.reduce(0) do |memo, composition|
      if good_materials.include?(composition[0])
        memo + composition[1]
      else
        memo
      end
    end
    good_composition.to_f / total_composition.to_f
  end

  def recycler
    good_status = ["donated","sold","recycled"]
    recycled = []
    thrown = []
    self.products.each do |product|
      if good_status.include?(product.status)
        recycled << product
      elsif product.status == "thrown away"
        thrown << product
      end
    end
    recycled.count.to_f / thrown.count.to_f
  end

end
