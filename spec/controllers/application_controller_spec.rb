require 'rails_helper'

describe ApplicationController, type: :controller do
  routes { SemanticCmsDemo::Application.routes }
  login_user
  render_views

  context 'get #department' do
    subject! { get :department }

    it 'should be success' do
      expect(response).to be_success
    end
  end

  context 'routing' do
    it '/admin/cube/department' do
      expect(get: '/admin/cube/department').to route_to(
        controller: 'application', action: 'department'
      )
    end

    it '/admin/cube/search' do
      expect(get: '/admin/cube/search').to route_to(
        controller: 'application', action: 'search'
      )
    end
  end
end
