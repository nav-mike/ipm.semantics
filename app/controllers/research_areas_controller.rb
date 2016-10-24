class ResearchAreasController < ApplicationController
  before_action :set_area, only: :destroy

  def index
    @areas = ResearchArea.all.order(:created_at)
    return if @areas.size <= 0
    render_areas
  rescue => e
    @error = '<strong>При запросе к <i>lod.ifmo/REST</i> произошла ошибка!</strong><br /> Обратитесь к администратору для решения проблемы.'
    logger.tagged('ResearchAreasController', self.class) do
      logger.error e.message
      logger.error e.backtrace.join("\n")
    end
  end

  def new
    url = "#{Rails.configuration.x.lod_ifmo_api_url}/research_areas.json"

    conn = Faraday.new(url: url) do |faraday|
      faraday.adapter Faraday.default_adapter
      faraday.response :json
    end

    response = conn.get('')
    @areas = response.body
  end

  def destroy
    @area.destroy
    redirect_to research_areas_url
  end

  private

  def render_areas
    uris = @areas.map(&:uri)
    url = "#{Rails.configuration.x.lod_ifmo_api_url}/research_areas"

    conn = Faraday.new(url: url) do |faraday|
      faraday.adapter Faraday.default_adapter
      faraday.response :json
    end

    response = conn.get('find_by_uri', uri: uris)
    @result = response.body
  end

  def set_area
    @area = ResearchArea.find params[:id]
  end
end
