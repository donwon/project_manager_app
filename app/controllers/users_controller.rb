class UsersController < ApplicationController

def login

  session[:logged_in?] = true
  puts session[:logged_in?]
  redirect_to projects_path, notice: "You are now signed in"

end

def logout
  session[:logged_in?] = false
  redirect_to projects_path, notice: "You have successfully logged out"
end
end
