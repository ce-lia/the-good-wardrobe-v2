class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = current_user.products.all
  end

  def show
    @proportion = Proportion.new
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    if @product.save
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @product.update(product_params)
      respond_to do |format|
        format.html { redirect_to products_path }
        format.js
      end
      else
        respond_to do |format|
          format.html { render :edit }
          format.js
        end
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end
  def product_params
    params.require(:product).permit(:title, :description, :category, :second_hand, :status, :origin, :brand)
  end
end
