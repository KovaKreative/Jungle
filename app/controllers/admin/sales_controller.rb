class Admin::SalesController < ApplicationController
  http_basic_authenticate_with name: ENV['USERNAME'], password: ENV['PASSWORD']

  def index
    @sales = Sale.all.order(:starts_on)
  end

  def new

  end

end
