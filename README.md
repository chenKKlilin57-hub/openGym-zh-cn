# openGym 中文云端版

基于 [openGym 官方项目](https://github.com/DuarteSantos8/openGym) v1.3.9，原提交 `e6c920eb0a657e57139798f60da40c934aec9301`。

完整可修改源码在 [opengym-source.tar.gz](opengym-source.tar.gz)；解压后保留原目录、中文词条、Node API、Supabase 适配、构建和测试脚本。仓库根目录 Dockerfile 解压该快照后执行现有构建，不更换应用架构。

正式入口：**https://opengym-zh-cn.onrender.com/**。公开仓库：[openGym-zh-cn](https://github.com/chenKKlilin57-hub/openGym-zh-cn)。网站已在新加坡 Render Free 完成 Docker 构建并上线；上线代码提交为 `7de6e28505e0d9fd3d156c27d3f01c47b411e85f`。开放注册配置重启也已 Live，支持密码登录并默认简体中文。

Render Free 空闲时会休眠，再次访问需要等待唤醒；没有持久盘，自定义动作上传文件及媒体缓存会在休眠、重启或重新部署时丢失。账号、计划、训练记录、体重和设置继续保存在 Supabase，不依赖 Render 本地文件。秘密密钥只在 Render 后台环境变量中配置，不写入公开仓库、源码包或前端。

本机正式 `main` 服务已停止，演示 http://localhost:8082/ 使用独立的 `demo` 命名空间保留。同一 Supabase 命名空间不要并行运行多个 API 实例。回切本机必须先暂停 Render，然后在解压后的项目目录执行 `python3 private/cloud/local.py start`；查看状态用 `status`，停止用 `stop`。恢复云端前先停止本机 `main`。

维护时查看 Render 部署状态和日志，确认 HTTPS `/api/health` 返回 200、`/api/config` 的 `invite_only` 符合预期。当前关闭自动部署；源码更新后重新生成并提交完整源包及根目录构建文件，再手动部署对应提交。详细数据备份与回切说明见源码包中的 `private/cloud/README.md`。

线上构建和 1,324 张图片、1,324 个 GIF 下载已通过；健康与配置接口、动作媒体及公开源码下载均返回 200，未登录读取训练数据返回 401。实际 Supabase 快照与部署前备份比较，正式训练、密码认证资料和会话密钥均未改变；正式环境未创建测试用户。伪造 `CF-Connecting-IP` 的请求返回 403，伪造 `X-Forwarded-For` 不能绕过设备绑定 `link` 限流；跨出口区分尚未验证，正式账号密码登录也未验证。

源码包不含账号、训练记录、数据库备份、后端密钥、运行目录、依赖或第三方动作媒体。动作媒体沿用上游脚本在服务器运行时获取，需要自己的权利人授权。

代码遵循原 AGPL-3.0-or-later 许可；版权、原作者信息和第三方媒体 NOTICE 保留。Supabase 使用现有数据结构，不导入演示数据。
