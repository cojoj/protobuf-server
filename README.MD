# Create a new project

```bash
swift package init --type executable
```

# Run the project

```bash
.build/debug/protobuf-server
```

# Clone protobuf

```bash
git clone https://github.com/apple/swift-protobuf.git
```

# Install homebrew

```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

# Install protoc compiler

```bash
brew install protobuf-swift
```

# Copy protoc-gen-swift to a place visible from PATH

```bash
sudo cp .build/debug/protoc-gen-swift /opt/local/bin
```

