class GroupsController < ApplicationController
  def new
    @group = Group.new
  end
  def edit
  end
  def create
    @group = Group.create(groups_params)
    redirect_to action: :index, controller: :messages
  end

  private
  def groups_params
    params.require(:group).permit(:name, {user_ids: [] })
  end
end
