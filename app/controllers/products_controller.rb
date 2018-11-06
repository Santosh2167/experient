class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user! 

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
    @my_products = Product.where(user_id: current_user)
    # @user = User.find(current_user[:id])
  end

  def history
    @my_products = Product.where(user_id: current_user)
  end

  def inactive_button
    @product = Product.find(params[:id])
    @product.active = false
    # @product.active = !@product.active
    @product.save

    redirect_to profile_path
  end

  # GET /products/1
  # GET /products/1.json
  def show
    # render current_user.email
    #  @user = User.find(current_user[:id])
    # render json: first_name
    # render json: current_user[:first_name]
  end

  def process_payment
    # render json: params
    @amount = (params[:service_value][:price].to_f*100).round
    @product_id =(params[:service_value][:id])
    
    
    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )
  
    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'aud'
    )
  
        # Transaction.create(
    #   charge.metadata.service_id
    # )

     Transaction.create(
        amount: (@amount/100),
        product_id: @product_id,
        user_id: current_user.id
       )

       ProductReview.create(
         product_id: @product_id,
         user_id: current_user.id
       )

      #  @transaction.save
    
    # @transaction.save
    redirect_to thankyou_path(product_id: @product_id)
  rescue Stripe::CardError => e
    flash[:error] = e.message

    

  end

  def thankyou
    @product = Product.find(params[:product_id])

  end

       

  def advanced_search
    @groups = AgeGroup.pluck("range","id")
    @category = Category.pluck("category","id")

  end


  # GET /products/new
  def new
    @product = Product.new
    @business = Business.find(params[:business_id])
    @category = Category.pluck("category","id")

  end

  # GET /products/1/edit
  def edit
    @business = User.find(params[:business_id]).business
    @category = Category.pluck("category","id")
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    @product.user_id = current_user.id

    respond_to do |format|
      if @product.save
        format.html { redirect_to profile_path, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to profile_path, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

 
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :cost, :location, :description, :active, :category, :keywords, :user_id, :image)
    end
end
