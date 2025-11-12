#!/usr/bin/env bats

# Standard DDEV add-on setup code taken from official DDEV add-ons.
setup() {
  set -eu -o pipefail
  export GITHUB_REPO=Metadrop/ddev-aljibe-assistant
  TEST_BREW_PREFIX="$(brew --prefix 2>/dev/null || true)"
  export BATS_LIB_PATH="${BATS_LIB_PATH}:${TEST_BREW_PREFIX}/lib:/usr/lib/bats"
  bats_load_library bats-assert
  bats_load_library bats-file
  bats_load_library bats-support

  # shellcheck disable=SC2155
  export DIR="$(cd "$(dirname "${BATS_TEST_FILENAME}")/.." >/dev/null 2>&1 && pwd)"
  # shellcheck disable=SC2155
  export PROJNAME="test-$(basename "${GITHUB_REPO}")"

  mkdir -p ~/tmp
  # shellcheck disable=SC2155
  export TESTDIR=$(mktemp -d ~/tmp/${PROJNAME}.XXXXXX)
  export DDEV_NONINTERACTIVE=true
  export DDEV_NO_INSTRUMENTATION=true
  ddev delete -Oy "${PROJNAME}" >/dev/null 2>&1 || true

  cd "${TESTDIR}"
  run ddev config --project-name="${PROJNAME}" --project-tld=ddev.site
  assert_success
  run ddev start -y
  assert_success
}

# Standard DDEV add-on tear down code taken from official DDEV add-ons.
teardown() {
  set -eu -o pipefail
  echo "# Tearing down test environment" >&3
  cd ${TESTDIR} || ( printf "unable to cd to ${TESTDIR}\n" && exit 1 )
  ddev delete -Oy ${PROJNAME} >/dev/null 2>&1
  cd ..
  [ "${TESTDIR}" != "" ] && rm -rf ${TESTDIR}
  echo "# Teardown complete" >&3
}

health_checks() {
  run ddev pa11y --help
  assert_output --partial "Usage: pa11y"
}

check_runs_successfully() {

  run ddev pa11y
  assert_output --partial "No URL passed, assuming 'https://web'"
  assert_output --partial "Running Pa11y on URL https://web"

  # Because the web container is empty Pa11y will analyse the Nginx forbidden
  # page that has issues so we expect to for the command to fail.
  assert_failure
}


@test "install from directory" {
  set -eu -o pipefail
  cd ${TESTDIR}
  echo "# ddev get ${DIR} with project ${PROJNAME} in ${TESTDIR} ($(pwd))" >&3

  ddev get ${DIR}

  ddev restart -y

  health_checks
  check_runs_successfully
}
