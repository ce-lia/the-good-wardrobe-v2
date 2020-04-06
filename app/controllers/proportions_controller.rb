class ProportionsController < ApplicationController
  class ProportionsController < ApplicationController

  def new
    @product = Product.find(params[:product_id])
    @proportion = Proportion.new
  end

  def create
    @proportion = Proportion.new(proportion_params)
    @product = Product.find(params[:product_id])
    @proportion.product = @product
    if @proportion.save
      respond_to do |format|
        format.html { redirect_to product_path(@product) }
        format.js
      end
      else
        respond_to do |format|
          format.html { render 'products/show' }
          format.js
        end
    end
  end

   def destroy
    @proportion = Proportion.find(params[:id])
    @proportion.destroy
  end

   private

  def proportion_params
    params.require(:proportion).permit(:percentage, :material_id)
  end
end

end
