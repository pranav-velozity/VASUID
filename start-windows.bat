@echo off
setlocal
where node >NUL 2>&1 || ( echo Node.js not found. Install from https://nodejs.org/ and re-run. & pause & exit /b 1 )
npm install
set PORT=4000
set DB_PATH=uid_ops.sqlite
node server.js
