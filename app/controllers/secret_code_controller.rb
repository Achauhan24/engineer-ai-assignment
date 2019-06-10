class SecretCodeController < ApplicationController
  load_and_authorize_resource

  def index
    @secret_codes = SecretCode.all.page(versions_params[:page]).per(50)
    render :index
  end

  def create
    if permit_code_count_param[:code_count]
      (1..permit_code_count_param[:code_count].to_i).each do |x|
        SecretCode.create
      end
    end
    render :index
  end

  private

  def permit_code_count_param
    params.permit(:code_count)
  end

  def versions_params
    params.permit(:page, :page_limit)
  end
end
