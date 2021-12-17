class XlsFormsController < ApplicationController

  def index
    @xls_form = XlsForm.new
  end

  def show

  end

  def create
    @xls_form = XlsForm.create(xls_form_params)
    if @xls_form.errors.empty?
      calculate_file
      redirect_to index
    end
  end

  def calculate_file
    path = ActiveStorage::Blob.service.send(:path_for, @xls_form.file.key)
    system " python #{Rails.root.to_s}/bin/market_mix_script.py #{path}"
  end

  private

  def xls_form_params
    params.require(:xls_form).permit(:email, :file)
  end
end
