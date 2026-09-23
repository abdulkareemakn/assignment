# Assignment

A personal [Typst](https://typst.app/) template for COMSATS University Islamabad, Lahore Campus assignments and reports.

## Install

From this repository, install the package locally:

```sh
./install.sh
```

This installs `@local/assignment:0.2.1`. Create a new assignment project with Typst:

```sh
typst init @local/assignment:0.2.1 my-assignment
```

Edit `my-assignment/main.typ`, then compile it:

```sh
typst compile my-assignment/main.typ
```

## Customize

Set the `report.with` values in `main.typ`. `authors` accepts either one record or multiple records for a group submission.

When `show_page_numbers` is enabled, the title page remains unnumbered and the following page begins at 1.
