/* Cat list of words to return a sentence
* param: ...a -> list of words
*/
exports.catString = function (...words) {
    sentence = ''
    for (var i = 0; i < words.length; i++) {
        sentence += words[i] + ' '
    }
    return sentence.trim()
}
