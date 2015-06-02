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
      str_users = string_me(users)
      display(str_users)
    end # params count cond
  end # index

  def show_via_id
    if User.exists?(params[:id])
      user = User.find(params[:id])
      puts "************ #{params} ************" # delete this later
      render text: "#{user.id}) #{user.first_name} #{user.last_name} -- Age: #{user.age}", status: 200
    elsif params[:id] == "create"
      puts "!!!!!!!!  in create  !!!!!!!!"
      puts "#{params}"
      User.create(first_name: params[:first_name], last_name: params[:last_name], age: params[:age])
      render text: "<p>User: #{params[:first_name]} #{params[:last_name]} Age: #{params[:age]} has been created</p><img src='https://bookwormcowboy.com/images/USA.gif'/>", status: 200
    else
      error_404
    end
  end # show_method

  def delete
    puts "************* #{params} *************"
    if User.exists?(params[:id])
      User.delete(params[:id])
      render text: "User #{params[:id]} has been DELETED <img src='http://media.giphy.com/media/25quInpfBuSRi/giphy.gif'/>", status: 200
    else
      error_404
    end
  end # delete

  def create
    puts "*********** #{params} ***********"
    render text: "almost there buddy #{params}", status: 200
  end

  private

  def string_me(user_info)
    user_info.map do |user|
      "#{user.id}) #{user.first_name} #{user.last_name}  -- Age: #{user.age}"
    end
  end

  def display(user_info)
    puts "************ #{params} **************" #delete this later
    render text: user_info.join("<img src='https://raw.githubusercontent.com/bertrandom/glitch-assets-parser/master/glitch-assets/cold_taco/cold_taco__x1_iconic_png_1354830854.png'/></p><p>"), status: 200
  end

  def error_404
    render text: "<p>NOT FOUND</p><img src='http://hellogiggles.hellogiggles.netdna-cdn.com/wp-content/uploads/2015/05/14/Flanders.jpg'/>", status: 404
  end
end #class
