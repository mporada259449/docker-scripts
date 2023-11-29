#!/bin/bash
(
for secret in $(find run/secrets/ -type f); do
    echo ""${secret##*/}"='$(cat "${secret}")'" >> .env
done
) &

if ! wait "${!}"; then
    exit 1
fi