class CitiesController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:get_suggestions]

  def get_suggestions
    keyword = params[:keyword]
    suggestions = City.where("city LIKE?", "%#{keyword}%").select("city as value, code as code").map {|s| {value: s.value, code: s.code}}
    render :json => suggestions
  end
end
