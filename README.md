[![tests](https://github.com/Metadrop/ddev-pa11y/actions/workflows/tests.yml/badge.svg)](https://github.com/Metadrop/ddev-pa11y/actions/workflows/tests.yml) ![project is maintained](https://img.shields.io/maintenance/yes/2025.svg)
![GitHub Release](https://img.shields.io/github/v/release/Metadrop/ddev-pa11y)

# DDEV Pa11y Add-on <!-- omit in toc -->

* [What is DDEV Pa11y Add-on?](#what-is-ddev-pa11y-add-on)
* [Components of the repository](#components-of-the-repository)
* [Getting started](#getting-started)

## What is DDEV Pa11y Add-on?
This repository provides a [DDEV](https://ddev.readthedocs.io) add-on for the Pa11y service. Pa11y is an automated accessibility testing tool that helps developers make their web applications more accessible.

This is optimized for [Aljibe projects](https://github.com/Metadrop/Aljibe/), but can be used in any DDEV project.

In DDEV, addons can be installed from the command line using the `ddev add-on get` command, for example, `ddev add-on get Metadrop/ddev-pa11y`.

## Components of the repository

* The fundamental contents of the Pa11y addon. For example, in this template there is a [docker-compose.pa11y.yaml](docker-compose.pa11y.yaml) file.
* An [install.yaml](install.yaml) file that describes how to install the Pa11y service.
* A test suite in [test.bats](tests/test.bats) that makes sure the Pa11y service continues to work as expected.
* [Github actions setup](.github/workflows/tests.yml) so that the tests run automatically when you push to the repository.

## Getting started

1. Install the Pa11y service in your DDEV project.

    For DDEV v1.23.5 or above run

    ```sh
    ddev add-on get Metadrop/ddev-pa11y
    ```

    For earlier versions of DDEV run

    ```sh
    ddev get Metadrop/ddev-pa11y
    ```

1. Start the DDEV project with `ddev start` or `ddev restart`if already started.
1. Run the Pa11y service with `ddev pa11y http://metadrop.net --reporter=junit --standard WCAG2A`.

## Customizing the Pa11y configuration

The Pa11y configuration can be customized by update the custom .json file inside tests/pa11y folder. For example, you can create a file called `tests/pa11y/config.json` with the following content:

```json
{
  "chromeLaunchConfig": {
    "args": ["--no-sandbox"],
    "ignoreHTTPSErrors": true
  },
  "hideElements": ".skip-pa11y",
  "ignore": [],
  "screenCapture": "config/pa11y.png",
  "reporter": "cli",
  "runner": ["axe", "htmlcs"]
}
```
To use this config file, you can run the Pa11y service with the following command:
```
ddev pa11y http://example.com --config=config/config.json
```

**Contributed and maintained by [@Metadrop](https://github.com/Metadrop)**
