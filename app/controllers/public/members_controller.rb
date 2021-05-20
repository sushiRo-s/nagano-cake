class Public::MembersController < ApplicationController
  before_action:authenticate_member!

  def show
    @member = current_member
  end

  def edit
    @member = current_member
  end

  def update
    member = current_member
    member.update(member_params)
    redirect_to public_member_path(member)
  end

  def unsubscribe
  end

  def withdrawal
    member =current_member
    # destroyじゃないのでDBの情報は消えてない
    member.update(is_deleted: true)
    # ログアウトする
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end

  private

   def member_params
    params.require(:member).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :phone_number)
   end
end


