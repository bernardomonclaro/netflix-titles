class NetflixesController < ApplicationController
  before_action :set_netflix, only: [:show, :update, :destroy]

  # GET /netflixes
  def index
    @netflixes = Netflix.all.page(params[:page])

    @netflixes = Netflix.where(nil) # cria um escopo anônimo
    filtering_params(params).each do |key, value|
      @netflixes = @netflixes.public_send("filter_by_#{key}", value) if value.present?
    end

    @netflixes = @netflixes.order('release_year DESC')

    paginate json: @netflixes
  end

  # GET /netflixes/1
  def show
    render json: @netflix
  end

  # POST /netflixes
  def create
    @netflix = Netflix.new(netflix_params)

    if @netflix.save
      render json: @netflix, status: :created, location: @netflix
    else
      render json: @netflix.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /netflixes/1
  def update
    if @netflix.update(netflix_params)
      render json: @netflix
    else
      render json: @netflix.errors, status: :unprocessable_entity
    end
  end

  # DELETE /netflixes/1
  def destroy
    @netflix.destroy
  end

  private

  def set_netflix
    @netflix = Netflix.find(params[:id])
  end

  def netflix_params
    params.require(:netflix).permit(:title, :show_type, :release_year, :country, :date_added, :description)
  end

  # Params que serão filtrados
  def filtering_params(params)
    params.slice(:year, :genre, :country)
  end
end
