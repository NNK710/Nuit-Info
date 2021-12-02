'use strict'
const git = require('git-rev')

module.exports = () => {
  return new Promise((resolve, reject) => {
    git.branch(branchName => {
      if (!branchName) {
        return resolve(null)
      }

      const matches = branchName.match(/(JA|DE)\d+/i)

      if (!matches || !matches.length || !matches[0]) {
        return resolve(null)
      }

      resolve(matches[0].toUpperCase())
    })
  })
}
