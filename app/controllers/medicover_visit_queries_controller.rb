class MedicoverVisitQueriesController < ApplicationController
  before_action :set_medicover_visit_query, only: [:show, :edit, :update, :destroy]

  # GET /medicover_visit_queries
  # GET /medicover_visit_queries.json
  def index
    @medicover_visit_queries = MedicoverVisitQuery.all
  end

  # GET /medicover_visit_queries/1
  # GET /medicover_visit_queries/1.json
  def show
  end

  # GET /medicover_visit_queries/new
  def new
    @medicover_visit_query = MedicoverVisitQuery.new
  end

  # GET /medicover_visit_queries/1/edit
  def edit
  end

  # POST /medicover_visit_queries
  # POST /medicover_visit_queries.json
  def create
    @medicover_visit_query = MedicoverVisitQuery.new(medicover_visit_query_params)

    respond_to do |format|
      if @medicover_visit_query.save
        format.html { redirect_to @medicover_visit_query, notice: 'Medicover visit query was successfully created.' }
        format.json { render :show, status: :created, location: @medicover_visit_query }
      else
        format.html { render :new }
        format.json { render json: @medicover_visit_query.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /medicover_visit_queries/1
  # PATCH/PUT /medicover_visit_queries/1.json
  def update
    respond_to do |format|
      if @medicover_visit_query.update(medicover_visit_query_params)
        format.html { redirect_to @medicover_visit_query, notice: 'Medicover visit query was successfully updated.' }
        format.json { render :show, status: :ok, location: @medicover_visit_query }
      else
        format.html { render :edit }
        format.json { render json: @medicover_visit_query.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medicover_visit_queries/1
  # DELETE /medicover_visit_queries/1.json
  def destroy
    @medicover_visit_query.destroy
    respond_to do |format|
      format.html { redirect_to medicover_visit_queries_url, notice: 'Medicover visit query was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medicover_visit_query
      @medicover_visit_query = MedicoverVisitQuery.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def medicover_visit_query_params
      params.require(:medicover_visit_query).permit(:region, :booking_type, :specialization, :clinic, :language, :doctor, :search_since, :search_for_next_since, :period_of_the_day, :set_because_of_pcc, :is_set_because_promote_specialization)
    end
end
