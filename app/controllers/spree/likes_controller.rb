class Spree::LikesController < Spree::StoreController
  rescue_from ActiveRecord::RecordNotFound, :with => :render_404
  helper 'spree/products'
  def like_product
    current_spree_user.like(product)
    redirect_to product
  end

  def unlike_product
    product.likes.where(user: current_spree_user).destroy_all
    redirect_to product
  end

  def index
    @searcher = build_searcher(params)
    @products = @searcher.retrieve_products
    @products = @products.where(id: current_spree_user.likes.pluck(:product_id))
    @taxonomies = Spree::Taxonomy.includes(root: :children)
  end

  private

  def product
    @product ||= Spree::Product.find(params[:id])
  end
end
