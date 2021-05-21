class Manager::MembersController < ApplicationController
  before_action:authenticate_admin!
  def index
    @members = Member.all
  end
  
  def show
    @members = Member.find(params[:id])
  end
  
  def edit
  end
  
  def update
  end
end
