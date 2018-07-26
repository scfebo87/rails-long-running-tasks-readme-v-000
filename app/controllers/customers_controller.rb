class CustomersController < ApplicationController
  require 'csv'

  def index
    @customers = Customer.all
  end
  
  def upload 
    CSV.forEach(params[:leads].path, headers: true) do |lead|
      Customer.create(email: lead[0], first_name: lead[1], last_name: lead[2])
      end
    redirect_t0 customers_path
  end
end
