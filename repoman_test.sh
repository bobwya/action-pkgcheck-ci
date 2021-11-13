#!/usr/bin/env bash
set -e

function die()
{
    echo "::error::$1"
        echo "------------------------------------------------------------------------------------------------------------------------"
    exit 1
}

[[ -z "${GITHUB_WORKSPACE}" ]] && die "Must set GITHUB_WORKSPACE in env"
cd "${GITHUB_WORKSPACE}" || die "GITHUB_WORKSPACE does not exist" 

emerge -p1v app-portage/repoman
which repoman
pwd
ls -ahl

PORTDIR_OVERLAY="." repoman --straight-to-stable -dx full || die "repoman failed"
