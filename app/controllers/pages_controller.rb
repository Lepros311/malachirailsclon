class PagesController < ApplicationController
  def home
    @posts = Post.all
  end

  def pricing
  end

  def privacy
  end
end
