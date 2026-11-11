import test from 'node:test';
import assert from 'node:assert/strict';
import { totalWithTax, shippingBand } from './index.js';

test('totals are calculated with explicit tax rates', () => {
  assert.equal(totalWithTax(100, 0.15), 115);
  assert.equal(totalWithTax(25.5, 0), 25.5);
});

test('shipping is bucketed at documented thresholds', () => {
  assert.equal(shippingBand(5), 'small');
  assert.equal(shippingBand(5.01), 'medium');
  assert.equal(shippingBand(25), 'medium');
  assert.equal(shippingBand(25.01), 'large');
});

test('invalid inputs fail closed', () => {
  assert.throws(() => totalWithTax(-1, 0.15), RangeError);
  assert.throws(() => totalWithTax(10, -1), RangeError);
  assert.throws(() => shippingBand(NaN), RangeError);
});
