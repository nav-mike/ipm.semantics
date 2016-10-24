require 'rails_helper'

describe ResearchAreasController, type: :controller do
  routes { SemanticCmsDemo::Application.routes }
  login_user
  render_views

  context 'get #index active' do
    subject! { get :index }

    it 'should be success' do
      expect(response).to be_success
    end
  end

  context 'routing' do
    it 'get /admin/research_areas' do
      expect(get: '/admin/research_areas').to route_to(
        controller: 'research_areas', action: 'index'
      )
    end
  end
end
