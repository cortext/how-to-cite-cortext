# Authors: How to cite CorTexT Manager

This document is aimed to support CorTexT Manager developers, collaborators and
authors in general on how to update the instructions on how to cite CorTexT
Manager on academic works.

## Development dependencies

* make, curl, unzip
* [cffconvert][cff-converter]
* [biber][biber]
* [biblatex-software][biblatex-software]
* [jq][jq]

## Install dependencies

```sh
python3 -m pip install --user cffconvert
make install
```

To build the `how-to-cite-cortext.pdf`, on Debian-based, install:

```sh
sudo apt install texlive-bibtex-extra biber
```

## Update CITATION.cff

All CorTexT Manager metadata is maintained on the `CITATION.cff` file.

To update the format or data about how to cite CorTexT Manager edit the
`CITATION.cff` accordingly
[Citation File Format (CFF) schema guide][schema-guide].

Every time `CITATION.cff` is modified you should rebuild all other files
derivated from it by running:

```sh
make update
```

## Update biblatex-software.bib

Besides the `CITATION.cff` this file also must be updated manually, it is
recommended that all informations on `CITATION.cff` must be present on
`biblatex-software.bib` as well.

To update the format or data about how to cite CorTexT Manager edit the
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

## Update apalike.apa

The `apalike.apa` file is generated from `CITATION.cff` using the
[cffconvert][cff-converter] tool.

```sh
make apalike.apa
```

[schema-guide]: https://github.com/citation-file-format/citation-file-format/blob/main/schema-guide.md
[biblatex-software]: https://www.ctan.org/tex-archive/macros/latex/contrib/biblatex-contrib/biblatex-software
[cff-converter]: https://github.com/citation-file-format/cff-converter-python
[biber]: http://biblatex-biber.sourceforge.net
[jq]: https://stedolan.github.io/jq
