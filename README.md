# snake

建这个仓库是为了熟悉整个 git 操作流程，内容是一个霓虹视觉风格的贪吃蛇游戏。

## 在线试玩

- 游戏：https://ucas-yangxb.github.io/snake/
- 成绩记录：https://ucas-yangxb.github.io/snake/scores.html

## 文件说明

| 文件 | 说明 |
| --- | --- |
| `index.html` | 游戏本体，用方向键或 WASD 控制，结束后可跳转到成绩页 |
| `scores.html` | 成绩记录页，查看与清空历史最高分 |
| `Dockerfile` | 用 nginx 托管静态页面的镜像定义 |
| `.github/workflows/publish-image.yml` | 自动构建镜像并推送到 ghcr.io 的工作流 |
| `LICENSE` | 开源许可（Apache-2.0） |

## 本地运行

直接双击 `index.html` 即可，无需构建、没有依赖。

最高分保存在浏览器的 `localStorage.snakeHighScore`，游戏页与成绩页共用这一份数据。

## 容器运行

镜像公开托管在 GitHub Packages，可以直接拉取运行：

```bash
docker run -p 8080:80 ghcr.io/ucas-yangxb/snake:latest
# 浏览器打开 http://localhost:8080
```

镜像标签的生成规则：

| 触发方式 | 产生的标签 |
| --- | --- |
| 推送 `v*` 版本标签 | `1.2.0`、`1.2`、`latest` |
| 推送到 `main` | `main`、`sha-<短SHA>` |
| 手动触发工作流 | 按分支名与提交打标签，可额外指定一个标签 |

镜像基于 `nginx:1.27-alpine`，内部只包含 `index.html` 与 `scores.html` 两个页面，并配置了 `HEALTHCHECK`。

## 分支约定

- `main`：可发布的稳定版本，每次提交都会自动构建镜像
- 功能开发走独立分支（例如 `feat/xxx`、`docs/xxx`），完成后通过 Pull Request 合并回 `main`
