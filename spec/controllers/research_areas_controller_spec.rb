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

  context 'get #public_index' do
    let!(:research_area) { FactoryGirl.create :research_area }
    subject! { get :public_index }

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

  context 'get #new' do
    subject! { get :new }

    it 'should be success' do
      expect(response).to be_success
    end
  end

  context 'post #create' do
    subject! { post :create, research_area: {uri: 'http://lod.ifmo.ru/page/ResearchArea1369'} }

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

    it 'get /research_areas' do
      expect(get: '/research_areas').to route_to(
        controller: 'research_areas', action: 'public_index'
      )
    end

    it 'get /admin/research_areas/new' do
      expect(get: '/admin/research_areas/new').to route_to(
        controller: 'research_areas', action: 'new'
      )
    end

    it 'post /admin/research_areas' do
      expect(post: '/admin/research_areas').to route_to(
        controller: 'research_areas', action: 'create'
      )
    end

    it 'delete /admin/research_areas/1' do
      expect(delete: '/admin/research_areas/1').to route_to(
        controller: 'research_areas', action: 'destroy', id: '1'
      )
    end
  end
end
