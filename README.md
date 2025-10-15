
# Lineapp Monorepo

This repository contains a monorepo setup for a LINE mini-app, consisting of a frontend LIFF application and an Express.js backend.

## Project Structure

- `frontend/`: Contains the LINE LIFF starter app (Next.js version).
- `backend/`: Contains the Express.js backend application.

## Getting Started

Follow the instructions below to set up and run both the frontend and backend services.

### 1. Backend Setup

Navigate to the `backend` directory, install dependencies, and start the server.

```bash
cd backend
npm install
node index.js
```

The backend server will typically run on `http://localhost:9000` (or the port specified by `process.env.PORT`).

### 2. Frontend Setup

Navigate to the `frontend/src/nextjs` directory, install dependencies, and start the development server.

```bash
cd frontend/src/nextjs
yarn install
yarn dev
```

The frontend development server will usually open in your browser at `http://localhost:9000`.

## Deployment

(Add deployment instructions here for both frontend and backend, e.g., Netlify for frontend, Heroku/Vercel/Render etc. for backend)
