class BoxesController < ApplicationController
  def index
    @boxes = Box.all.order(created_at: :desc)
  end

  def show
    @box = Box.find(params[:id])
  end

  def edit
    @box = Box.find(params[:id])
  end

  def new
    @box = Box.new
  end

  def update
    @box = Box.find(params[:id])
    if @box.update_attributes(box_params)
      flash[:messages] = ['Updated']
      redirect_to box_path(@box)
    else
      flash[:errors] = @box.errors.full_messages
      render :edit
    end
  end

  def create
    @box = Box.new(box_params)
    if @box.save
      flash[:messages] = ['Created']
      redirect_to box_path(@box)
    else
      flash[:errors] = @box.errors.full_messages
      render :new
    end
  end

  def report
    @boxes = Box.all.order(created_at: :desc)
    render plain: ReportPresenter.new(@boxes).to_s
  end

  private

  def box_params
    params.require(:box).permit(:location, :kind)
  end
end
