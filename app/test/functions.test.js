// Importing mocha and chai
const mocha = require('mocha')
const chai = require('chai')
  
// Importing app.js where our code is written
const functions = require('../functions')
  
const expect = chai.expect
  
// Group of tests using describe
describe('app.functions', function () {
  
    // We will describe each single test using it
    it('expect output "hello" in the string, "hello"', () => {
        let newName = functions.catString("hello")
        expect(newName).to.equal("hello")
    })

    it('expect output "hello" + "world" in the string, "hello world"', () => {
        let newName = functions.catString("hello", "world")
        expect(newName).to.equal("hello world")
    })

    it('expect output "Hello" + "World" + "!" in the string, "Hello World !"', () => {
        let newName = functions.catString("Hello", "World", "!")
        expect(newName).to.equal("Hello World !")
    })
})