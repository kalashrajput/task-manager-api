FROM python:3.11-slim AS builder 

WORKDIR /app

RUN python -m venv /app/venv

COPY requirements.txt .

RUN /app/venv/bin/pip install --no-cache-dir -r requirements.txt 

FROM python:3.11-slim

COPY --from=builder app/venv app/venv

COPY . .

ENV PATH="/app/venv/bin:$PATH"

EXPOSE 8000

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]