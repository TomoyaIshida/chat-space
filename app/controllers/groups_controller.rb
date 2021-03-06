class GroupsController < ApplicationController

  before_action :get_group, only: [:edit, :update]

  def index
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to group_messages_path(@group.id), notice: "グループを作成しました"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to group_messages_path(@group.id), notice: "チャットグループが更新されました"
    else
      render :edit
    end
  end

  private
  def group_params
    params.require(:group).permit(:groupname, user_ids: [])
  end

  def get_group
    @group = Group.find(params[:id])
  end
end
