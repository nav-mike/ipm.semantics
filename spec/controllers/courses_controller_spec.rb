require 'rails_helper'

describe CoursesController, type: :controller do
  routes { SemanticCmsDemo::Application.routes }
  login_user
  render_views

  context 'routing' do
    it 'get /admin/courses' do
      expect(get: '/admin/courses').to route_to(
        controller: 'courses', action: 'index'
      )
    end

    it 'get /admin/courses/new' do
      expect(get: '/admin/courses/new').to route_to(
        controller: 'courses', action: 'new'
      )
    end

    it 'post /admin/courses' do
      expect(post: '/admin/courses').to route_to(
        controller: 'courses', action: 'create'
      )
    end

    it 'get /admin/courses/1/edit' do
      expect(get: '/admin/courses/1/edit').to route_to(
        controller: 'courses', action: 'edit', id: '1'
      )
    end

    it 'put /admin/courses/1' do
      expect(put: '/admin/courses/1').to route_to(
        controller: 'courses', action: 'update', id: '1'
      )
    end

    it 'delete /admin/courses/1' do
      expect(delete: '/admin/courses/1').to route_to(
        controller: 'courses', action: 'destroy', id: '1'
      )
    end
  end
end
