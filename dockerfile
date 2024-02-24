
FROM alpine:latest AS fullcycle

WORKDIR /app
COPY    /app .

RUN apk add --no-cache go
RUN go build app.go

FROM scratch AS fullcycle2 
WORKDIR /app
COPY --from=fullcycle /app .
CMD [ "./app" ]