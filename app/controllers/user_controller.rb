class UserController < ApplicationController
  def index
    all_users = User.all
    str_users = all_users.map do |user|
      "#{user.id}) #{user.first_name} #{user.last_name}  -- Age: #{user.age}"
    end
    render text: str_users.join("<img src='https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQSZtVW5LGRTaFgB3cG1QpoxEg6ehUGx5z6yW5gepq_LUUkdqyhHS5VHw'/></p><p>")
  end

  def show
    if User.exists?(params[:id])
      user = User.find(params[:id])
      render text: "#{user.id}) #{user.first_name} #{user.last_name} -- Age: #{user.age}"
    else
      error_404
    end
  end

  private
  def error_404
    render text: "<p>NOT FOUND</p><img src='http://hellogiggles.hellogiggles.netdna-cdn.com/wp-content/uploads/2015/05/14/Flanders.jpg'/>", status: 404
  end
end #class
