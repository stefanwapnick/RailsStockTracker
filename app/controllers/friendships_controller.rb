class FriendshipsController < ApplicationController

  def destroy

    @friendship = current_user.friendships.where(friend_id: params[:id]).first

    if @friendship
      @friendship.destroy
      respond_to do |format|
        format.html{ redirect_to my_friends_path, notice: 'User remove from friend list.' }
      end
    else
      flash[:error] = 'Could not delete friendship relationship'
      redirect_to my_portfolio_path
    end

  end



end