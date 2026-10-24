# BombayBooze API

BombayBooze API is a FastAPI-based backend for a beverage platform. It includes user authentication, signup/login flows, JWT authorization, age validation, and a health check endpoint. The project is designed to run either locally with Python or in Docker Compose with a MySQL database.

## Features

- FastAPI application with CORS support
- SQLAlchemy + MySQL integration
- Alembic migrations for database schema management
- JWT-based authentication and authorization
- User registration and login endpoints
- Minimum-age verification on signup
- Protected authenticated user endpoint
- Health check endpoint
- Docker-ready setup for app + MySQL

## Tech Stack

- Python 3.10+
- FastAPI
- Uvicorn
- SQLAlchemy
- Alembic
- MySQL
- PyJWT
- BCrypt
- Pydantic + Pydantic Settings
- Docker + Docker Compose

## Project Structure

- `app/` - application package
- `app/main.py` - FastAPI app setup and route registration
- `app/config.py` - environment-based configuration
- `app/database.py` - database engine/session setup
- `app/models.py` - SQLAlchemy models
- `app/schemas.py` - request/response schemas
- `app/security.py` - password hashing and JWT logic
- `app/routers/auth.py` - authentication routes
- `alembic/` - database migration files
- `alembic.ini` - Alembic configuration
- `requirement.txt` - Python dependencies
- `docker-compose.yml` - MySQL + API container setup
- `.env` - local environment variables

## Prerequisites

- Python 3.10 or newer
- MySQL database (local or via Docker)
- Docker and Docker Compose (optional, for containerized setup)
- A `.env` file in the project root

## Environment Variables

Create a `.env` file in the project root with values similar to:

```env
DB_HOST=127.0.0.1
DB_PORT=3306
DB_USER=appuser
DB_PASSWORD=your_db_password
DB_NAME=BombayBoozeDB
DB_ROOT_PASSWORD=root_password
JWT_SECRET=your_super_secret_key
JWT_ALGORITHM=HS256
JWT_EXPIRE_MINUTES=60
MIN_AGE=21
```

Notes:
- `DB_HOST` is `127.0.0.1` when running locally.
- When running through Docker Compose, the app container uses `DB_HOST=db` automatically.
- `DB_ROOT_PASSWORD` is used by the MySQL container in Docker Compose.

## Install and Run Locally

1. Clone the repository:

   ```bash
   git clone <repository-url>
   cd bombaybooze-api
   ```

2. Create and activate a virtual environment:

   ```bash
   python3 -m venv .venv
   source .venv/bin/activate
   ```

3. Install dependencies:

   ```bash
   pip install --upgrade pip
   pip install -r requirement.txt
   ```

4. Make sure MySQL is running and the database exists:

   ```sql
   CREATE DATABASE BombayBoozeDB;
   ```

5. Run database migrations:

   ```bash
   alembic upgrade head
   ```

6. Start the API:

   ```bash
   uvicorn app.main:app --reload
   ```

7. Open the app in your browser:

   - API: http://localhost:8000
   - Swagger docs: http://localhost:8000/docs
   - ReDoc: http://localhost:8000/redoc

## Run with Docker Compose

This project includes a `docker-compose.yml` file to run both the MySQL database and the API container.

1. Make sure your `.env` file is set up.
2. Build and start the services:

   ```bash
   docker compose up --build
   ```

3. To stop the environment:

   ```bash
   docker compose down
   ```

4. To remove volumes as well:

   ```bash
   docker compose down -v
   ```

Once the Docker stack is running, use these local links:

- API: http://localhost:8000
- API docs: http://localhost:8000/docs
- MySQL database: localhost:3307
- MySQL connection string example: mysql://root:your_root_password@localhost:3307/BombayBoozeDB

The database is exposed on port `3307` on your host machine to avoid conflicts with any local MySQL installation.

## Database Setup

When using Docker Compose, the MySQL container automatically creates the database using the values from `.env`.

You can verify the DB manually if needed:

```bash
mysql -h 127.0.0.1 -P 3307 -u root -p
```

## Alembic Commands

Use the following commands to manage database migrations:

```bash
alembic upgrade head          # apply all migrations to the database
alembic downgrade -1         # revert the last migration
alembic current               # show the current revision
alembic history               # list migration history
alembic revision --autogenerate -m "description"   # create a new migration
alembic upgrade head --sql   # preview migration SQL without applying it
```

## API Endpoints

### Health

- `GET /health`

### Authentication

- `POST /api/auth/signup`
- `POST /api/auth/login`
- `GET /api/auth/me`

## Default Behavior

- CORS is enabled for `http://localhost:3000`
- Signup requires the user to be at least 21 years old by default
- JWT tokens are generated using the configured secret and expiry time

## Generate a JWT Secret

You can generate a secure secret token with:

```bash
python3 -c "import secrets; print(secrets.token_urlsafe(48))"
```

## Troubleshooting

- If the app cannot connect to MySQL, verify your `.env` values and database status.
- If running in Docker, confirm the app uses `DB_HOST=db` inside the container.
- If authentication fails, verify the `JWT_SECRET` and token expiry configuration.
- If dependencies are missing, reinstall them using:

  ```bash
  pip install -r requirement.txt
  ```

## Notes

This project is a backend API intended to be used with a frontend app or API client such as Postman, Swagger UI, or a React/Vue frontend.