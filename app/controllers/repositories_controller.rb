class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '355ed2defdd87d661789'
      req.params['client_secret'] = '099a67e8ea2fb757517a6094cca8d94218d94f6d'
      req.params['query'] = 'admiralty'
    end

    body = JSON.parse(@resp.body)
    if @resp.success?
      @venues = body["response"]["venues"]
    else
      @error = body["meta"]["errorDetail"]
    end
    render 'search'
  end
end
