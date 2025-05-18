FROM python:3.10

# 安裝 Nginx 和 Basic Auth 工具
RUN apt-get update && apt-get install -y nginx apache2-utils

# 安裝 langflow 的穩定版本，避免長時間回溯
RUN pip install "langflow[all]==0.0.59" --prefer-binary --no-cache-dir

# 複製設定檔與帳密
COPY nginx.conf /etc/nginx/nginx.conf
COPY .htpasswd /etc/nginx/.htpasswd

# 對外開放 Nginx 的 80 port（Fly.io 會對應 443）
EXPOSE 80

# 啟動 langflow + nginx
CMD bash -c "langflow --host 0.0.0.0 --port 7860 & nginx -g 'daemon off;'"
