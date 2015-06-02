class UserController < ApplicationController
  def index
    all_users = User.all

    if params.count <= 2
      str_users = string_me(all_users)
      display(str_users)
    else
      # set parameter variables
      first_name_value = params.key?(:first_name) ? "#{params[:first_name]}%" : "%%"
      last_name_value  = params.key?(:last_name) ? "#{params[:last_name]}%" : "%%"
      age_value        = params.key?(:age) ? params[:age] : "%%"
      limit_value      = params.key?(:limit) ? params[:limit] : -1
      offset_value     = params.key?(:offset) ? params[:offset] : 0

      users = User.where(["first_name LIKE ? AND last_name LIKE ? AND age LIKE ?",
                            first_name_value, last_name_value, age_value]).
                            offset(offset_value).
                            limit(limit_value)

      puts "#{params}"
      str_users = string_me(users)
      display(str_users)
    end # params count cond
  end # index

  def show_via_id
    if User.exists?(params[:id])
      user = User.find(params[:id])
      puts "************ #{params} ************"
      render text: "#{user.id}) #{user.first_name} #{user.last_name} -- Age: #{user.age}", status: 200
    else
      error_404
    end
  end # show_method

  private

  def string_me(user_info)
    user_info.map do |user|
      "#{user.id}) #{user.first_name} #{user.last_name}  -- Age: #{user.age}"
    end
  end

  def display(user_info)
    puts "************ #{params} **************"
    render text: user_info.join("<img src='https://raw.githubusercontent.com/bertrandom/glitch-assets-parser/master/glitch-assets/cold_taco/cold_taco__x1_iconic_png_1354830854.png'/></p><p>"), status: 200
  end

  def error_404
    render text: "<p>NOT FOUND</p><img src='http://hellogiggles.hellogiggles.netdna-cdn.com/wp-content/uploads/2015/05/14/Flanders.jpg'/>", status: 404
  end
end #class
