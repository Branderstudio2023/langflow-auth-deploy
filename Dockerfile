FROM python:3.10

RUN apt-get update && apt-get install -y nginx apache2-utils

# 使用實際存在的 langflow 版本
RUN pip install "langflow==0.0.50" --prefer-binary --no-cache-dir

COPY nginx.conf /etc/nginx/nginx.conf
COPY .htpasswd /etc/nginx/.htpasswd

EXPOSE 80

CMD bash -c "langflow --host 0.0.0.0 --port 7860 & nginx -g 'daemon off;'"
