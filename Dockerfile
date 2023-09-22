# Stage 1: Build Stage
FROM python:3.10-slim AS builder

WORKDIR /app

COPY requirements.txt /app
COPY devops /app

RUN pip install --no-cache-dir -r requirements.txt && \
    cd devops

# Stage 2: Runtime Stage
FROM python:3.10-slim

WORKDIR /app

# Create and activate a virtual environment
RUN python -m venv /venv
ENV PATH="/venv/bin:$PATH"

# Install Django and any other required packages
RUN pip install --no-cache-dir django

COPY --from=builder /app /app

CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]
