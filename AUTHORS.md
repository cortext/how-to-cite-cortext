# Authors: How to cite CorText Manager

This document is aimed to support CorText Manager developers, collaborators and
authors in general on how to update the instructions on how to cite CorText
Manager on academic works.

%% 
%% O cffconverter ainda nao suporta gerar saida compativel com software-bibtex https://github.com/citation-file-format/cff-converter-python/issues/152,
%% entao a solucao por agora sera escrever manualmente um arquivo Bibtex manualmente seguindo a extensao software-bibtex.
%% 
%% O biblatex-software nao esta empacotado no debian, um modo de instalar eh com o tlmgr, gerenciador
%% de pacotes do TexLive.
%% 
%% % $ tlmgr install biblatex-software
%% % (running on Debian, switching to user mode!)
%% % (see /usr/share/doc/texlive-base/README.tlmgr-on-Debian.md)
%% % TLPDB: not a directory, not loading: /home/joenio/texmf
%% % tlmgr: user mode not initialized, please read the documentation!
%% 


%% O documento /usr/share/doc/texlive-base/README.tlmgr-on-Debian.md desaconselha o uso de tlmgr em usermode, desisti e fiz download
%% dos arquivos e adicionei aqui no repositorio local. CORRECAO o pacote texlive-bibtex-extra 2021.20211217-1 no Debian testing incluid o biblatex-software.
%% 
%% Dai vejo que meu workflow usual em Latex eh com o bibtex e nao o biblatex, para o biblatex me falta instalar os pacotes abaixo:
%% 
%% * biber
%% * texlive-bibtex-extra
%% 
%% Baixei os arquivos da versao 1.2-3 em https://www.ctan.org/tex-archive/macros/latex/contrib/biblatex-contrib/biblatex-software
%% e criei um diretorio local texmf-dist/biblatex-software e crei links simbolicos...

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
