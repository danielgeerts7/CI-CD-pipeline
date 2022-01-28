// Importing mocha and chai
const mocha = require('mocha')
const chai = require('chai')
  
// Importing functions.js where our code is written
const functions = require('../functions')
  
const expect = chai.expect
  
// Group of tests using describe
describe('app.functions', function () {
  
    // test one word
    it('expect output "hello" in the string, "hello"', () => {
        let newName = functions.catString("hello")
        expect(newName).to.equal("hello")
    })
    // test two word
    it('expect output "hello" + "world" in the string, "hello world!"', () => {
        let newName = functions.catString("hello", "world!")
        expect(newName).to.equal("hello world!")
    })
    // test a sentence
    it('expect output "Hello" + "my" + "name" + "is" "Daniël" in the string, "Hello my name is Daniël"', () => {
        let newName = functions.catString("Hello", "my", "name", "is", "Daniël")
        expect(newName).to.equal("Hello my name is Daniël")
    })
})