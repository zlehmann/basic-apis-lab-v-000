class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = id
      req.params['client_secrete'] = secrete
      req.params['repo'] = 'admiralty'
    end
    render 'search'
  end
end
