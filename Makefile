# Example files.
EXAMPLE_TEX_FILE   = 2019-11-12-fbi-kbs.tex
EXAMPLE_PDF_FILE   = 2019-11-12-fbi-kbs.pdf
EXAMPLE_OUTPUT_DIR = ./output

export TEXINPUTS:=$(shell pwd)/onion-tex/src:${TEXINPUTS}

all: example

clean: example-clean

# Build the example file.
example: $(EXAMPLE_PDF_FILE)

example-clean:
	rm -rf $(EXAMPLE_OUTPUT_DIR) $(EXAMPLE_OUTPUT_DIR)

$(EXAMPLE_OUTPUT_DIR):
	mkdir $(EXAMPLE_OUTPUT_DIR)

$(EXAMPLE_PDF_FILE): $(EXAMPLE_TEX_FILE) $(EXAMPLE_OUTPUT_DIR) example-clean
	latexmk -pdf --shell-escape -output-directory=$(EXAMPLE_OUTPUT_DIR) $<
	cp $(EXAMPLE_OUTPUT_DIR)/$(notdir *.pdf) ./

.PHONY: all clean example-clean
