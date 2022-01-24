# Advanced examples

You can pass any arguments in the `args:` key that you would to the `cffconvert` CLI tool.
This allows for some interesting usage.

The list of options is right below, and you can see some examples in the next sections.
```
Options:
  -i, --infile PATH               Path to the CITATION.cff input file. If this
                                  option is omitted, './CITATION.cff' is used.
  -o, --outfile PATH              Path to the output file.
  -f, --format [apalike|bibtex|cff|codemeta|endnote|ris|schema.org|zenodo]
                                  Output format.
  -u, --url TEXT                  URL to the CITATION.cff input file.
  -h, --help                      Show help and exit.
  --show-trace                    Show error trace.
  --validate                      Validate the CITATION.cff file and exit.
  --version                       Print version and exit.
```

## Validating from a subdirectory

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

## Converting CITATION.cff to Zenodo metadata format and pushing to the repo

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

## Converting CITATION.cff to Zenodo metadata format and opening a pull request

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

      - name: Commit and create a Pull Request with the Zenodo file
        uses: peter-evans/create-pull-request@v3
        with:
          commit-message: ":robot: Update .zenodo.json"
          committer: "cffconvert GitHub Action <cffconvert@users.noreply.github.com>"
          title: "[auto] Update .zenodo.json"

```
