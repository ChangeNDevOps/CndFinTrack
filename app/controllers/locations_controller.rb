class LocationsController < ApplicationController
  def provinces
    country = Carmen::Country.coded(params[:country_code])
    provinces = country.subregions.map { |s| [ s.name, s.code ] }
    render json: provinces
  end
end
