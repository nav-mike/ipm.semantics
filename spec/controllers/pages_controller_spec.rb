require 'rails_helper'

describe PagesController, type: :controller do
  routes { SemanticCmsDemo::Application.routes }
  login_user
  render_views

  context 'routing' do
    it 'get /admin/pages' do
      expect(get: '/admin/pages').to route_to(
        controller: 'pages', action: 'index'
      )
    end

    it 'get /admin/pages/new' do
      expect(get: '/admin/pages/new').to route_to(
        controller: 'pages', action: 'new'
      )
    end

    it 'post /admin/pages' do
      expect(post: '/admin/pages').to route_to(
        controller: 'pages', action: 'create'
      )
    end

    it 'get /admin/pages/1/edit' do
      expect(get: '/admin/pages/1/edit').to route_to(
        controller: 'pages', action: 'edit', id: '1'
      )
    end

    it 'put /admin/pages/1' do
      expect(put: '/admin/pages/1').to route_to(
        controller: 'pages', action: 'update', id: '1'
      )
    end

    it 'delete /admin/pages/1' do
      expect(delete: '/admin/pages/1').to route_to(
        controller: 'pages', action: 'destroy', id: '1'
      )
    end
  end
end
