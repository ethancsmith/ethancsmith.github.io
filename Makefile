.PHONY: slides

slides: diagonalization.slides.html

diagonalization.slides.html : diagonalization.ipynb
	jupyter nbconvert --to slides diagonalization.ipynb --reveal-prefix=reveal.js --SlidesExporter.reveal_scroll=True
