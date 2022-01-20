# cffconvert GitHub Action

GitHub action to validate CITATION.cff files, and convert to other citation formats.

## Badges

| Description | Badge |
| --- | --- |
| Verify that errors are generated for various incorrect cases | [![verify errors](https://github.com/citation-file-format/cffconvert-github-action/workflows/verify%20errors/badge.svg)](https://github.com/citation-file-format/cffconvert-github-action/actions?query=workflow%3A%22verify+errors%22) |
| Markdown links | [![Check Markdown links](https://github.com/citation-file-format/cffconvert-github-action/actions/workflows/link-check.yml/badge.svg)](https://github.com/citation-file-format/cffconvert-github-action/actions/workflows/link-check.yml) |


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
         - name: Check out a copy of the repository
           uses: actions/checkout@v2
           

         - name: Check whether the citation metadata from CITATION.cff is valid
           uses: citation-file-format/cffconvert-github-action@2.0.0
           with:
             args: "--validate"
           
   ```

1. ``git add``, ``commit`` and ``push`` to GitHub
1. Check the _Actions_ tab on your repository's page to check the action's output

