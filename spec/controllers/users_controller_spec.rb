require 'rails_helper'

describe UsersController, type: :controller do
  routes { SemanticCmsDemo::Application.routes }
  login_user
  render_views

  context 'routing' do
    it 'get /admin/users' do
      expect(get: '/admin/users').to route_to(
        controller: 'users', action: 'index'
      )
    end

    it 'get /admin/users/new' do
      expect(get: '/admin/users/new').to route_to(
        controller: 'users', action: 'new'
      )
    end

    it 'post /admin/users' do
      expect(post: '/admin/users').to route_to(
        controller: 'users', action: 'create'
      )
    end

    it 'get /admin/users/1/edit' do
      expect(get: '/admin/users/1/edit').to route_to(
        controller: 'users', action: 'edit', id: '1'
      )
    end

    it 'put /admin/users/1' do
      expect(put: '/admin/users/1').to route_to(
        controller: 'users', action: 'update', id: '1'
      )
    end

    it 'delete /admin/users/1' do
      expect(delete: '/admin/users/1').to route_to(
        controller: 'users', action: 'destroy', id: '1'
      )
    end
  end
end
