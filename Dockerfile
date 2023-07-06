FROM golang:1.20-alpine AS build

WORKDIR /src

COPY . .

RUN go build -o . -buildvcs=false && \
    go install -buildvcs=false

FROM scratch
COPY --from=build /go/bin /bin

CMD ["challenge-go"]