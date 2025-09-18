# UID Ops Backend (MVP)

Express + SQLite backend that matches the UID Ops UI.

## Local quick start
```bash
# 1) Unzip this folder
# 2) Open a terminal in the folder
npm install
npm start   # starts http://localhost:4000
```

The SQLite file is `uid_ops.sqlite` in the folder. Data persists between runs.

## Deploy to Render (gets you a https:// URL)
1. Push this folder to a new GitHub repo.
2. In Render, **New > Web Service**, connect the repo.
3. Render auto-detects `render.yaml`:
   - Node service, free plan
   - 1GB persistent disk mounted at `/var/data`
   - Env sets `DB_PATH=/var/data/uid_ops.sqlite`
4. Click **Deploy** → you get a public URL like `https://uid-ops-backend.onrender.com`.

## Frontend setting
Set your UI env var `VITE_API_BASE` to the backend URL. Examples:
- Local: `http://localhost:4000`
- Render: `https://<your-service>.onrender.com`

## Endpoints
- `PATCH /records/:id` — upsert field; completes row & timestamps when all required fields present.
- `GET /records?from=&to=&status=complete&limit=` — fetch completed rows for a window.
- `GET /events/scan` — Server-Sent Events stream for live cardio.
- `GET /export/xlsx?date=YYYY-MM-DD` — download a daily Excel export.

## Optional: Docker
```bash
docker build -t uid-ops-backend .
docker run -p 4000:4000 -e DB_PATH=/data/uid_ops.sqlite -v $(pwd)/data:/data uid-ops-backend
```
