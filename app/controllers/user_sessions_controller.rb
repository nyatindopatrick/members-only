# frozen_string_literal: true

class UserSessionsController < ApplicationController
  def new; end

  def create
    if login(params[:email], params[:password])
      redirect_to(posts_path, notice: 'Logged in successfully.')
    else
      flash.now.alert = 'Login failed.'
      render action: :new
    end
  end

  def destroy
    logout
    redirect_to(posts_path, notice: 'Logged out!')
  end
end
