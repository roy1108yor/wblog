class ChangelogsController < ApplicationController
  def index
    @changelogs = Changelog.by_published_date.page(params[:page])
  end
end