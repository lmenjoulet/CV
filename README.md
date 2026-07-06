# CV build system

## Dependencies

- typst [CLI](https://typst.app/open-source)

## Project structure 

- `resume.typ` contains the layout of the resume. It is language agnostic.
- `locales` contains the available translation files for the CV in TOML format.

## Build instructions 

```bash
git clone https://github.com/lmenjoulet/CV.git
cd CV
typst resume.typ
```

This will generate a file named `resume.pdf` that can be opened in the PDF reader
of your choice.

### Build options 

There are two options that can be defined in typst CLI in order to generate
the PDF.

|option  |default  |description|
|--------|---------|-----------|
|`locale`|en       |specifies the toml file to use to generate the resume.|
|`pfp`   |photo.jpg|specifies the profile picture path or "none" if no profile picture.|

#### Example

```bash
typst compile --input pfp=none --input locale=fr ./resume.typ # no profile picture and french translation file.
```
