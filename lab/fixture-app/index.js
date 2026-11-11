// Tiny, owned sample to inspect without third-party binaries or intellectual property.
export function totalWithTax(subtotal, taxRate) {
  if (!Number.isFinite(subtotal) || subtotal < 0) throw new RangeError('Invalid subtotal');
  if (!Number.isFinite(taxRate) || taxRate < 0 || taxRate > 1) throw new RangeError('Invalid tax rate');
  return Math.round((subtotal * (1 + taxRate) + Number.EPSILON) * 100) / 100;
}

export function shippingBand(weightKg) {
  if (!Number.isFinite(weightKg) || weightKg < 0) throw new RangeError('Invalid weight');
  if (weightKg <= 5) return 'small';
  if (weightKg <= 25) return 'medium';
  return 'large';
}
