FROM python:3.11

RUN apt-get update && apt-get install -y nginx apache2-utils build-essential curl

RUN pip install --upgrade pip setuptools wheel

# ❗只裝 langflow，避免 ResolutionImpossible
RUN pip install "langflow==1.4.1" --prefer-binary --no-cache-dir

COPY nginx.conf /etc/nginx/nginx.conf
COPY .htpasswd /etc/nginx/.htpasswd

EXPOSE 80

CMD bash -c "langflow --host 0.0.0.0 --port 7860 & nginx -g 'daemon off;'"
