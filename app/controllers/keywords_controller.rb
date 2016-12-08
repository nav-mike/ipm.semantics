require 'sparql/client'

class KeywordsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i(index)

  def index
    render layout: 'public'
  end
end
