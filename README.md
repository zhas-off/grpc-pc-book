# gRPC PC Book - Go

PC book is an application to manage and search laptop configurations. It provides 4 gRPC APIs:

1. Create a new laptop: ***unary gRPC***

    This is a unary RPC API that allows client to create a new laptop with some specific configurations.

    The input of the API is a laptop, and it returns the unique ID of the created laptop.

    The laptop ID is a UUID, and can be set by the client, or randomly generated by the server if it's not provided.

2. Search laptops with some filtering conditions: ***server-streaming gRPC***

    This is a server-streaming RPC API that allows client to search for laptops that satisfies some filtering conditions, such as the maximum price, minimum cores, minimum CPU frequency, and minimum RAM.

    The input of the API is the filtering conditions, and it returns a stream of laptops that satisfy the conditions.

3. Upload a laptop image file in chunks: ***client-streaming gRPC***

   This is a client-streaming RPC API that allows client to upload 1 laptop image file to the server. The file will be split into multiple chunks of 1 KB, and they will be sent to the server as a stream.

   The input of the API is a stream of request, which can either be:
   - Metadata of the image (only the 1st request): which contains the laptop ID, and the image type (or file extension) such as `.jpg` or `.png`.
   - Or a binary data chunk of the image.

   The total size of the image should not exceed 1 MB.

   The API will returns a response that contains the uploaded image ID (random UUID generated by the server) and the total size of the image.

4. Rate multiple laptops and get back average rating for each of them: ***bidirectional-streaming gRPC***

    This is a bidirectional-streaming RPC API that allows client to rate multiple laptops, each with a score between 1 to 10, and get back the average rating score for each of them.

    The input of the API is a stream of requests, each with a laptop ID and a score.

    The API will returns a stream of responses, each contains a laptop ID, the number of times that laptop was rated, and the average rated score.
    
### Technologies and methods that are being used

- *HTTP/2 protocol that gRPC is built on.*
- *REST.*
- *Writing and serialisation protocol-buffer messages.*
- *Defining gRPC services with protocol-buffer and generate Go codes.*
- *Handle context deadline, gRPC errors and status codes.*
- *gRPC interceptors to authenticate & authorise users with JWT.*
- *Secure gRPC connection with sever-side & mutual SSL/TLS.*
- *Enable gRPC reflections for service discovery.*
- *Swagger documentation for checking APIs.*

## How to run

- Generate codes from proto files:

```bash
make gen
```

- Clean up generated codes in `pb` and `swagger` folders:

```bash
make clean
```

- Run unit tests:

```bash
make test
```

- Run server and client:

```bash
make server
make client
```

- Generate SSL/TLS certificates:

```bash
make cert
```

## P.S.
PC Book can communicate and exchange data on the local network with application that is written on another language like [gRPC PC Book - Java](https://github.com/zhas-off/grpc-pc-book-java)
