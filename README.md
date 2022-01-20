# cffconvert GitHub Action

GitHub action to validate CITATION.cff files, and convert to other citation formats using dockerized version of [cffconvert](https://pypi.org/project/cffconvert/).

## Badges

| Description | Badge |
| --- | --- |
| Zenodo | [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.3993241.svg)](https://doi.org/10.5281/zenodo.3993241) |
| Testing | [![testing](https://github.com/citation-file-format/cffconvert-github-action/workflows/selftest/badge.svg)](https://github.com/citation-file-format/cffconvert-github-action/actions?query=workflow%3A%22selftest%22) |
| Citation metadata | [![citation metadata](https://github.com/citation-file-format/cffconvert-github-action/workflows/cffconvert/badge.svg)](https://github.com/citation-file-format/cffconvert-github-action/actions?query=workflow%3A%22cffconvert%22) |
| Markdown links | [![Check Markdown links](https://github.com/citation-file-format/cffconvert-github-action/actions/workflows/link-check.yml/badge.svg)](https://github.com/citation-file-format/cffconvert-github-action/actions/workflows/link-check.yml) |

## Usage

1. Save one of the snippets below as ``.github/workflows/cffconvert.yml``
1. ``git add``, ``commit`` and ``push`` to your GitHub repository
1. Check the _Actions_ tab on your repository's page to check the action's output


### Validation

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

### Validating from a subdirectory

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
        
      - name: Validate a CITATION.cff from a subdirectory
        uses: citation-file-format/cffconvert-github-action@2.0.0
        with:
          args: "--infile ./tests/subdirectory/CITATION.cff --validate"
        
```

### Converting CITATION.cff to Zenodo metadata format

```yaml
name: cffconvert

on: push

jobs:
  convert:
    name: "convert"
    runs-on: ubuntu-latest
    steps:
      - name: Check out a copy of the repository
        uses: actions/checkout@v2
        
      - name: Convert CITATION.cff to Zenodo metadata format
        uses: citation-file-format/cffconvert-github-action@2.0.0
        with:
          args: "--infile ./CITATION.cff --format zenodo --outfile .zenodo.json"
        
      - name: Commit and push Zenodo metadata 
        run: |
          git config --global user.name 'cffconvert GitHub Action'
          git config --global user.email 'cffconvert@users.noreply.github.com'
          git add .zenodo.json
          git commit -m "Automated update of Zenodo metadata"
          git push            
        
```
