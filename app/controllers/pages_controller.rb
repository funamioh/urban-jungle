class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def about
  end

  def contact
    @members = ["claire", "toni", "santi", "sarah", "oliver"]

    search = params[:member]

    if search
    @members = @members.select do |member|
      member.include? search.downcase
      end
    end
  end
end
