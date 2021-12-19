class XlsFormsController < ApplicationController

  def index
    @xls_form = XlsForm.new
  end

  def create
    @xls_form = XlsForm.create(xls_form_params)
    if @xls_form.errors.empty?
      res_file = calculate_file
      if res_file
        redirect_to controller: 'calc_results', calc_results: res_file
      else
        redirect_to error
      end
    end
  end

  def error

  end

  def calculate_file
    path = ActiveStorage::Blob.service.send(:path_for, @xls_form.file.key)
    ts = Time.now.to_i
    flag = system " python #{Rails.root.to_s}/bin/market_mix_script.py #{path} #{@xls_form.email} #{ts} #{Rails.root.to_s}"
    if flag
      "#{@xls_form.email}.#{ts}.csv"
    end
  end

  private

  def xls_form_params
    params.require(:xls_form).permit(:email, :file)
  end
end
