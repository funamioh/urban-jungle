class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def about
  end

  def contact
    @members = ["claire", "toni", "santi"]
  end
end
