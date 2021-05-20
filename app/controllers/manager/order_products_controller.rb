class Manager::OrderProductsController < ApplicationController
  before_action:authenticate_admin!
end
