class PosdsController < ApplicationController
  
  before_action :set_posd, only: [:show, :edit, :update, :destroy, :upvote]
  before_filter :authenticate_user!, :only => [:edit, :new, :destroy]

  # GET /posds
  # GET /posds.json
  def index
    @posds = Posd.order ('publish_date DESC')
    @posds  = @posds.published if current_user.blank? #не залогіненим не показує майбутні пости
     #@posds = @posds.by_user_id(params[:user]) if params [:user].present?
     #@posds = @posds.by_category_id(params[:cat]) if params [:cat].present?
  end

  # GET /posds/1
  # GET /posds/1.json
  def show
  end

  # GET /posds/new
  def new
    @posd = Posd.new
  end

  # GET /posds/1/edit
  def edit
  end

  # def upvote #likes
  #     @posd.increment!(:votes_count)
  #     #збільшить voutes_count на 1 і save
  #     redirect_to request.referrer #повертається на ту саму сторінку
  #  end

  # POST /posds
  # POST /posds.json
  def create
    @posd = Posd.new(posd_params)
    @posd.user_id = current_user.id

    respond_to do |format|
      if @posd.save
        format.html { redirect_to @posd, notice: 'Posd was successfully created.' }
        format.json { render :show, status: :created, location: @posd }
      else
        format.html { render :new }
        format.json { render json: @posd.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posds/1
  # PATCH/PUT /posds/1.json
  def update
    respond_to do |format|
      if @posd.update(posd_params)
        format.html { redirect_to @posd, notice: 'Posd was successfully updated.' }
        format.json { render :show, status: :ok, location: @posd }
      else
        format.html { render :edit }
        format.json { render json: @posd.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posds/1
  # DELETE /posds/1.json
  def destroy
    @posd.destroy
    respond_to do |format|
      format.html { redirect_to posds_url, notice: 'Posd was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_posd
      @posd = Posd.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def posd_params
      params.require(:posd).permit(:title, :body, :publish_date, :user_id)
    end
end
