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

emerge -p1v dev-util/pkgcheck
which pkgcheck
pwd
ls -ahl

PORTDIR_OVERLAY="." pkgcheck ci || die "pkgcheck ci failed"
