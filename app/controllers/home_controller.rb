class HomeController < ApplicationController
    def index
      @query = params[:query]
      @books = @query.present? ? Book.search(@query) : []
    end
  end
  