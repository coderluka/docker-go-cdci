FROM golang:1.11-alpine

# Set maintainer label: maintainer=[YOUR-EMAIL]
LABEL Luka Dimitrijevic <iluka.dimitrijevic@gmail.com>

# Set working directory: `/src`
WORKDIR /src

# Copy local file `main.go` to the working directory
COPY *.go /src/

# Dependencies
RUN apk update && apk add git
RUN go get github.com/gorilla/mux && go get github.com/lib/pq

# List items in the working directory (ls)
CMD ls

# Build the GO app as myapp binary and move it to /usr/
RUN go build -o myapp
CMD mv ./myapp ~/usr

# Expose port 8888
EXPOSE 8010

# Run the service myapp when a container of this image is launched
CMD ./myapp