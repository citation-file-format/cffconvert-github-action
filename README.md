# cffconvert GitHub Action

GitHub action to validate CITATION.cff files, and convert to other citation formats using dockerized version of [cffconvert](https://pypi.org/project/cffconvert/).

## Badges

| fair-software.nl recommendations | |
| :-- | :--  |
| (1/5) code repository              | [![github repo badge](https://img.shields.io/badge/github-repo-000.svg?logo=github&labelColor=gray&color=blue)](https://github.com/citation-file-format/cffconvert-github-action) |
| (2/5) license                      | [![github license badge](https://img.shields.io/github/license/citation-file-format/cffconvert-github-action)](https://github.com/citation-file-format/cffconvert-github-action) |
| (3/5) community registry           | [![github marketplace badge](https://img.shields.io/badge/github-marketplace-000.svg?logo=github&labelColor=gray&color=blue)](https://github.com/marketplace/actions/cffconvert) [![Research Software Directory](https://img.shields.io/badge/rsd-cffconvert-github-action-00a3e3.svg)](https://www.research-software.nl/software/cffconvert-github-action) |
| (4/5) citation                     | [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.3993241.svg)](https://doi.org/10.5281/zenodo.3993241) |
| (5/5) checklist                    |  |
| overall                            | [![fair-software badge](https://img.shields.io/badge/fair--software.eu-%E2%97%8F%20%20%E2%97%8F%20%20%E2%97%8F%20%20%E2%97%8F%20%20%E2%97%8F-green)](https://fair-software.eu) |
| **GitHub Actions**
| Testing | [![testing](https://github.com/citation-file-format/cffconvert-github-action/workflows/selftest/badge.svg)](https://github.com/citation-file-format/cffconvert-github-action/actions?query=workflow%3A%22selftest%22) |
| Citation metadata | [![citation metadata](https://github.com/citation-file-format/cffconvert-github-action/workflows/cffconvert/badge.svg)](https://github.com/citation-file-format/cffconvert-github-action/actions?query=workflow%3A%22cffconvert%22) |
| Markdown links | [![links](https://github.com/citation-file-format/cffconvert-github-action/actions/workflows/link-check.yml/badge.svg)](https://github.com/citation-file-format/cffconvert-github-action/actions/workflows/link-check.yml) |



## Usage

1. Save the snippet below as ``.github/workflows/cffconvert.yml`` to validate your CITATION.cff on each push.
1. ``git add``, ``commit`` and ``push`` to your GitHub repository
1. Check the _Actions_ tab on your repository's page to check the action's output

```yaml
name: cffconvert

on: push

jobs:
  validate:
    name: "validate"
    runs-on: ubuntu-latest
    steps:
      - name: Check out a copy of the repository
        uses: actions/checkout@v2

      - name: Check whether the citation metadata from CITATION.cff is valid
        uses: citation-file-format/cffconvert-github-action@2.0.0
        with:
          args: "--validate"

```

**You can also look into [advanced examples](README.advanced.md).**
