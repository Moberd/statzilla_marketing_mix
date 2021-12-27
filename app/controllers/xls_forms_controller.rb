class XlsFormsController < ApplicationController

  def index
    @xls_form = XlsForm.new
  end

  def create
    @user = User.find_or_create_by(user_params)
    @user.save
    @xls_form = @user.xls_forms.create(xls_form_params)
    if @xls_form.errors.empty?
      res_file = calculate_file @user.email
      if res_file
        @xls_form.file_name = res_file
        @xls_form.save
        redirect_to controller: 'calc_results', calc_results: res_file
      else
        render 'xls_forms/error'
      end
    end
  end

  def error; end

  def calculate_file(user_email)
    path = ActiveStorage::Blob.service.send(:path_for, @xls_form.file.key)
    ts = Time.now.to_i
    file_extension = File.extname(@xls_form.file.filename.to_s)
    if ['.csv', '.xls', '.xlsx'].include?(file_extension)
      flag = system " python #{Rails.root.to_s}/bin/market_mix_script.py #{path} #{user_email} #{ts} #{Rails.root.to_s} #{file_extension}"
      if flag
        "#{user_email}.#{ts}.pdf"
      end
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
