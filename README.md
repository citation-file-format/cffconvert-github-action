# cffconvert-github-action

GitHub action to check consistency of ``CITATION.cff`` and ``.zenodo.json`` citation metadata.


## Example usage

1. Save the following snippet as ``.github/workflows/cffconvert.yml``

   ```yaml
   on: push

   jobs:
     verify:
       name: "cffconvert"
       runs-on: ubuntu-latest
       steps:
         # This step checks out a copy of your repository.
         - uses: actions/checkout@v2
         # This step references the repository that contains the action.
         - uses: citation-file-format/cffconvert-github-action@v1
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
on: push

jobs:
  verify:
    name: "cffconvert"
    runs-on: ubuntu-latest
    steps:
      # This step checks out a copy of your repository.
      - uses: actions/checkout@v2
      - uses: citation-file-format/cffconvert-github-action@master
        with:
          WORKDIR: tests/zenodo-missing/
          FAILURE_EXPECTED: '1'
          DIFF_IGNORE_WHITESPACE: '1'
```
