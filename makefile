LATEX_ARGS := -shell-escape

.PHONY: build clean_trash clean

explanatory_note.pdf: tex/build.sh tex/*.tex tex/*.bib tex/*.sty tex/*.module tex/*.clo tex/*.bst tex/*.cls tex/*.inc tex/*.layout tex/img/* # tex/listings/*
	make build
	make clean_trash

build:
	cd tex && sh ./build.sh && cd ..
	pdftk A=pdf/title_and_SW_Sapozhkov.pdf B=tex/rpz.pdf cat A1-2 B3-end output explanatory_note.pdf
	mv explanatory_note.pdf pdf/
	rm -f tex/rpz.pdf

clean_trash:
	rm -f tex/*.aux tex/*.toc tex/*.out tex/*.log tex/*.bbl tex/*.blg

clean:
	make clean_trash
	rm -f explanatory_note.pdf
