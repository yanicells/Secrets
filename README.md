# Secrets

A lightweight app for keeping personal "secrets" safe. Users authenticate via Google OAuth. A demo of the app can be found through this link [https://drive.google.com/file/d/1igcVHB7b9Xx2kXGPNNNPPM-JhGhIkn5r/view]

## Tech Stack

- **Frontend**: TailwindCSS
- **Backend**: Node.js (Express.js)
- **Database**: PostgreSQL

## Setup Guide

### Prerequisites

- Node.js (>= 18.x)
- npm (>= 9.x)
- PostgreSQL running locally

### Clone the Repository

```bash
git clone https://github.com/yanicells/Secrets.git
cd Secrets
```

### Install Dependencies

```bash
npm install
```

(Optional) Install nodemon globally:

```bash
npm install -g nodemon
```

### Database Setup

Make sure PostgreSQL is running. [Install PostgreSQL](https://www.postgresql.org) if you haven't.
No need to create a table, just create a database, and make sure it connects to the terminal (or command prompt) once you have.

#### Create a database:

```sql
CREATE DATABASE SecretsDB;

CREATE TABLE users(
id SERIAL PRIMARY KEY,
email VARCHAR(100) NOT NULL UNIQUE,
password VARCHAR(100),
);

CREATE TABLE secrets(
id SERIAL PRIMARY KEY,
secret TEXT NOT NULL,
user_email VARCHAR(100) REFERENCES users(email)
);
```

### Environment Variables

Create a `.env` file in the root directory.
Fill in the information. The port should be 5432 by default.

```env
GOOGLE_CLIENT_ID="your-google-client-id"
GOOGLE_CLIENT_SECRET="your-google-client-secret"
SESSION_SECRET="a-strong-random-session-secret"
PG_USER=""
PG_HOST=""
PG_DATABASE=""
PG_PASSWORD=""
PG_PORT=5432
```

Google OAuth setup:

1. Go to https://console.developers.google.com and create or select a project.
2. Under "APIs & Services" → "Credentials" create an OAuth 2.0 Client ID for a Web application.
3. Set the authorized redirect URI to: `http://localhost:3000/auth/google/secrets` (matches the app's callback).
4. Copy the Client ID and Client Secret into your `.env` as `GOOGLE_CLIENT_ID` and `GOOGLE_CLIENT_SECRET`.

The app uses `passport-google-oauth2` and the Google profile email to create or find users in the database. When a Google account signs in for the first time the user is created with a placeholder password of "google" in the `users` table.

### Run the Project

```bash
# Start with nodemon
nodemon index.js
```

Project will be available at: http://localhost:3000

## Usage

1. Open the landing page at `/`.
2. Click "Sign in with Google" to authenticate.
3. After signing in you'll be redirected to `/secrets` where your saved secret is displayed.
4. To submit or change your secret, open `/submit`, enter your secret, and submit, it will be saved to your account.
5. Use `/logout` to sign out of the session.
