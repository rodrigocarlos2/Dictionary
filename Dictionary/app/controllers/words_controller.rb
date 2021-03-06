class WordsController < ApplicationController
  before_action :set_word, only: [:show, :edit, :update, :destroy]

  # GET /words
  # GET /words.json
  def index
    @q = Word.ransack(params[:q])
    @words = @q.result(distinct: true)

    @words = @words.paginate(:page => params[:page], :per_page => 8)
  end

  # GET /words/1
  # GET /words/1.json
  def show
    @meanings = Meaning.where(word_id: @word.id)
    @synonymous = Synonymou.all
  end

  # GET /words/new
  def new
    @word = Word.new
  end

  # GET /words/1/edit
  def edit
  end

  # POST /words
  # POST /words.json
  def create

    @word = Word.new(word_params)
    word_params[:meanings_attributes][:word_id] = @word.id

    if word_params[:synonymous_attributes]!=nil
      word_params[:synonymous_attributes][:word_id] = @word.id
    end

    respond_to do |format|
      if @word.save
        format.html { redirect_to @word, notice: 'Word was successfully created.' }
        format.json { render :show, status: :created, location: @word }
      else
        format.html { render :new }
        format.json { render json: @word.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /words/1
  # PATCH/PUT /words/1.json
  def update
    respond_to do |format|
      if @word.update(word_params)
        format.html { redirect_to @word, notice: 'Word was successfully updated.' }
        format.json { render :show, status: :ok, location: @word }
      else
        format.html { render :edit }
        format.json { render json: @word.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /words/1
  # DELETE /words/1.json
  def destroy

    @synonymous = Synonymou.all

    @synonymous.each do |synonymou|
      if synonymou.word_id==@word.id
        synonymou.destroy
      elsif synonymou.word_2_id==@word.id
        synonymou.destroy
      end
    end

    @word.destroy
    respond_to do |format|
      format.html { redirect_to words_url, notice: 'Word was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_word
      @word = Word.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def word_params
      params.require(:word).permit(:text, :meanings_attributes => [:id, :text, :word_id, :category_id, :_destroy], :synonymous_attributes => [:id, :word_2_id, :_destroy])
    end
end
