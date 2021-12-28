class CalcResultsController < ApplicationController

  def index
    if params[:calc_results]
      @pdf_path = params[:calc_results]
    end
  end
end
