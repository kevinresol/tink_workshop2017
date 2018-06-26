# Build a type-safe web server with tink

### Video recording of the workshop

https://www.youtube.com/watch?v=v7Ic1Wm5ibw

### Prerequisites

You will need to have Node.js installed on your machine.

### How to build

```
npm install -g lix.pm
git clone https://github.com/kevinresol/tink_workshop2017
cd tink_workshop2017
lix download
lix build server.hxml
lix build client.hxml
lix build test.hxml

# Run the tests
node bin/tests.js

# Start the server
node bin/server.js

# Navigate to http://localhost:8080/index.html
```

### Questions?

Feel free to throw me a [GitHub issue](https://github.com/kevinresol/tink_workshop2017/issues/new) or join the [Gitter channel](https://gitter.im/haxetink/public) to ask!