require('dotenv').config();
const express = require('express');
const axios = require('axios');
const router = express.Router();

// New route to search for jobs
router.get('/', async (req, res) => {
  const apiKey = process.env.RAPIDAPI_KEY; // Your RapidAPI Key from .env
  const apiUrl = 'https://jsearch.p.rapidapi.com/search';
  const query = req.query.q || 'developer jobs'; // Allow query parameter, default to 'developer jobs'
  const country = req.query.country || 'thailand'; // Allow country parameter, default to 'thailand'

  if (!apiKey) {
    return res.status(500).json({ error: 'RapidAPI key not configured. Please set RAPIDAPI_KEY in your .env file.' });
  }

  try {
    const response = await axios.get(apiUrl, {
      headers: {
        'X-RapidAPI-Key': apiKey,
        'X-RapidAPI-Host': 'jsearch.p.rapidapi.com'
      },
      params: {
        query: query,
        page: '1',
        num_pages: '1',
        country: country,
        date_posted: 'all'
      }
    });
    res.json(response.data);
  } catch (error) {
    console.error('Error fetching jobs:', error);
    res.status(500).json({ error: 'Failed to fetch jobs' });
  }
});

module.exports = router;