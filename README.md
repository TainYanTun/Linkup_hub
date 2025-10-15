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

The backend server will typically run on `http://localhost:3000` (or the port specified by `process.env.PORT`).

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

## Collaborators

<table>
  <tr>
    <td align="center">
      <a href="https://github.com/priyesh1504">
        <img src="https://avatars.githubusercontent.com/u/227090418?v=4" width="100px;" alt="Priyesh"/><br />
        <sub><b>Priyesh1504</b></sub>
      </a>
    </td>
    <td align="center">
      <a href="https://github.com/p-e-koko">
        <img src="https://avatars.githubusercontent.com/u/154047069?v=4" width="100px;" alt="Koko"/><br />
        <sub><b>p-e-koko</b></sub>
      </a>
    </td>
    <td align="center">
      <a href="https://github.com/EnowellDani">
        <img src="https://avatars.githubusercontent.com/u/78537625?v=4" width="100px;" alt="Enowell Dani"/><br />
        <sub><b>EnowellDani</b></sub>
      </a>
    </td>
    <td align="center">
      <a href="https://github.com/Ricardo-P4ul">
        <img src="https://avatars.githubusercontent.com/u/165893947?v=4" width="100px;" alt="Ricardo Paul"/><br />
        <sub><b>Ricardo-P4ul</b></sub>
      </a>
    </td>
  </tr>
</table>
