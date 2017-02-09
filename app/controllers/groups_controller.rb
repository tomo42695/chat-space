class GroupsController < ApplicationController
  before_action :set_groups, only: %i(update edit)
  def index
  end

  def new
    @group = Group.new
    binding.pry
  end

  def edit
  end

  def search
    @users = User.where('name LIKE ?', "%#{params[:name]}%")
    render :new_group_message, json: @users
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
    params.require(:group).permit(:name, { user_ids: [] })
  end

  def set_groups
    @group = Group.find(params[:id])
  end
end
