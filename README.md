# How to cite CorText Manager

This project is twofold, first it contains instructions for researchers on how
to cite CorText Manager on academic works, second it is a guide for CorText
developers and collaborators on how to keep those instructions updated.

## Update CITATION.cff citation metadata

All CorText metadata is maintaned on the `CITATION.cff` file.

To update the format or data about how to cite CorText Manager edit the
`CITATION.cff` accordingly
[Citation File Format (CFF) schema guide][schema-guide].

## Update codemeta.json

The `codemeta.json` file is generated from `CITATION.cff` using the
[cffconvert][cff-converter] tool.

```sh
make codemeta.json
```

## Update bibtex.bib

```sh
make bibtex.tex
```

[schema-guide]: https://github.com/citation-file-format/citation-file-format/blob/main/schema-guide.md
[cff-converter]: https://github.com/citation-file-format/cff-converter-python
