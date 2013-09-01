PROCESSING=pdflatex
FILES="Vladimir.Ivanov.CV.tex"
FLAGS=

all:
	$(PROCESSING) $(FLAGS) $(FILES)
clean:
	rm -f *.aux *.log .*swp
