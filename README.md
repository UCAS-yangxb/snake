# snake

建这个仓库是为了熟悉整个 git 操作流程，内容是一个贪吃蛇游戏。

## 在线试玩

仓库开启 GitHub Pages 后，直接访问 Pages 地址即可开玩，入口是 `index.html`。

## 文件说明

| 文件 | 说明 |
| --- | --- |
| `index.html` | 游戏本体，用方向键或 WASD 控制 |
| `scores.html` | 成绩记录页，查看与清空历史最高分 |
| `LICENSE` | 开源许可 |

## 本地运行

直接双击 `index.html` 即可，无需构建、没有依赖。

最高分保存在浏览器的 `localStorage.snakeHighScore`，游戏页与成绩页共用这一份数据。

## 分支约定

- `main`：可发布的稳定版本
- `feature`：新功能开发，完成后通过 Pull Request 合并回 `main`
