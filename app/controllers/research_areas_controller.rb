class ResearchAreasController < ApplicationController
  def index
    @areas = ResearchArea.all.order(:created_at)
  end
end
