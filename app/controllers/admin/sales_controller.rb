class Admin::SalesController < ApplicationController

  def index
    @sales = Sale.all.order(:starts_on)
  end

  def new

  end

end