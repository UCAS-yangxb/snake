# 霓虹贪吃蛇 · 静态站点镜像
#
# 构建：docker build -t ghcr.io/ucas-yangxb/snake:latest .
# 运行：docker run -p 8080:80 ghcr.io/ucas-yangxb/snake:latest
# 然后浏览器打开 http://localhost:8080

FROM nginx:1.27-alpine

# 这一行让包自动关联到仓库，否则不会出现在仓库的 Packages 页面
LABEL org.opencontainers.image.source="https://github.com/UCAS-yangxb/snake" \
      org.opencontainers.image.title="snake" \
      org.opencontainers.image.description="霓虹贪吃蛇：纯静态网页游戏，含游戏页与成绩记录页" \
      org.opencontainers.image.licenses="Apache-2.0"

# 游戏页与成绩记录页
COPY index.html /usr/share/nginx/html/index.html
COPY scores.html /usr/share/nginx/html/scores.html

EXPOSE 80

# 让 docker compose / k8s 能直接复用的存活探测
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD wget -qO- http://127.0.0.1/ >/dev/null 2>&1 || exit 1
