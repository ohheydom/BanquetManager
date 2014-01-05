class TodolistController < ApplicationController

  def six_week_schedule
    @clients = Client.future
  end
end
