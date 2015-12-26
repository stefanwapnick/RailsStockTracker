class StocksController < ApplicationController

  def search

    if params[:stock]
      @stock = Stock.find_by_ticker(params[:stock])
      @stock ||= Stock.new_from_lookup(params[:stock])        # If stock still nil, look up new stock using api
    end


    if @stock
      #render json: @stock
      render partial: 'lookup'
    else
      render status:  :not_found, nothing: true
    end


  end
end