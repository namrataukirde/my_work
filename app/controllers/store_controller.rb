class StoreController < ApplicationController
 # before_action only: [:index]
  def increment_count
    if session[:counter].nil?
      session[:counter] = 0
    end
  session[:counter] += 1
  end

  def index
    @count=increment_count
    @products = Product.all
    @cart=current_cart
  end
end
