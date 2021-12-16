class XlsFormsController < ApplicationController

  def index
    @xls_form = XlsForm.new
  end

  def create
    @xls_form = XlsForm.create(xls_form_params)
    if @xls_form.errors.empty?
      redirect_to index
    end
  end

  private

  def xls_form_params
    params.require(:xls_form).permit(:email, :file)
  end
end
