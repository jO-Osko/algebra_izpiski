FILE_NAME = skripta
SOURCES = $(FILE_NAME).tex
OUT_FOLDER = generated/
OUT_FILE = $(OUT_FOLDER)$(FILE_NAME).pdf

all: $(OUT_FILE)
	#dvipdf art.dvi

view: all
	evince $(FILE_NAME).pdf &

clean:
	-rm *.dvi -f
	-rm *.log -f
	-rm *.pdf -f
	-rm *.aux -f
	find $(OUT_FOLDER) -type f -delete


$(OUT_FILES): $(SOURCES)

	latex -output-format='pdf' -output-directory='$(OUT_FOLDER)' -quiet $(SOURCES)
	# To ensure proper linking and table of contents
	latex -output-format='pdf' -output-directory='$(OUT_FOLDER)' -quiet $(SOURCES)
	# To keep main folder full
	cp $(OUT_FILE) $(FILE_NAME).pdf
