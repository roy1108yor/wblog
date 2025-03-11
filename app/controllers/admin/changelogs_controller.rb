class Admin::ChangelogsController < Admin::BaseController
  def index
    @changelogs = Changelog.by_published_date
  end

  def new
    @changelog = Changelog.new
  end

  def create
    @changelog = Changelog.new(changelog_params)

    if @changelog.save
      flash[:notice] = '创建更新记录成功'
      redirect_to admin_changelogs_path
    else
      flash.now[:error] = '创建失败'
      render :new, status: 422
    end
  end

  def edit
    @changelog = Changelog.find(params[:id])
  end

  def update
    @changelog = Changelog.find(params[:id])

    if @changelog.update(changelog_params)
      flash[:notice] = '更新记录修改成功'
      redirect_to admin_changelogs_path
    else
      flash[:error] = '更新记录修改失败'
      render :edit
    end
  end

  def destroy
    @changelog = Changelog.find(params[:id])
    if @changelog.destroy
      flash[:notice] = '删除更新记录成功'
      redirect_to admin_changelogs_path
    else
      flash[:error] = '删除更新记录失败'
      redirect_to admin_changelogs_path
    end
  end

  private
  
  def changelog_params
    params.require(:changelog).permit(:title, :content, :version, :published_at)
  end
end