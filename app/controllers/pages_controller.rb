class PagesController < ApplicationController
  def statistics
    @products = current_user.products
    @lifetime = current_user.products_lifetime

    # Composition Proportion Stat
    @composition_hash = Hash.new
    @products.each do |product|
      if product.second_hand != true
        product.proportions.each do |proportion|
        @composition_hash[proportion.material.name] =+  proportion.percentage
        end
      end
    end

    # Thrifted Clothes Stat
    in_wardrobe = ["in my wardrobe", "to sell", "to donate", "to recycle", "to throw away"]
    thrifted = @products.where(status: in_wardrobe).group(:second_hand).count
    labels = { true => 'Thrifted', false => 'New' }
    @thrift_hash = thrifted.transform_keys(&labels.method(:[]))

    # Discarded Clothes stat
    statuses = ["donated","sold","thrown away","recycled"]
    @status_hash = Hash.new
    @products.each do |product|
      if statuses.include?(product.status)
        if @status_hash[product.status]
        @status_hash[product.status] += 1
        else
        @status_hash[product.status] = 1
        end
      end
    end

    # Thrifted over the years
    @products.order("purchase_date DESC")
    date = @products.first.purchase_date
    second_hand = []
    bought_new = []
    @global_thrift_hash = Hash.new
    until date.month == Date.today.month && date.year == Date.today.year
      @products.each do |product|
        if product.purchase_date <= date && (product.discard_date == nil || product.discard_date >= date + 1.month)
          if product.second_hand == true
            second_hand << product
          else
            bought_new << product
          end
          monthly_produt_list << product
        end
        @global_thrift_hash[date] = ((second_hand.count.to_f / (second_hand.count + bought_new.count).to_f) * 100).round(1)
      end
      date = date + 1.month
    end
  end
end
