# 使用 java 8 jre 作为基础镜像
FROM openjdk:8-jre-alpine

# 设置 /app 为工作目录
WORKDIR /app

# 定义构建参数 JAR_FILE，表示宿主机 jar 包的路径
ARG JAR_FILE

# 把 jar 包拷贝到镜像的 /app/app.jar 位置
COPY ${JAR_FILE} /app/app.jar

# 操作系统使用阿里云的源
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

# 安装 tini
RUN apk add --no-cache tini

# 使用 tini 模式启动程序
ENTRYPOINT ["/sbin/tini", "--"]
CMD ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app/app.jar","--spring.config.location=/app/"]
