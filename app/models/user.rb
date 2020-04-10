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
          if product.discard_date == nil
            lifetime += (Date.today - product.purchase_date)
          else
            lifetime += (product.discard_date - product.purchase_date)
          end
        end
        average_lifetime = (lifetime.to_f / products.count) / 365
      end
    average_lifetime.round(1)
  end

  def second_hand_percentage
    self.products.where(second_hand: true).count.to_f / self.products.count.to_f
  end

  def organic_recycled_materials
    @composition_hash = Hash.new
    status_in_wardrobe = ["inmy wardrobe", "to sell", "to donate", "to recycle"]
    self.products.each do |product|
      if product.second_hand != true && status_in_wardrobe.include?(product.status)
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

  def global_second_hand
    date = Date.parse('2015-01-01')
    second_hand = []
    bought_new = []
    until date.month == Date.today.month && date.year == Date.today.year
      self.products.each do |product|
        if product.purchase_date <= date && (product.discard_date == nil || product.discard_date >= date + 1.month)
          if product.second_hand == true
            second_hand << product
          else
            bought_new << product
          end
        end
      end
      date + 1.month
    end
    second_hand.count.to_f / (second_hand.count + bought_new.count).to_f
  end

end
