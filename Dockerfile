# Dockerfile
FROM python:3.10-slim

# 시스템 패키지 설치
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

# 작업 디렉토리 설정
WORKDIR /app

# requirements.txt 복사 후 패키지 설치
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# JupyterLab 포트
EXPOSE 8888

# JupyterLab 실행
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''"]
