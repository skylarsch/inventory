class ItemsController < ApplicationController
  def create
    @box = Box.find(params[:box_id])
    @item = @box.items.new(item_params)
    flash[:errors] = @item.errors.full_messages unless @item.save
    redirect_to box_path(@box)
  end

  def destroy
    @box = Box.find(params[:box_id])
    @item = @box.items.find(params[:id])
    @item.destroy
    redirect_to box_path(@box)
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
