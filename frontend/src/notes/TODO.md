# TODO for New Developers

Welcome to the project! Here are some tasks to get you started:

## 1. Understand the Project Structure

- `components/`: This is where you should create reusable React components. Try creating a simple `Button` or `Header` component here.
- `hooks/`: For custom React hooks. You might need to create hooks for managing state or side effects.
- `lib/`: For utility functions. Any helper function that can be reused across the project goes here.
- `pages/`: This is the core of the Next.js routing. Each file here is a page.
- `services/`: Use this directory to write functions that communicate with the backend API.
- `styles/`: For global styles.

## 2. Build the UI

- Start by creating the main UI components in the `components` directory.
- Use the components to build the pages in the `pages` directory.

## 3. Manage Application State

- Use React hooks (`useState`, `useEffect`, `useContext`) for managing state.
- For more complex state, consider creating custom hooks in the `hooks` directory.

## 4. Connect to the Backend

- The backend API endpoints are defined in the `backend/api` directory.
- Use the `services` directory to create functions that fetch data from these endpoints. You can use `fetch` or a library like `axios`.

## 5. Write Tests

- Add unit tests for your components and utility functions. (Note: Testing framework is not yet set up).

## 6. Local Development with HTTPS

For local development, the LIFF SDK requires a public HTTPS URL for its callback. You can use a tunneling service like `cloudflared` or `ngrok` to achieve this.

### Using Cloudflare Tunnel

1.  **Install `cloudflared`:** Follow the instructions on the [Cloudflare website](https://developers.cloudflare.com/cloudflare-one/connections/connect-apps/install-and-setup/installation/) to install the `cloudflared` daemon.
2.  **Start the tunnel:** Once your local development server is running (with `yarn dev`), open a new terminal and run:
    ```bash
    cloudflared tunnel --url localhost:9000
    ```
3.  **Get the public URL:** `cloudflared` will provide you with a public URL (e.g., `https://<your-tunnel-name>.trycloudflare.com`).
4.  **Update LIFF settings:** Copy this URL and add it to the 'Callback URL' field in your LIFF app settings on the LINE Developers Console. 
5.  **Access your app:** Use the public URL from `cloudflared` to access your application in the browser.

Happy coding!