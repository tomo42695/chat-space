class GroupsController < ApplicationController
  before_action :set_groups, only: %i(update edit)
  def index
    @group = Group.find(1)
  end

  def new
    @group = Group.new
  end

  def edit
  end

  def update
    @group.update(groups_params)
    redirect_to action: :index
  end

  def create
    @group = Group.create(groups_params)
    redirect_to action: :index
  end

  private

  def groups_params
    params.require(:group).permit(:name, {user_ids: [] })
  end

  def set_groups
    @group = Group.find(params[:id])
  end
end
