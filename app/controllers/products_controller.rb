class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  after_action :change_discard_date, only: [:update]

  def index
    in_my_wardrobe_statuses = ["in my wardrobe", "to sell", "to donate", "to recycle", "to throw away"]
    if params[:search].present?
      if params[:search]["all"] == "all"
        @products = current_user.products.all.order(:status)
      elsif params[:search]["all"] == "wardrobe"
        @products = Product.where(status: in_my_wardrobe_statuses).order(:status)
      end
    else
      @products = Product.where(status: in_my_wardrobe_statuses).order(:status)
    end
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

  def change_discard_date
    discarded_statuses = ["sold", "recycled", "donated", "thrown away"]
    if discarded_statuses.include?(@product.status)
      @product.discard_date = Date.today
      @product.save
    else
      @product.discard_date = nil
      @product.save
    end
  end

  def set_product
    @product = Product.find(params[:id])
  end
  def product_params
    params.require(:product).permit(:title, :description, :second_hand, :purchase_date, :brand, :origin, :category, :status)
  end
end
