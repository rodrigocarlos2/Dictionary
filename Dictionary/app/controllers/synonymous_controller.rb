class SynonymousController < ApplicationController
  before_action :set_synonymou, only: [:show, :edit, :update, :destroy]

  # GET /synonymous
  # GET /synonymous.json
  def index
    @synonymous = Synonymou.all
  end

  # GET /synonymous/1
  # GET /synonymous/1.json
  def show
  end

  # GET /synonymous/new
  def new
    @synonymou = Synonymou.new
  end

  # GET /synonymous/1/edit
  def edit
  end

  # POST /synonymous
  # POST /synonymous.json
  def create

    @synonymou = Synonymou.new(synonymou_params)

    respond_to do |format|
      if @synonymou.save
        format.html { redirect_to @synonymou, notice: 'Synonymou was successfully created.' }
        format.json { render :show, status: :created, location: @synonymou }
      else
        format.html { render :new }
        format.json { render json: @synonymou.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /synonymous/1
  # PATCH/PUT /synonymous/1.json
  def update
    respond_to do |format|
      if @synonymou.update(synonymou_params)
        format.html { redirect_to @synonymou, notice: 'Synonymou was successfully updated.' }
        format.json { render :show, status: :ok, location: @synonymou }
      else
        format.html { render :edit }
        format.json { render json: @synonymou.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /synonymous/1
  # DELETE /synonymous/1.json
  def destroy
    @synonymou.destroy
    respond_to do |format|
      format.html { redirect_to synonymous_url, notice: 'Synonymou was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_synonymou
      @synonymou = Synonymou.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def synonymou_params
      params.require(:synonymou).permit(:word_1_id, :word_2_id)
    end
end
