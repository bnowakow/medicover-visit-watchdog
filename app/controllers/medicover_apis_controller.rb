class MedicoverApisController < ApplicationController
  before_action :set_medicover_api, only: [:show, :edit, :update, :destroy]

  # GET /medicover_apis
  # GET /medicover_apis.json
  def index
    @medicover_apis = MedicoverApi.all
  end

  # GET /medicover_apis/1
  # GET /medicover_apis/1.json
  def show
  end

  # GET /medicover_apis/new
  def new
    @medicover_api = MedicoverApi.new
  end

  # GET /medicover_apis/1/edit
  def edit
  end

  # POST /medicover_apis
  # POST /medicover_apis.json
  def create
    @medicover_api = MedicoverApi.new(medicover_api_params)

    respond_to do |format|
      if @medicover_api.save
        format.html { redirect_to @medicover_api, notice: 'Medicover api was successfully created.' }
        format.json { render :show, status: :created, location: @medicover_api }
      else
        format.html { render :new }
        format.json { render json: @medicover_api.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /medicover_apis/1
  # PATCH/PUT /medicover_apis/1.json
  def update
    respond_to do |format|
      if @medicover_api.update(medicover_api_params)
        format.html { redirect_to @medicover_api, notice: 'Medicover api was successfully updated.' }
        format.json { render :show, status: :ok, location: @medicover_api }
      else
        format.html { render :edit }
        format.json { render json: @medicover_api.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medicover_apis/1
  # DELETE /medicover_apis/1.json
  def destroy
    @medicover_api.destroy
    respond_to do |format|
      format.html { redirect_to medicover_apis_url, notice: 'Medicover api was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medicover_api
      @medicover_api = MedicoverApi.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def medicover_api_params
      params.require(:medicover_api).permit(:url, :token, :new_visit_path)
    end
end
