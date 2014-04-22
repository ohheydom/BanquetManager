class TodolistsController < ApplicationController
  before_filter :authenticate_user!

  def show
    @clients = current_user.clients.future
  end
end
