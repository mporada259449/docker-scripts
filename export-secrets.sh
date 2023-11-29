#!/bin/bash
(
for secret in $(find /run/secrets/ -type f); do
    echo ""${secret##*/}"='$(cat "${secret}")'" >> .env
done
) &

if ! wait "${!}"; then
    echo "Could not export secrets to .env"
fi