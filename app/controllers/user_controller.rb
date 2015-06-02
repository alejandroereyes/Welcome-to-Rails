class UserController < ApplicationController
  def index
    all_users = User.all
    str_users = all_users.map do |user|
      "First: #{user.first_name} Last: #{user.last_name} Age: #{user.age}"
    end
    render text: str_users.join("\n")
  end
end #class
