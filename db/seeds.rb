puts 'Creating admin user...'
Administrator.create_with(password: 'admin')
  .find_or_create_by!(name: 'admin')

puts 'Creating example changelogs...'
changelogs = [
  {
    title: '项目初始版本发布',
    version: '1.0.0',
    published_at: '2023-01-15',
    content: "### 新功能\n- 博客文章发布功能\n- 用户评论系统\n- 管理员后台\n- 响应式设计，支持移动设备浏览\n\n### 说明\n这是我们的第一个正式版本，感谢所有贡献者的努力！"
  },
  {
    title: '用户体验优化更新',
    version: '1.1.0',
    published_at: '2023-03-25',
    content: "### 新功能\n- 新增文章归档页面\n- 添加标签管理功能\n- 支持Markdown格式编写文章\n\n### 优化\n- 改进页面加载速度\n- 优化移动端显示效果\n- 修复评论提交后刷新问题\n\n### Bug修复\n- 修复IE浏览器兼容性问题\n- 解决长文章加载缓慢的问题"
  },
  {
    title: '重大功能更新',
    version: '2.0.0',
    published_at: '2023-07-10',
    content: "### 重大更新\n- 全新设计的用户界面\n- 引入暗黑模式支持\n- 重构后端代码，提升性能\n\n### 新功能\n- 添加文章点赞功能\n- 新增用户个人主页\n- 支持代码高亮显示\n- 集成社交媒体分享按钮\n\n### 优化\n- 提升网站安全性\n- 优化SEO表现\n- 改进评论管理功能\n\n### Bug修复\n- 修复多个已知问题"
  },
  {
    title: '安全性更新',
    version: '2.1.0',
    published_at: '2023-10-05',
    content: "### 安全更新\n- 升级所有依赖库至最新版本\n- 加强密码安全策略\n- 实现CSRF保护机制\n\n### 新功能\n- 添加更新记录(Changelog)功能\n- 新增图片上传预览\n\n### 优化\n- 提升数据库查询效率\n- 优化移动端触摸体验\n\n### Bug修复\n- 修复IE11下的显示问题\n- 解决Safari浏览器下的兼容性问题"
  }
]

changelogs.each do |changelog_attrs|
  Changelog.find_or_create_by!(version: changelog_attrs[:version]) do |changelog|
    changelog.title = changelog_attrs[:title]
    changelog.content = changelog_attrs[:content]
    changelog.published_at = changelog_attrs[:published_at]
  end
end

puts 'Seed data created successfully!'