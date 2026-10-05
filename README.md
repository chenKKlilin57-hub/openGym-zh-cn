# openGym 中文云端版

基于 [openGym 官方项目](https://github.com/DuarteSantos8/openGym) v1.3.9，原提交 `e6c920eb0a657e57139798f60da40c934aec9301`。

完整可修改源码在 [opengym-source.tar.gz](opengym-source.tar.gz)；解压后保留原目录、中文词条、Node API、Supabase 适配、构建和测试脚本。仓库根目录 Dockerfile 解压该快照后执行现有构建，不更换应用架构。

通过 Render Blueprint（根目录 `render.yaml`）部署，数据库秘密密钥只在托管后台配置。默认使用新加坡 Starter 服务和 1 GB 持久磁盘；实际创建前确认平台价格及费用。

源码包不含账号、训练记录、数据库备份、后端密钥、运行目录、依赖或第三方动作媒体。动作媒体沿用上游脚本在服务器运行时获取，需要自己的权利人授权。

代码遵循原 AGPL-3.0-or-later 许可；版权、原作者信息和第三方媒体 NOTICE 保留。Supabase 使用现有数据结构，不导入演示数据。
