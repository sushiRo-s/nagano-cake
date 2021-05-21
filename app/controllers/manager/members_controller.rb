class Manager::MembersController < ApplicationController
  before_action:authenticate_admin!
  def index
    @members = Member.all
  end
  
  def show
    @members = Member.find(params[:id])
  end
  
  def edit
      @members = Member.find(params[:id])
  end
  
  def update
    member = Member.find(params[:id])
    member.save
    @members = Member.find(params[:id])
    render 'show'
  end
end
