#!/usr/bin/env bash

# Copyright 2015 the original author or authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

##############################################################################
##
##  Gradle start up script for UN*X
##
##############################################################################

# Determine the script directory and the absolute path to gradle home
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
GRADLE_HOME="$(realpath "${SCRIPT_DIR}/../gradle")"

# Determine the OS type
OS_TYPE="$(uname | tr '[:upper:]' '[:lower:]')"

# Default JVM options
DEFAULT_JVM_OPTS=('-Xmx64m' '-Xms64m')

# Maximum file descriptors
MAX_FD="maximum"

# Function to print warning message
warn() {
    printf '%s\n' "$*" >&2
}

# Function to print error message and exit
die() {
    printf '\n' >&2
    printf '%s\n' "$*" >&2
    printf '\n' >&2
    exit 1
}

# Set JAVA_HOME if not already set
if [[ -z "${JAVA_HOME}" ]]; then
    if [[ -x "/usr/bin/which" ]]; then
        if java=$(which java 2>/dev/null); then
            JAVA_HOME=$(dirname $(dirname ${java}))
        fi
    fi
fi

# Check if JAVA_HOME is set
if [[ -z "${JAVA_HOME}" ]]; then
    die "ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH."
fi

# Check if JAVA_HOME is a valid directory
if [[ ! -d "${JAVA_HOME}" ]]; then
    die "ERROR: JAVA_HOME is set to an invalid directory: ${JAVA_HOME}"
fi

# Check if JAVA_HOME/bin/java exists
JAVACMD="${JAVA_HOME}/bin/java"
if [[ ! -x "${JAVACMD}" ]]; then
    die "ERROR: JAVA_HOME is set to an invalid directory: ${JAVA_HOME}"
fi

# Increase the maximum file descriptors if we can
if [[ "${OS_TYPE}" != "darwin" ]] && [[ "${OS_TYPE}" != "cygwin" ]] && [[ "${OS_TYPE}" != "msys" ]]; then
    MAX_FD_LIMIT=$(ulimit -H -n 2>/dev/null)
    if [[ "${?}" -eq 0 ]]; then
        if [[ "${MAX_FD}" == "maximum" || "${MAX_FD}" == "max" ]]; then
            MAX_FD="${MAX_FD_LIMIT}"
        fi
        ulimit -n "${MAX_FD}"
        if [[ "${?}" -ne 0 ]]; then
            warn "Could not set maximum file descriptor limit: ${MAX_FD}"
        fi
    else
        warn "Could not query maximum file descriptor limit: ${MAX_FD_LIMIT}"
    fi
fi

# Set GRADLE_OPTS
GRADLE_OPTS=()
if [[ "${OS_TYPE}" == "darwin" ]]; then
    GRADLE_OPTS+=("-Xdock:name=${APP_NAME}")
    GRADLE_OPTS+=("-Xdock:icon=${GRADLE_HOME}/media/gradle.icns")
fi

# Escape application arguments
APP_ARGS=()
for arg in "$@"; do
    escaped_arg=$(printf '%s\n' "${arg}" | sed "s/'/'\\\\''/g;1s/^/'/;\$s/\$/' \\\\/" )
    APP_ARGS+=("${escaped_arg}")
done

# Collect all arguments for the java command
exec "${JAVACMD}" "${DEFAULT_JVM_OPTS[@]}" "${JAVA_OPTS[@]}" "${GRADLE_OPTS[@]}" \
    "-Dorg.gradle.appname=${APP_BASE_NAME}" \
    "-classpath ${GRADLE_HOME}/gradle/wrapper/gradle-wrapper.jar" \
    "org.gradle.wrapper.GradleWrapperMain" "${APP_ARGS[@]}"
