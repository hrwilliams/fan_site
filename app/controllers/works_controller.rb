class WorksController < ApplicationController
  def index
    @subgenre = Subgenre.find(params[:subgenre_id])
    @work = @subgenre.works.new
    @works = @subgenre.works.order ('title')

  end

  def new
    @subgenre = Subgenre.find(params[:subgenre_id])
    @work = @subgenre.works.new
  end

  def create
    @subgenre = Subgenre.find(params[:subgenre_id])
    @work = @subgenre.works.new(work_params)
    if @work.save
      redirect_to subgenre_path(@work.subgenre)
    else
      render :new
    end
  end

  def edit
    @subgenre = Subgenre.find(params[:subgenre_id])
    @work = Work.find(params[:id])
  end

  def update
    @subgenre = Subgenre.find(params[:subgenre_id])
    @work = Work.find(params[:id])
    if @work.update(work_params)
      redirect_to subgenre_path(@subgenre)
    else
      render :edit
    end
  end

  def destroy
    @subgenre = Subgenre.find(params[:subgenre_id])
    @work = Work.find(params[:id])
    @work.destroy
    redirect_to subgenre_path(@subgenre)
  end


private
  def work_params
    params.require(:work).permit(:title, :artist, :year_created, :description, :subgenre_id)
  end
end
