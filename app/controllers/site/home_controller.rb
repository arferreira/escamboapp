class Site::HomeController < ApplicationController
  layout "site"
  #before_action :athenticate_member!

  def index
    @categories = Category.all
  end
end
