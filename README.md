# openGym 中文云端版

基于 [openGym 官方项目](https://github.com/DuarteSantos8/openGym) v1.3.9，原提交 `e6c920eb0a657e57139798f60da40c934aec9301`。

完整可修改源码在 [opengym-source.tar.gz](opengym-source.tar.gz)；解压后保留原目录、中文词条、Node API、Supabase 适配、构建和测试脚本。仓库根目录 Dockerfile 解压该快照后执行现有构建，不更换应用架构。

待通过 Render Blueprint（根目录 `render.yaml`）部署。用户已选择新加坡 Render Free，接受网站空闲时休眠及再次访问时的启动等待；不挂载持久磁盘，自定义动作上传文件可能在服务重启或重新部署后丢失。账号、计划、训练记录、体重和设置继续保存在 Supabase，不依赖 Render 本地文件。当前尚未上线。

用户已允许 GitHub 仓库公开，并授权将现有 Supabase 后端秘密密钥提供给此 Render 服务。秘密密钥只在 Render 后台环境变量中配置，不写入公开仓库、源码包或前端。

源码包不含账号、训练记录、数据库备份、后端密钥、运行目录、依赖或第三方动作媒体。动作媒体沿用上游脚本在服务器运行时获取，需要自己的权利人授权。

代码遵循原 AGPL-3.0-or-later 许可；版权、原作者信息和第三方媒体 NOTICE 保留。Supabase 使用现有数据结构，不导入演示数据。
