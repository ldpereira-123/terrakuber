FROM golang:1.12.12

Run mkdir /usr/local/go/app

Env APP_HOME=/usr/local/go/app
Env GO_FOLDER=/usr/local/go

COPY main.go $APP_HOME

Run cd $GO_FOLDER && go get -u github.com/gorilla/mux
CMD go run $APP_HOME/main.go

EXPOSE 1337
