class DealsController < ApplicationController
  before_action :set_deal, only: %i[show edit update destroy]
  before_action :validate_checkbox, only: [:create]

  # GET /deals or /deals.json
  def index
    @deals = current_user.deals
  end

  # GET /deals/1 or /deals/1.json
  def show
    @deal_show = Deal.find(params[:id])
  end

  # GET /deals/new
  def new
    @deal = Deal.new
    @categories = current_user.categories
    @category = Category.find(params[:category_id])
  end

  # GET /deals/1/edit
  def edit; end

  # POST /deals or /deals.json
  def create
    @deal = Deal.new(deal_params)
    @deal.user = current_user

    respond_to do |format|
      if @deal.save
        format.html { redirect_to categories_path, notice: 'Deal was successfully created.' }
        format.json { render :show, status: :created, location: @deal }
        category_deal(@deal)
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @deal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /deals/1 or /deals/1.json
  def update
    respond_to do |format|
      if @deal.update(deal_params)
        format.html { redirect_to deal_url(@deal), notice: 'Deal was successfully updated.' }
        format.json { render :show, status: :ok, location: @deal }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @deal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deals/1 or /deals/1.json
  def destroy
    @deal.destroy

    respond_to do |format|
      format.html { redirect_to deals_url, notice: 'Deal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_deal
    @deal = Deal.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def deal_params
    params.require(:deal).permit(:name, :amount)
  end

  def validate_checkbox
    return unless params[:deal][:category_id].length == 1

    flash[:alert] = 'Please select at least one category.'
    redirect_to new_category_deal_path
  end

  def category_deal(deal)
    params[:deal][:category_id].each do |category|
      Category.find_by_id(category.to_i).deals.push(deal) unless category == ''
    end
  end
end
