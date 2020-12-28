GOCMD = go
GOBUILD = $(GOCMD) build
GORUN = $(GOCMD) run
GOCLEAN = $(GOCMD) clean
BINARY_FILE = bin/tutorial
RM = rm -f

all: run

build:
	$(GOBUILD) -o $(BINARY_FILE) -v .

run:
	$(GORUN) -v .

clean:
	$(GOCLEAN)
	$(RM) $(BINARY_FILE)
