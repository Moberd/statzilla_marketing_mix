class XlsFormsController < ApplicationController

  def index
    @xls_form = XlsForm.new
  end

  def create
    params_ = xls_form_params
    @user = User.find_or_create_by(user_params)
    # @usr = User.find_by_email(:email)
    # @user.name = params_["name"]

    @user.save
    @xls_form = @user.xls_forms.create(xls_form_params)
    if @xls_form.errors.empty?
      res_file = calculate_file @user.email 
      if res_file
        @xls_form.file_name = res_file
        @xls_form.save
        redirect_to controller: 'calc_results', calc_results: res_file
      else
        redirect_to error
      end
    end
  end

  def error
    render "что то не так сделал"
  end

  def calculate_file(user_email)
    path = ActiveStorage::Blob.service.send(:path_for, @xls_form.file.key)
    ts = Time.now.to_i
    flag = system " python #{Rails.root.to_s}/bin/market_mix_script.py #{path} #{user_email} #{ts} #{Rails.root.to_s}"
    if flag
      "#{user_email}.#{ts}.csv"
    end
  end

  private

  def xls_form_params
    params.require(:xls_form).permit(:file)
  end

  def user_params
    params.require(:xls_form).permit(:email, :name)
  end

end
