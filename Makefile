gen:
	protoc -I=proto --go_out=. proto/*.proto --go-grpc_out=. --grpc-gateway_out=. --openapiv2_out=:swagger

clean:
	del pb\*.go

server1:
	go run cmd/server/main.go -port 50051

server2:
	go run cmd/server/main.go -port 50052

server1-tls:
	go run cmd/server/main.go -port 50051 -tls

server2-tls:
	go run cmd/server/main.go -port 50052 -tls

server:
	go run cmd/server/main.go -port 8082

rest:
	go run cmd/server/main.go -port 8081 -type rest -endpoint 0.0.0.0:8081

client:
	go run cmd/client/main.go -address 0.0.0.0:8082

client-tls:
	go run cmd/client/main.go -address 0.0.0.0:8082 -tls

test:
	go test -cover -race ./...

cert:
	cd cert && gen.sh

.PHONY: gen clean server client test cert