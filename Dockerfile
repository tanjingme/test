FROM alpine:latest
RUN apk add --no-cache curl unzip
WORKDIR /xray
# 下载 Xray 核心程序
RUN curl -L -O https://github.com/XTLS/Xray-core/releases/download/v24.11.30/Xray-linux-64.zip && \
    unzip Xray-linux-64.zip && \
    chmod +x xray
COPY config.json /xray/config.json
# 必须监听在 Zeabur 提供的 PORT 变量上
CMD ["./xray", "-c", "config.json"]
