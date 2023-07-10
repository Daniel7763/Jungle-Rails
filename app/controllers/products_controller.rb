class ProductsController < ApplicationController
  before_action :authenticate

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
  end

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == "Jungle" && password == "book"
    end
  end

end
