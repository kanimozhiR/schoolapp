class MarksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_mark, only: [:show, :edit, :update, :destroy]
  #before_action :set_rank, only: [:show, :edit, :update, :destroy]

  # GET /marks
  # GET /marks.json
  def index
    @marks = Mark.all
  end

  # GET /marks/1
  # GET /marks/1.json
  def show
  end

  # GET /marks/new
  def new
    @mark = Mark.new
  end

  # GET /marks/1/edit
  def edit
  end

  # POST /marks
  # POST /marks.json
  def create
    @mark = Mark.new(mark_params)
    respond_to do |format|
      if @mark.save
        format.html { redirect_to @mark, notice: 'Mark was successfully created.' }
        format.json { render :show, status: :created, location: @mark }
      else
        format.html { render :new }
        format.json { render json: @mark.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /marks/1
  # PATCH/PUT /marks/1.json
  def update
    respond_to do |format|
      if @mark.update(mark_params)
        format.html { redirect_to @mark, notice: 'Mark was successfully updated.' }
        format.json { render :show, status: :ok, location: @mark }
      else
        format.html { render :edit }
        format.json { render json: @mark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /marks/1
  # DELETE /marks/1.json
  def destroy
    @mark.destroy
    respond_to do |format|
      format.html { redirect_to marks_url, notice: 'Mark was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def initiate_rank
    student_mark = Student.all.pluck(:total_marks).compact
    sorted = student_mark.sort.uniq.reverse
    ranks = student_mark.map{|e| sorted.index(e) + 1}
    zip = student_mark.zip(ranks)
    zip.each do |i|
      Student.where(total_marks: i.first).update(rank: i.last)
    end
    redirect_to students_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mark
      @mark = Mark.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mark_params
      params.require(:mark).permit(:mark, :subject_id, :student_id)
    end
end
