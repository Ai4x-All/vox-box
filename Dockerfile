# 使用官方 Python 作为基础镜像
FROM python:3.12-slim

# 设置工作目录
WORKDIR /app

# 复制依赖文件
COPY requirements.txt .

# 安装项目依赖
RUN pip install --no-cache-dir -r requirements.txt

# 复制项目代码
COPY . .

# 暴露应用运行的端口
EXPOSE 8300

# 启动 vox-box 应用 vox-box start --huggingface-repo-id Systran/faster-whisper-small --data-dir /d/faster-whisper-small --host 0.0.0.0 --port 18100 --model /d/CosyVoice-300M/
CMD ["vox-box", "start", "--huggingface-repo-id", "Systran/faster-whisper-small","--data-dir","/data-dir","--model","/model" "--host", "0.0.0.0", "--port", "8300"] 
