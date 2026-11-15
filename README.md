# IZTECH (Izmir Institute of Technology) Master Thesis Template 

Following link provides necessary information for writing master/doctoral thesis according IZTECH rules and formats:
[IZTECH Master/Doctoral Thesis Writing Guide](https://lee.iyte.edu.tr/tezler-2)

## What the class applies

`iztechthesis.cls` sets the layout of the guide, with spacing measured on the guide's own sample pages:

- A4 paper, margins of 3.5 cm on the left and 2.5 cm elsewhere, Times New Roman 12 pt, standard 1.5 spacing (0.73 cm between baselines) and a 1.27 cm paragraph indent
- Chapter headings in 16 pt and section headings in 14 pt, with the guide's 2x1.5 spacing around them
- Preliminary pages in the guide's order (title, approval, acknowledgments, abstract, Özet), Roman page numbers not printed on the first three, and the abstract and Özet left out of the table of contents
- Captions in 12 pt (table captions above, figure captions below), and no text smaller than 9 pt
- References single-spaced with one blank line between entries

`appendix.tex` shows a table continued over several pages with the guide's "Table A.1 (cont.)" and "(cont. on next page)" markers, and `\sourceline{...}` in `main.tex` writes the "(Source: ...)" line for a borrowed figure or table.

## Building

Compile `main.tex` with pdfLaTeX and Biber, for example with `latexmk -pdf main.tex`, or upload the files to Overleaf. `IZTECH_Master_Thesis_Template_LaTeX.pdf` is the compiled example.
