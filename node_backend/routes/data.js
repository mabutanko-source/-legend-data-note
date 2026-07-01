const express = require('express');
const router = express.Router();

// Data packages
const dataPackages = [
  { id: 1, provider: 'MTN', name: '1GB', price: 500, duration: '30 days' },
  { id: 2, provider: 'MTN', name: '2GB', price: 900, duration: '30 days' },
  { id: 3, provider: 'GLO', name: '1GB', price: 450, duration: '30 days' },
  { id: 4, provider: 'AIRTEL', name: '1GB', price: 480, duration: '30 days' },
  { id: 5, provider: '9MOBILE', name: '1GB', price: 420, duration: '30 days' },
];

// Get all data packages
router.get('/', (req, res) => {
  res.json(dataPackages);
});

// Get data packages by provider
router.get('/provider/:provider', (req, res) => {
  const { provider } = req.params;
  const packages = dataPackages.filter(p => p.provider.toUpperCase() === provider.toUpperCase());
  res.json(packages);
});

// Purchase data
router.post('/purchase', (req, res) => {
  try {
    const { packageId, phoneNumber } = req.body;

    if (!packageId || !phoneNumber) {
      return res.status(400).json({ error: 'Package ID and phone number required' });
    }

    const pkg = dataPackages.find(p => p.id === packageId);
    if (!pkg) {
      return res.status(404).json({ error: 'Package not found' });
    }

    // Simulate purchase
    const transaction = {
      id: Date.now().toString(),
      packageId,
      phoneNumber,
      amount: pkg.price,
      status: 'successful',
      timestamp: new Date(),
      provider: pkg.provider,
      data: pkg.name,
    };

    res.json({
      message: 'Data purchase successful',
      transaction,
    });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

module.exports = router;