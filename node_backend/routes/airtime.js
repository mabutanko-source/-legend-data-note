const express = require('express');
const router = express.Router();

// Get airtime denominations
router.get('/denominations', (req, res) => {
  const denominations = [
    { id: 1, amount: 100, provider: 'MTN' },
    { id: 2, amount: 200, provider: 'MTN' },
    { id: 3, amount: 500, provider: 'MTN' },
    { id: 4, amount: 1000, provider: 'MTN' },
    { id: 5, amount: 100, provider: 'GLO' },
    { id: 6, amount: 200, provider: 'GLO' },
    { id: 7, amount: 500, provider: 'GLO' },
    { id: 8, amount: 1000, provider: 'AIRTEL' },
  ];
  res.json(denominations);
});

// Purchase airtime
router.post('/purchase', (req, res) => {
  try {
    const { phoneNumber, amount, provider } = req.body;

    if (!phoneNumber || !amount || !provider) {
      return res.status(400).json({ error: 'All fields required' });
    }

    // Simulate purchase
    const transaction = {
      id: Date.now().toString(),
      phoneNumber,
      amount,
      provider,
      status: 'successful',
      timestamp: new Date(),
    };

    res.json({
      message: 'Airtime purchase successful',
      transaction,
    });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

module.exports = router;