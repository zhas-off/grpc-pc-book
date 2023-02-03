gen:
	protoc -I=proto --go_out=. proto/*.proto

clean:
	del pb\*.go

server:
	go run cmd/server/main.go -port 8082

client:
	go run cmd/client/main.go -address 0.0.0.0:8082

test:
	go test -cover -race ./...

cert:
	cd cert; ./gen.sh; cd ..

.PHONY: gen clean server client test cert