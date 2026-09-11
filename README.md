# Haoyang Li — Personal Homepage

基于 AcadHomepage 的英文个人主页。线上目标：https://Oxygennnnn.github.io 。首页内容来自本人简历；原始 PDF 不随网站发布。

## 日常修改

- 首页文字、教育、研究、实习、荣誉、技能：`_pages/about.md`。
- 姓名、邮箱、GitHub、站点标题与描述：`_config.yml`；修改后重启预览。
- 菜单及锚点：`_data/navigation.yml`，锚点应与首页标题后的 `{#...}` 一致。
- 头像：`images/profile.jpg`；没有文件时显示 HL。
- 项目图：`images/projects/{recapa,gba-net,federated-face-recognition,evoagentx-memory}.png`。文件不存在时不输出图片。
- 分享图：可选 `images/social-preview.png`，1200×630 PNG。
- 图标：`images/favicon.svg`。

## 本地预览

```bash
cd /Users/oxygen/Desktop/homepage/acad-homepage.github.io
bash run_server.sh
```

浏览 http://127.0.0.1:4000 。按 Ctrl+C 停止。配置文件修改后需要重启。

本次使用 macOS 系统 Ruby 2.6.10，Bundler 2.2.19，以及锁定的 github-pages 215 / Jekyll 3.9.0。Gemfile.lock 仅增加当前 macOS 平台。依赖放在被 Git 忽略的 vendor/bundle，Bundler 放在 /private/tmp/homepage-gems。临时目录可能在重启或系统清理后消失，可重新安装隔离 Bundler：

```bash
gem install bundler -v 2.2.19 --install-dir /private/tmp/homepage-gems --no-document
export GEM_HOME=/private/tmp/homepage-gems
export GEM_PATH=/private/tmp/homepage-gems
export PATH="/private/tmp/homepage-gems/bin:$PATH"
bundle config set --local path vendor/bundle
bundle install
bundle exec jekyll build --safe
bash run_server.sh
```

不使用 sudo，不执行整体 bundle update。更换 Ruby 后需重新安装对应依赖。

## 文件如何组成网页

`_config.yml` 提供全局 YAML 数据；`_data/navigation.yml` 提供导航。`_pages/about.md` 的 YAML front matter 设置根路径，Markdown 正文经 Kramdown 转换，Liquid 变量和 include 组成内容；`_layouts/default.html` 调用 `_includes/` 中的头部、导航、侧栏、脚本和 SEO，输出 HTML。`assets/css/main.scss` 汇总 `_sass/` 样式并编译 CSS；`images/` 和 `assets/` 的静态文件被复制到 `_site/`。

`Gemfile` 声明依赖，`Gemfile.lock` 锁定版本，`run_server.sh` 负责预览。`_site/` 是产物，不提交。Jekyll 的 exclude 防止内容出现在网站；`.gitignore` 防止未跟踪文件被提交，两者用途不同。

## GitHub Pages

本仓库使用 Settings → Pages → Deploy from a branch → main → / (root)。无需添加自定义 Pages 部署工作流或 .nojekyll。

Scholar 工作流仅保留手动入口且 job 永远跳过，不定时运行、不写分支；前端引用统计也已禁用。`google_scholar_crawler/` 保留为未使用的模板功能，不进入网站。未设置 Analytics。

## Template attribution

Based on [AcadHomepage](https://github.com/RayeRen/acad-homepage.github.io) by Yi Ren. The original MIT license is retained in LICENSE.

- Font Awesome: SIL OFL 1.1 and MIT License.
- Influenced by [Minimal Mistakes](https://github.com/mmistakes/minimal-mistakes), MIT License.
- Influenced by [Academic Pages](https://github.com/academicpages/academicpages.github.io), MIT License.

The original template documentation is retained in docs/ and excluded from the generated website.
