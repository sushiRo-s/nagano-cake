class Manager::MembersController < ApplicationController
  before_action:authenticate_admin!
end
