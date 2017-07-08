class Web::EducationProgramsController < Web::ApplicationController
  before_action :set_education_program, only: [:show, :edit, :update, :destroy]

  def index
    @education_programs = EducationProgram.all
  end

  def show
  end

  def new
    @education_program = EducationProgram.new
  end

  def create
    @education_program = EducationProgram.new(education_program_params)

    if @education_program.save
      redirect_to education_programs_path, notice: "Education Program was successfully created"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @education_program.update(education_program_params)
      redirect_to education_program_path, notice: "Education Program was successfully updated"
    else
      render :edit
    end
  end

  def destroy
    @education_program.destroy
    redirect_to education_programs_path, notice: "Education Program was successfully destroyed"
  end

  private

  def education_program_params
    params.require(:education_program).permit(:title, :description)
  end

  def set_education_program
    @education_program = EducationProgram.find(params[:id])
  end
end

