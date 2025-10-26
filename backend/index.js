// Main Express server file

require('dotenv').config(); // Load environment variables
const express = require('express');
const app = express();
const port = process.env.PORT || 3000;

const jobsRouter = require('./api/jobs'); // Import the jobs router

app.get('/', (req, res) => {
  res.send('Hello from the backend!');
});


app.use('/jobs', jobsRouter); // Use the jobs router for /jobs endpoint

app.listen(port, () => {
  console.log(`Backend listening at http://localhost:${port}`);
});