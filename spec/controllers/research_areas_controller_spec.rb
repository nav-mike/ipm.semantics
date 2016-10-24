require 'rails_helper'

describe ResearchAreasController, type: :controller do
  routes { SemanticCmsDemo::Application.routes }
  login_user
  render_views

  context 'get #index' do
    subject! { get :index }

    it 'should be success' do
      expect(response).to be_success
    end
  end

  context 'delete #destroy' do
    let!(:research_area) { FactoryGirl.create :research_area }
    subject! { delete :destroy, id: research_area.id }

    it 'should be success' do
      expect(response).to redirect_to(research_areas_url)
    end
  end

  context 'routing' do
    it 'get /admin/research_areas' do
      expect(get: '/admin/research_areas').to route_to(
        controller: 'research_areas', action: 'index'
      )
    end

    it 'delete /admin/research_areas/1' do
      expect(delete: '/admin/research_areas/1').to route_to(
        controller: 'research_areas', action: 'destroy', id: '1'
      )
    end
  end
end
