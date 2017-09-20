# Build a type-safe web server with tink

### Video recording of the workshop

- Part 1: https://www.twitch.tv/videos/174665157?t=02h03m16s
- Part 2: https://www.twitch.tv/videos/174685283

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