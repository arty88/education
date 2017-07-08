class Web::TestsController < Web::ApplicationController
  before_action :set_test, only: [:show, :edit, :update, :destroy]

  def index
    @tests = Test.all
  end

  def show
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)

    if @test.save
      redirect_to tests_path, notice: "Test was successfully created"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @test.update(test_params)
      redirect_to test_path, notice: "Test was successfully updated"
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to tests_path, notice: "Test was successfully destroyed"
  end

  private

  def test_params
    params.require(:test).permit(:title, :description)
  end

  def set_test
    @test = Test.find(params[:id])
  end
end
