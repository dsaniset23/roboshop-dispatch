FROM        redhat/ubi9
RUN         dnf install golang -y
WORKDIR     /app
RUN         useradd -d /app roboshop && chown roboshop:roboshop /app
USER        roboshop
COPY        main.go ./
RUN         go mod init dispatch && \
            go get && \
            go build
CMD         ["/app/dispatch"]