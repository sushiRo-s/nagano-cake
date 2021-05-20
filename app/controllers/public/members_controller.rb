class Public::MembersController < ApplicationController
  before_action:authenticate_member

  def show
    @member = current_member
  end

  def edit
   @member = Member.find(current_member.id)
  end

  # def update
  #   @member = Member.find(current_member.id)
  #   if @member.update(member_params)
  #     redirect_to members_mems_path
  #   else
  #     render 'edit'
  #   end
  # end
end
