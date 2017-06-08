class GroupsController < ApplicationController

  def index
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path, notice: "グループを作成しました"
    else
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    if Group.find(params[:id]).update(group_params)
      redirect_to root_path, notice: "チャットグループが更新されました"
    else
      redirect_to action: :edit
    end
  end

  private
  def group_params
    params.require(:group).permit(:groupname, user_ids: [])
  end
end

