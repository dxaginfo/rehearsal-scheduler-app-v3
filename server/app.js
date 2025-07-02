const express = require('express');
const app = express();
app.use(express.json());
app.get('/api/health', (req, res) => res.json({ status: 'ok' }));
// Add endpoints for users, groups, rehearsals, attendance, reminders, payments
module.exports = app;