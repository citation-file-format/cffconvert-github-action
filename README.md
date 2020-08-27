# cffconvert-github-action

GitHub action to check consistency of ``CITATION.cff`` and ``.zenodo.json`` citation metadata.

## Badges

| Description | Badge |
| --- | --- |
| Check consistency of the citation metadata | [![metadata consistency](https://github.com/citation-file-format/cffconvert-github-action/workflows/metadata%20consistency/badge.svg)](https://github.com/citation-file-format/cffconvert-github-action/actions?query=workflow%3A%22metadata+consistency%22) |
| Verify that errors are generated for various incorrect cases | [![verify errors](https://github.com/citation-file-format/cffconvert-github-action/workflows/verify%20errors/badge.svg)](https://github.com/citation-file-format/cffconvert-github-action/actions?query=workflow%3A%22verify+errors%22) |


## Example usage

1. Save the following snippet as ``.github/workflows/cffconvert.yml``

   ```yaml
   name: cffconvert
   
   on: push

   jobs:
     verify:
       name: "cffconvert"
       runs-on: ubuntu-latest
       steps:
         - uses: actions/checkout@v2
           name: Check out a copy of the repository

         - uses: citation-file-format/cffconvert-github-action@1.1.1
           name: Check whether the citation metadata from CITATION.cff is equivalent to that in .zenodo.json
   ```

1. ``git add``, ``commit`` and ``push`` to GitHub
1. Check the _Actions_ tab on your repository's page to check the action's output


## Variables

- ``DIFF_IGNORE_WHITESPACE``: Ignore all whitespace when ``diff``'ing the expected ``.zenodo.json`` contents with
  the actual ``.zenodo.json`` contents.
- ``FAILURE_EXPECTED``: In testing, it can be useful to flip the exit codes for failure and success. Set to '1' for
  flipped definition; '0' or empty gives normal behavior.'
- ``WORKDIR``: The working directory that ``checks.sh`` should change to before verifying whether ``CITATION.cff``
  and ``.zenodo.json`` are equivalent.

Example workflow file:

```yaml
name: cffconvert

on: push

jobs:
  verify:
    name: "cffconvert"
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
        name: Check out a copy of the repository

      - uses: citation-file-format/cffconvert-github-action@1.1.1
        name: Check whether the citation metadata from CITATION.cff is equivalent to that in .zenodo.json
        with:
          WORKDIR: tests/zenodo-missing/
          FAILURE_EXPECTED: true
          DIFF_IGNORE_WHITESPACE: true
```
