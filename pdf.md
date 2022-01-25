# PDF Files

## pdftk

### Install

```sh
sudo apt install pdftk
```

### Remove page

```sh
pdftk filename.pdf cat 1-2 4-end output output.pdf
```

### Join files

```sh
pdftk *.pdf cat output output.pdf
```
