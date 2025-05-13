#!/bin/bash

FAILED=0

print_failed_message() {
    COMPONENT="$*"
    cat <<EOF
****************
*
*
* *** FAILED: ${COMPONENT} ***
*
*
****************
EOF
}

FAILED_CHECKS=

echo "Black..."
if ! black --check .; then
    print_failed_message black
    FAILED_CHECKS="${FAILED_CHECKS} black (use ./format.sh)"
    FAILED=1
fi

echo "Isort..."
if ! isort --check .; then
    print_failed_message isort
    FAILED_CHECKS="${FAILED_CHECKS} isort (use ./format.sh)"
    FAILED=1
fi

echo "Flake8..."
if ! flake8; then
    print_failed_message flake8
    FAILED_CHECKS="${FAILED_CHECKS} flake8"
    FAILED=1
fi

echo "PyLint..."
if ! pylint src tests ; then
    print_failed_message pylint
    FAILED_CHECKS="${FAILED_CHECKS} pylint"
    FAILED=1
fi

echo "MyPy..."
if ! mypy; then
    print_failed_message mypy
    FAILED_CHECKS="${FAILED_CHECKS} mypy"
    FAILED=1
fi

echo "Coverage & Pytest..."
if ! coverage run -m pytest; then
    print_failed_message pytest
    FAILED_CHECKS="${FAILED_CHECKS} pytest"
    FAILED=1
fi

case $FAILED in
    0) ;;
    *) print_failed_message "${FAILED_CHECKS}"
esac

exit $FAILED
