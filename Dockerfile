FROM python:3.10

RUN apt-get update && apt-get install -y nginx apache2-utils

RUN pip install "langflow[all]" --prefer-binary --no-cache-dir

COPY nginx.conf /etc/nginx/nginx.conf
COPY .htpasswd /etc/nginx/.htpasswd

EXPOSE 80

CMD bash -c "langflow --host 0.0.0.0 --port 7860 & nginx -g 'daemon off;'"