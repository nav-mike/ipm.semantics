class ResearchAreasController < ApplicationController
  def index
    @areas = ResearchArea.all.order(:created_at)
    uris = @areas.map(&:uri)
    url = 'https://api-lod-itmo-nav-mike.c9users.io/research_areas'

    conn = Faraday.new(url: url) do |faraday|
      faraday.adapter Faraday.default_adapter
      faraday.response :json
    end

    response = conn.get('find_by_uri', uri: uris)
    @result = response.body
  rescue => e
    @error = '<strong>При запросе к <i>lod.ifmo/REST</i> произошла ошибка!</strong><br /> Обратитесь к администратору для решения проблемы.'
    logger.tagged('ResearchAreasController', self.class) do
      logger.error e.message
      logger.error e.backtrace.join("\n")
    end
  end
end
