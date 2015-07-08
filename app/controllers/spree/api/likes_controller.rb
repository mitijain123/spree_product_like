class Spree::Api::LikesController < Spree::Api::BaseController
  
  helper 'spree/products'
  include Spree::Core::ControllerHelpers::Search
  def like_product
    @current_api_user.like(product)
    #redirect_to product
    render json: { status: 200}
  end

  def unlike_product
    product.likes.where(user: @current_api_user).destroy_all
    render json: { status: 200}
  end

  def index    
    # @searcher = build_searcher(params)
    # @products = @searcher.retrieve_products
    if(params[:q])
      @products = Spree::Product.where(id: @current_api_user.likes.pluck(:product_id)).ransack(params[:q]).result
    else
      @products = Spree::Product.where(id: @current_api_user.likes.pluck(:product_id))
    end
    expires_in 15.minutes, :public => true
    headers['Surrogate-Control'] = "max-age=#{15.minutes}"
    render json: @products, :include => 
      {:images => 
        {:methods => [:mini_url, :small_url, :large_url]}
      }, :methods => [:brands, :display_price , :master, :price]    
  end

  private

  def product
    @product ||= Spree::Product.find(params[:id])
  end
end
