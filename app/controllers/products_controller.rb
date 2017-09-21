class ProductsController < ApplicationController
  impressionist actions: [:show]

	def index
   	  @products = Product.all
	end

	def show
	  @product = Product.find(params[:id])
    impressionist(@product)
	end

	def add_to_cart
      @product = Product.find(params[:id])

      if !current_cart.items.include?(@product)
        current_cart.add_product_to_cart(@product)
        flash[:notice] = "你已成功將 #{@product.title} 加入購物車"
      else
        flash[:warning] = "你的購物車內已有此物品"
      end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path(@product), alert: "商品已下架"
  end
end
