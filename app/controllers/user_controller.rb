class UserController < ApplicationController
  def index
    all_users = User.all
    str_users = all_users.map do |user|
      "#{user.id}) #{user.first_name} #{user.last_name}  -- Age: #{user.age}"
    end
    render text: str_users.join("</p><p>")
  end
end #class
