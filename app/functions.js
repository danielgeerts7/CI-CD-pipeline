// Logic for calculating fare according to ride details
function catString(...a) {
    meow = ''
    for (var i = 0; i < a.length; i++) {
        meow += a[i]
    }
    return meow.trim()
}
  
// Exports the two functions to server.js
exports = module.exports = {
    catString
}
