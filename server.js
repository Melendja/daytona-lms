const express = require('express');
const cors    = require('cors');
require('dotenv').config();

const app  = express();
const PORT = process.env.PORT || 3001;

app.use(cors());
app.use(express.json());

// Health check — confirms server is running
app.get('/', (req, res) => {
  res.json({ 
    message: 'Daytona LMS API is running!',
    version: '1.0',
    status:  'OK'
  });
});

app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});