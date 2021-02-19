GOCMD = go
GOBUILD = $(GOCMD) build
GORUN = $(GOCMD) run
BINARY_FILE = app
RM = rm

all: build

build:
	$(GOBUILD) -o $(BINARY_FILE) .

run:
	$(GORUN) .

clean:
	$(RM) -f $(BINARY_FILE)
