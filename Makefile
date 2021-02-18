GOCMD = go
GOBUILD = $(GOCMD) build
GORUN = $(GOCMD) run
BINARY_FILE = bin/tutorial
RM = rm

all: build

build:
	$(GOBUILD) -gcflags -m -o $(BINARY_FILE) -v .

run:
	$(GORUN) -gcflags -m -v .

clean:
	$(RM) -f $(BINARY_FILE)
