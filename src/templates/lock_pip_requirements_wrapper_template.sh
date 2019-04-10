#!/bin/bash
if [ -z ${BUILD_WORKSPACE_DIRECTORY+x} ]; then
    echo "This script must be executed with Bazel"
    exit 1
fi

LOCK_PIP_REQUIREMENTS_PY2="@@LOCK_PIP_REQUIREMENTS_PY2@@"
LOCK_PIP_REQUIREMENTS_PY3="@@LOCK_PIP_REQUIREMENTS_PY3@@"
USE_PY2=@@USE_PY2@@
USE_PY3=@@USE_PY3@@
REQUIREMENTS_LOCK_PATH="$BUILD_WORKSPACE_DIRECTORY/@@REQUIREMENTS_LOCK_PATH@@"
WHEEL_DIRECTORY="$BUILD_WORKSPACE_DIRECTORY/@@WHEEL_DIRECTORY@@"
REQUIREMENTS_TXT_PATHS="@@REQUIREMENTS_TXT_PATHS@@"

echo "Compiling $REQUIREMENTS_LOCK_PATH"

if [ "$USE_PY2" = true ]; then
    $LOCK_PIP_REQUIREMENTS_PY2 \
        --lock-file $REQUIREMENTS_LOCK_PATH \
        --wheel-dir $WHEEL_DIRECTORY \
        "$@" \
        $REQUIREMENTS_TXT_PATHS
fi

if [ "$USE_PY3" = true ]; then
    $LOCK_PIP_REQUIREMENTS_PY3 \
        --lock-file $REQUIREMENTS_LOCK_PATH \
        --wheel-dir $WHEEL_DIRECTORY \
        "$@" \
        $REQUIREMENTS_TXT_PATHS
fi
