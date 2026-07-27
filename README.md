# Task Management Laravel API

This repository contains the Laravel backend for the task management application. It exposes a REST API for authentication, users, teams, and tasks, and uses Laravel Sanctum for token-based authentication.

## Architecture

- Laravel 13 backend
- REST API with Sanctum authentication
- MySQL/SQLite-compatible database setup
- React frontend consumes the API from the Vercel deployment
- The frontend and backend are deployed separately: Vercel for the React app and Railway for the Laravel API

## Local setup

### Requirements

- PHP 8.3+
- Composer
- Node.js 18+
- SQLite or MySQL available locally

### Steps

```bash
git clone https://github.com/Chony-Or/task-management-laravel-api.git
cd task-management-laravel-api
composer install
cp .env.example .env
php artisan key:generate
php artisan migrate --seed
php artisan serve
```

If you use SQLite locally, make sure the database file exists:

```bash
touch database/database.sqlite
```

## Test credentials

The seeded users are:

- Admin: admin@test.com / password123
- Manager: manager@test.com / password123
- Team Member: member@test.com / password123

## Environment variables

See [.env.example](.env.example) for the full list. Key variables:

```env
APP_ENV=local
APP_URL=http://localhost:8000
DB_CONNECTION=sqlite
SESSION_DRIVER=database
```

## API endpoints

All routes are prefixed with /api.

### Authentication

- POST /api/register
- POST /api/login
- GET /api/user

### Users

- GET /api/users
- POST /api/users
- PUT /api/users/{id}
- PATCH /api/users/{id}/toggle-active

### Tasks

- GET /api/member/tasks
- GET /api/admin/tasks
- GET /api/teams/{team_id}/tasks
- POST /api/tasks
- GET /api/tasks/{id}
- PATCH /api/tasks/{id}
- PATCH /api/tasks/{id}/status
- DELETE /api/tasks/{id}

### Teams

- GET /api/teams
- POST /api/teams

## Deployment URLs

- Backend (Railway): https://task-management-laravel-api-production-b3f4.up.railway.app
- Frontend (Vercel): https://task-management-react-nine.vercel.app

## Running tests

```bash
php artisan test
```
