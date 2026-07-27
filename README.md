# Task Management Laravel API

This project is a Laravel-based REST API for managing users, teams, and tasks. It uses Laravel Sanctum for token authentication and supports role-based access for admin, manager, and team member workflows.

## What this system includes

- Authentication with Sanctum
  - Register a new user
  - Login and receive an API token
  - Access the authenticated user profile

- User management
  - List users
  - Create users (admin only)
  - Update users (admin only)
  - Toggle a user between active and inactive (admin only)

- Team management
  - List teams
  - Create teams

- Task management
  - View all tasks (admin/manager)
  - View tasks for a specific team (admin/manager)
  - View tasks assigned to the authenticated member
  - Create tasks
  - View a single task
  - Update task details
  - Update task status with basic transition rules
  - Cancel/delete a task by changing its status to cancelled

## Main components

- Controllers
  - AuthController: handles registration and login
  - UserController: manages users and user activity state
  - TaskController: manages task listing, creation, updates, and status changes
  - TeamController: manages teams

- Models
  - User: represents app users and their role/team relationship
  - Team: groups users and tasks together
  - Task: stores task details and ownership information

- Routes
  - API routes are defined in routes/api.php
  - Protected routes require Sanctum authentication

- Database
  - Uses Laravel migrations for users, teams, tasks, and Sanctum tokens
  - Seeders are available for sample data

## Requirements

Before setting up the project, make sure you have:

- PHP 8.3 or newer
- Composer
- Node.js and npm
- A local web server is optional when using php artisan serve

## Setup instructions

1. Clone the repository
   ```bash
   git clone <repository-url>
   cd task-management-laravel-api
   ```

2. Install PHP dependencies
   ```bash
   composer install
   ```

3. Create the environment file
   ```bash
   cp .env.example .env
   ```

4. Generate the app key
   ```bash
   php artisan key:generate
   ```

5. Set up the database
   The project is configured to use SQLite by default. If you want to keep the default setup, make sure the database file exists:
   ```bash
   touch database/database.sqlite
   ```

6. Run migrations and seed the database
   ```bash
   php artisan migrate --seed
   ```

7. Install frontend assets dependencies
   ```bash
   npm install
   ```

8. Build the frontend assets
   ```bash
   npm run build
   ```

9. Start the development server
   ```bash
   php artisan serve
   ```

You can also run the project with the included script:

```bash
composer run dev
```

## API overview

All API routes are prefixed with /api.

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

## Role behavior

- Admin: can manage users, view all tasks, and manage teams
- Manager: can view all tasks and team-based task lists
- Team member: can view tasks assigned to them and update their task status
