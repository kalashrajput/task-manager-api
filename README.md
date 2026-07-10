# Task Manager API

A simple RESTful Task Manager API built with **FastAPI** and **SQLite**, fully containerized using **Docker**.

## Features
- Create, read, update, and delete tasks (CRUD)
- Task fields: title, description, due date, completion status
- Auto-generated interactive API docs (Swagger UI)
- SQLite database for persistence
- Fully Dockerized for consistent deployment across environments

## Tech Stack
- **Backend:** FastAPI (Python)
- **Database:** SQLite with SQLAlchemy ORM
- **Containerization:** Docker

## API Endpoints

| Method | Endpoint          | Description         |
|--------|-------------------|----------------------|
| GET    | `/`                | Health check         |
| GET    | `/tasks`           | Get all tasks        |
| POST   | `/tasks`           | Create a new task     |
| GET    | `/tasks/{task_id}` | Get a single task     |
| PUT    | `/tasks/{task_id}` | Update a task         |
| DELETE | `/tasks/{task_id}` | Delete a task          |

## Running with Docker

### Build the image
```bash
docker build -t task-manager-api .
```

### Run the container
```bash
docker run -d -p 8000:8000 --name task-manager-container task-manager-api
```

### Access the API
Open your browser at:
http://127.0.0.1:8000/docs

### Stop the container
```bash
docker stop task-manager-container
```

## Running Locally (without Docker)

```bash
python -m venv venv
venv\Scripts\activate
pip install -r requirements.txt
uvicorn main:app --reload
```

## Project Structure
task-manager/
├── main.py           # FastAPI app & routes
├── database.py       # DB connection setup
├── models.py         # SQLAlchemy models
├── schemas.py        # Pydantic schemas
├── requirements.txt  # Dependencies
├── Dockerfile
└── .dockerignore