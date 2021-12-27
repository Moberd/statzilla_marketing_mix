class CalcResultsController < ApplicationController

  def index
    @pdf_attach = File.join("#{Rails.root.to_s}/storage/results/#{params[:calc_results]}")
    send_file(@pdf_attach, filename: "your_document.pdf", disposition: 'inline', type: "application/pdf")
    if params[:calc_results]
      @data = "#{Rails.root.to_s}/storage/results/#{params[:calc_results]}"
    end
    end
end
