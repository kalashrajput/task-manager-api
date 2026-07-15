# Task Manager API

A RESTful Task Manager API built with **FastAPI** and **PostgreSQL**, fully containerized using **Docker** and orchestrated with **Docker Compose**.

## Features
- Create, read, update, and delete tasks (CRUD)
- Task fields: title, description, due date, completion status
- Auto-generated interactive API docs (Swagger UI)
- PostgreSQL database with persistent storage via Docker volumes
- Multi-container setup (app + database) connected over a custom Docker network
- Multi-stage Dockerfile for a lean, production-style image
- Environment-based configuration using `.env`

## Tech Stack
- **Backend:** FastAPI (Python)
- **Database:** PostgreSQL with SQLAlchemy ORM
- **Containerization:** Docker (multi-stage build)
- **Orchestration:** Docker Compose

## API Endpoints

| Method | Endpoint          | Description         |
|--------|-------------------|----------------------|
| GET    | `/`                | Health check         |
| GET    | `/tasks`           | Get all tasks        |
| POST   | `/tasks`           | Create a new task     |
| GET    | `/tasks/{task_id}` | Get a single task     |
| PUT    | `/tasks/{task_id}` | Update a task         |
| DELETE | `/tasks/{task_id}` | Delete a task          |

## Running with Docker Compose

### 1. Create a `.env` file in the project root
POSTGRES_USER=your_username
POSTGRES_PASSWORD=your_password
POSTGRES_DB=your_dbname

### 2. Build and start the containers
```bash
docker compose up --build
```

This starts two services:
- `app` — the FastAPI application (port `8000`)
- `db` — PostgreSQL database with persistent volume storage

### 3. Access the API
Open your browser at:
http://127.0.0.1:8000/docs

### 4. Stop the containers
```bash
docker compose down
```

## Running Locally (without Docker)

```bash
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
uvicorn main:app --reload
```
> Note: Running locally without Docker will fall back to a local SQLite database unless a `DATABASE_URL` environment variable is set.

## Project Structure
task-manager-api/
├── main.py              # FastAPI app & routes
├── database.py          # DB connection setup (env-based)
├── models.py            # SQLAlchemy models
├── schemas.py           # Pydantic schemas
├── requirements.txt     # Dependencies
├── Dockerfile            # Multi-stage build
├── docker-compose.yml   # App + Postgres orchestration
├── .dockerignore
└── .gitignore