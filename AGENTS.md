# Repository workflow

## Project

- This is a Typst assignment template. `lib.typ` defines the report layout; `template/main.typ` is copied into new projects.
- Assume development servers are already running. Do not launch one unless you establish that none is running, and stop any server you start.
- Do not inspect rendered output or take screenshots. Only run tests or verification commands when requested.

## Version updates

Keep the package version synchronized in all three places:

1. `typst.toml` package `version`.
2. The `@local/assignment:<version>` import in `template/main.typ`.
3. The install and `typst init` examples in `README.md`.

Before finishing a version update, search the repository for stale version strings and confirm all three references agree.

## Releases

When asked to publish a release:

1. Update the version references above and summarize the change in the README if useful.
2. Commit the release changes.
3. Create an annotated Git tag named `v<version>` on that commit.
4. Push the branch and tag, then create a GitHub Release for the tag with concise notes.
5. Confirm the working tree is clean and the remote branch and tag point to the release commit.
