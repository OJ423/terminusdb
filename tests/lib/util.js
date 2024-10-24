// General utility functions

const crypto = require('crypto')

function isBoolean (val) {
  return typeof val === 'boolean'
}

function isInteger (val) {
  return Number.isInteger(val)
}

function isNonNegativeInteger (val) {
  return Number.isInteger(val) && val >= 0
}

function isString (val) {
  return typeof val === 'string' || val instanceof String
}

function isObject (val) {
  return val instanceof Object
}

function randomString () {
  return crypto.randomBytes(3).toString('hex')
}

module.exports = {
  isBoolean,
  isInteger,
  isNonNegativeInteger,
  isString,
  isObject,
  randomString,
}
