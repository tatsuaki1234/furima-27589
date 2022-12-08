class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [ :index ]
  def index
    @items = Item.all
  end

  def new
    # @items = Item.order("created_at DESC")
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      # @item = Item.find(params[:image])
      # @item = Item.find(item_params)
      render :new
    end
  end


  private
  
  def item_params
    params.require(:item).permit(:name, :image, :content, :category_id, :condition_id, :postage_id, :area_id, :scheduled_delivery_id, :price).merge(user_id: current_user.id)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end

# -----------------------------------------------------------------------
# params.required(:item)
# -----------------------------------------------------------------------


# class ItemsController < ApplicationController
#   before_action :authenticate_user!, except: [ :index ]
#   def index
#   end
#   def new
#     @item = Item.new
#   end
#   def create
#     @item = Item.new(create_params)
#     if @item.save
#        redirect_to root_path
#     else
#       render :new
#     end
#   end
#   private
#    def create_params
#     params.required(:item).permit(:image, :name, :explanation, :category_id, :status_id, :delivery_cost_id, :prefecture_id, :delivery_day_id, :price).merge(user_id: current_user.id)
#    end
#    private
#   def configure_permitted_parameters
#     devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
#   end
# end





# def index
#   @prototypes = Prototype.all
# end

# def new
#   @prototype = Prototype.new
# end

# def create
#   @prototype = Prototype.new(prototype_params)
#   if @prototype.save

#     redirect_to root_path
#   else
#     render :new
    
#   end
# end

