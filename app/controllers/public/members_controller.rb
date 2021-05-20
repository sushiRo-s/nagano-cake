class Public::MembersController < ApplicationController
  before_action:authenticate_member!

  def show
    @member = current_member
  end

  def edit
    @member = current_member
  end

  def update
    member = Member.find(params[:id])
    member.update(member_params)
    redirect_to public_member_path(member)
  end

  private

   def member_params
    params.require(:member).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :phone_number)
   end
end
