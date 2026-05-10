# LIANSONG'S Blog

这是 `https://yeliansong.github.io` 的 Hugo 静态博客源码仓库，主题使用 `LoveIt`。

## 目录说明

- `content/`: 博客文章和页面内容
- `layouts/`: 对 LoveIt 主题的本地模板覆盖
- `themes/LoveIt/`: 主题源码
- `archetypes/`: 新文章模板
- `public/`: Hugo 构建产物，已忽略，不作为源码提交
- `resources/_gen/`: Hugo 生成缓存，已忽略

## 本地预览

```bash
hugo server -D
```

默认访问地址是 `http://localhost:1313/`。

## 构建

```bash
hugo --cleanDestinationDir
```

构建结果会生成到 `public/`。

## 部署

```bash
./deploy.sh
```

部署脚本会先执行干净构建，然后把 `public/` 同步到相邻的 GitHub Pages 仓库：

```text
../../hugo_public/yeliansong.github.io/
```

运行部署前请确认该目录存在，并且已配置好对应的 Git 远端。

## 新建文章

```bash
hugo new posts/my-new-post/index.zh-cn.md
```

如需英文版本，可在同一文章目录下维护 `index.en.md`。
