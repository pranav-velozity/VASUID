#!/usr/bin/env bash
set -e
if ! command -v node >/dev/null; then echo "Please install Node.js (https://nodejs.org/)"; exit 1; fi
npm install
export PORT=4000
export DB_PATH=uid_ops.sqlite
node server.js
