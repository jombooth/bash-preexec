#!/usr/bin/env bats

@test "should not import if it's already defined" {
  __bp_imported="defined"
  source "${BATS_TEST_DIRNAME}/../bash-preexec.sh"
  [[ -z $(type -t __bp_preexec_and_precmd_install) ]]
}

@test "should import of not defined" {
  unset __bp_imported
  source "${BATS_TEST_DIRNAME}/../bash-preexec.sh"
  [[ -n $(type -t __bp_install) ]]
}

