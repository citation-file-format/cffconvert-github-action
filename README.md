# cffconvert-github-action

GitHub action to check consistency of ``CITATION.cff`` and ``.zenodo.json`` citation metadata.


## Example usage

Save the following snippet as ``.github/workflows/cffconvert.yml``. ``git add``, ``commit`` and ``push`` to GitHub, this
should trigger a GitHub Action on your repository, see Tab _Actions_ on your repo's page.

```yaml
on: push

jobs:
  build:
    name: "cffconvert"
    runs-on: ubuntu-latest
    steps:
      # This step checks out a copy of your repository.
      - uses: actions/checkout@v2
      # This step references the repository that contains the action.
      - uses: citation-file-format/cffconvert-github-action@v1
```
