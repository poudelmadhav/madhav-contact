class ApplicationController < ActionController::Base
  include Response

  def health_check
    commit = `git show --pretty=%H -q`
    result = {
      env: Rails.env,
      request_id: request.uuid,
      commit: commit.chomp
    }
    render json: result.merge(status: 'alive'), status: :ok
  end
end
