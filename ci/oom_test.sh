#!/bin/bash
set -e

PATH="/root/.cargo/bin:$PATH"

./ci/test_servers.sh
cargo test
