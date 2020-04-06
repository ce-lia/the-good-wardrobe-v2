class PagesController < ApplicationController
  def statistics
    @products = current_user.products
    @lifetime = current_user.products_lifetime

    @composition_hash = Hash.new
    @products.each do |product|
      if product.second_hand != true
        product.proportions.each do |proportion|
        @composition_hash[proportion.material.name] =+  proportion.percentage
        end
      end
    end

    thrifted = @products.group(:second_hand).count
    labels = { true => 'Thrifted', false => 'New' }
    @thrift_hash = thrifted.transform_keys(&labels.method(:[]))


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
  end
end
