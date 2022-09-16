# action-pkgcheck-scan

Automatically run pkgcheck scan on a Gentoo Overlay and report all QA errors.

## Basic Usage

An example workflow to run [pkgcheck](https://wiki.gentoo.org/wiki/Pkgcheck) on an Overlay after every `push`
and on a schedule:

```yaml
name: Overlay QA

on:
  push:
    paths-ignore:
      - 'README.md'
  schedule:
    - cron: "0 6 * * 1"

jobs:
  repoman:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - uses: bobwya/action-pkgcheck-scan@master
```
