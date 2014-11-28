class InfoController < ApplicationController
  def find_microposts
    @allUsers = User.all
    @mp = Hash.new
    @allUsers.each do |user|
      @mp[user.id]  = user.microposts
    end
  end
end
