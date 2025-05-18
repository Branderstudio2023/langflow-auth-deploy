FROM python:3.10

RUN apt-get update && apt-get install -y nginx apache2-utils

# 安裝 langflow + 關鍵相依
RUN pip install langflow==0.0.59 && \
    pip install fastapi uvicorn aiofiles pydantic openai langchain

COPY nginx.conf /etc/nginx/nginx.conf
COPY .htpasswd /etc/nginx/.htpasswd

EXPOSE 80

CMD bash -c "langflow --host 0.0.0.0 --port 7860 & nginx -g 'daemon off;'"
