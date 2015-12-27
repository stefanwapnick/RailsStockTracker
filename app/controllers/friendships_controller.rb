class FriendshipsController < ApplicationController

  def destroy
    @friendship = current_user.friendships.where(friend_id: params[:id]).first
    @friendship.destroy
    respond_to do |format|
      format.html{ redirect_to my_friends_path, notice: 'User remove from friend list.' }
    end
  end



end