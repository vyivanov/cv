PROCESSING=pdflatex
FILES="Vladimir U. Ivanov.CV.tex"
FLAGS=

all:
	$(PROCESSING) $(FLAGS) $(FILES)
clean:
	rm -f *.aux *.log .*swp
