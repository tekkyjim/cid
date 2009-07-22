class CharactersController < ResourceController::Base
  before_filter :require_user
end
