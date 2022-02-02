# Authors: How to cite CorText Manager

This document is aimed to support CorText Manager developers, collaborators and
authors in general on how to update the instructions on how to cite CorText
Manager on academic works.

## Development dependencies

* make
* [cffconvert][cff-converter]
* [biber][biber]
* [biblatex-software][biblatex-software]

## Update CITATION.cff

All CorText Manager metadata is maintaned on the `CITATION.cff` file.

To update the format or data about how to cite CorText Manager edit the
`CITATION.cff` accordingly
[Citation File Format (CFF) schema guide][schema-guide].

## Update biblatex-software.bib

Besides the `CITATION.cff` this file also must be updated manually, it is
recommended that all informations on `CITATION.cff` must be present on
`biblatex-software.bib` as well.

To update the format or data about how to cite CorText Manager edit the
`biblatex-software.bib` accordingly
[BibLatex style extension for Software (biblatex-software) docs][biblatex-software].

NOTE: At some point this file will be auto-generated using the CITATION.cff as
input by the cffconvert tool then the
[cffconvert issue #152](https://github.com/citation-file-format/cff-converter-python/issues/152)
is implemented.

## Update codemeta.json

The `codemeta.json` file is generated from `CITATION.cff` using the
[cffconvert][cff-converter] tool.

```sh
make codemeta.json
```

## Update bibtex.bib

The `bibtex.bib` file is generated from `CITATION.cff` using the
[cffconvert][cff-converter] tool.

```sh
make bibtex.bib
```

[schema-guide]: https://github.com/citation-file-format/citation-file-format/blob/main/schema-guide.md
[biblatex-software]: https://www.ctan.org/tex-archive/macros/latex/contrib/biblatex-contrib/biblatex-software
[cff-converter]: https://github.com/citation-file-format/cff-converter-python
[biber]: http://biblatex-biber.sourceforge.net
