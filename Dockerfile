FROM python:3.11

# 安裝系統套件
RUN apt-get update && apt-get install -y nginx apache2-utils build-essential curl

# 升級 pip 與 setuptools，避免回溯
RUN pip install --upgrade pip setuptools wheel

# ✅ 安裝 langflow 新版並避開相依錯誤
RUN pip install langflow==1.4.1 \
    grpcio==1.62.0 \
    protobuf==4.25.1 \
    pydantic==2.6.4 \
    --prefer-binary --no-cache-dir

# 複製 nginx 設定與帳密
COPY nginx.conf /etc/nginx/nginx.conf
COPY .htpasswd /etc/nginx/.htpasswd

EXPOSE 80

# 啟動 Langflow + Nginx（for Basic Auth）
CMD bash -c "langflow --host 0.0.0.0 --port 7860 & nginx -g 'daemon off;'"
