GOCMD = go
GOBUILD = $(GOCMD) build
GORUN = $(GOCMD) run
BINARY_FILE = bin/tutorial
RM = rm

all: build

build:
	$(GOBUILD) -o $(BINARY_FILE) .

run:
	$(GORUN) .

clean:
	$(RM) -f $(BINARY_FILE)
