[![tests](https://github.com/ddev/ddev-addon-template/actions/workflows/tests.yml/badge.svg)](https://github.com/ddev/ddev-addon-template/actions/workflows/tests.yml) ![project is maintained](https://img.shields.io/maintenance/yes/2024.svg)

# DDEV Pa11y Add-on <!-- omit in toc -->

* [What is DDEV Pa11y Add-on?](#what-is-ddev-pa11y-add-on)
* [Components of the repository](#components-of-the-repository)
* [Getting started](#getting-started)
* [How to debug in Github Actions](#how-to-debug-tests-github-actions)

## What is DDEV Pa11y Add-on?
This repository provides a [DDEV](https://ddev.readthedocs.io) add-on for the Pa11y service. Pa11y is an automated accessibility testing tool that helps developers make their web applications more accessible.

In DDEV, addons can be installed from the command line using the `ddev get` command, for example, `ddev get ddev/ddev-pa11y`.

This repository is a quick way to get started. You can create a new repo from this one by clicking the template button in the top right corner of the page.

## Components of the repository

* The fundamental contents of the Pa11y service. For example, in this template there is a [docker-compose.pa11y.yaml](docker-compose.pa11y.yaml) file.
* An [install.yaml](install.yaml) file that describes how to install the Pa11y service.
* A test suite in [test.bats](tests/test.bats) that makes sure the Pa11y service continues to work as expected.
* [Github actions setup](.github/workflows/tests.yml) so that the tests run automatically when you push to the repository.

## Getting started

1. Create the new template repository by using the template button.
2. Globally replace "addon-template" with "ddev-pa11y".
3. Add the files that need to be added to a DDEV project to the repository. For example, you might replace `docker-compose.addon-template.yaml` with the `docker-compose.pa11y.yaml` for your recipe.
4. Update the `install.yaml` to give the necessary instructions for installing the Pa11y add-on.
5. Update `tests/test.bats` to provide a reasonable test for your repository.
6. When everything is working, including the tests, you can push the repository to GitHub.
7. Create a [release](https://docs.github.com/en/repositories/releasing-projects-on-github/managing-releases-in-a-repository) on GitHub.
8. Test manually with `ddev get <owner/repo>`.
9. Update the `README.md` to describe the Pa11y add-on, how to use it, and how to contribute.
10. Add a good short description to your repo, and add the [topic](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/classifying-your-repository-with-topics) "ddev-get". It will immediately be added to the list provided by `ddev get --list --all`.

## How to debug tests (Github Actions)

Follow the instructions provided in the original README.

**Contributed and maintained by [@CONTRIBUTOR](https://github.com/CONTRIBUTOR)**