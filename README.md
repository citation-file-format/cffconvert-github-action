# cffconvert-github-action

GitHub action to check consistency of cff and zenodo citation metadata


## Example usage

```yaml
on: push

jobs:
  build:
    name: "cffconvert"
    runs-on: ubuntu-latest
    steps:
      # This step checks out a copy of your repository.
      - uses: actions/checkout@v2
      # This step references the directory that contains the action.
      - uses: citation-file-format/cffconvert-github-action
```
