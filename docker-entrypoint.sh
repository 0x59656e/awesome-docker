#!/bin/bash
set -eo pipefail
shopt -s nullglob

log() {
    local type="$1"
    shift
    # accept argument string or stdin
    local text="$*"
    if [ "$#" -eq 0 ]; then text="$(cat)"; fi
    local dt
    dt="$(date --rfc-3339=seconds)"
    printf '%s [%s] [Entrypoint]: %s\n' "$dt" "$type" "$text"
}

note() {
    log Note "$@"
}

warn() {
    log Warn "$@" >&2
}

error() {
    log ERROR "$@" >&2
    exit 1
}
