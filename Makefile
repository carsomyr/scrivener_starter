#------------------------------------------------------------------------------#
# Declare variables.                                                           #
#------------------------------------------------------------------------------#

MMD		= multimarkdown
LATEX	= pdflatex

MMDS	= $(wildcard *.mmd)
PDFS	= $(MMDS:%.mmd=%.pdf)

#------------------------------------------------------------------------------#
# Make the high level targets.                                                 #
#------------------------------------------------------------------------------#

.PHONY: all clean

all: $(PDFS)

%.tex: .%.mmd
	$(MMD) -t latex -o $@ -- $<

.%.mmd: %.mmd mmd/preamble.mmd
	if [[ -f "mmd/user.mmd" ]]; then \
		cat -- "mmd/preamble.mmd" "mmd/user.mmd" $< > $@; \
	else \
		cat -- "mmd/preamble.mmd" $< > $@; \
	fi

%.pdf: %.tex
	TEXMFHOME=".$${TEXMFHOME:+":$${TEXMFHOME}"}" $(LATEX) -- $<

#------------------------------------------------------------------------------#
# Clean the distribution.                                                      #
#------------------------------------------------------------------------------#

clean:
	rm -rf -- $(MMDS) $(PDFS) \
		*.aux *.bbl *.blg *.glo *.idx *.ist *.log *.out *.toc
