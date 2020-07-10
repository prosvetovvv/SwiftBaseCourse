//
//  lesson2_functions.swift
//  SwiftBaseCourse
//

// Even number?

func isEven(number: Int) -> Bool {
    return number % 2 == 0
}


// Delete from array even numbers and numbers is not a multiple of 3

func deleteNumbersFrom (array: [Int]) -> [Int] {
    var newArray = [Int]()
    for element in array {
        if (element % 2 != 0) && (element % 3 == 0){
            newArray.append(element)
        }
    }
    return newArray
}

// Create array of Fibonacci's numbers

func getFibonacciFor(number: Int) -> [Int] {
    
    var previousNumber = -1
    var nextNumber = 1
    var amount = 0
    var resultArray = [Int]()
    
    for _ in 0..<number {
        amount = previousNumber + nextNumber
        previousNumber = nextNumber
        nextNumber = amount
        resultArray.append(amount)
    }
    return resultArray
}

// Create array of prime numbers, sieve of Eratosthenes

func getPrimeNumbers (limit: Int) -> [Int] {
    var trueArray = Array(repeating: true, count: limit + 1)
    let firstPrime = 2
    var i = firstPrime
    let lengthArray = trueArray.count
    
    while i * i <= lengthArray {
        if trueArray[i] {
            var j = i * i
            while j < lengthArray {
                trueArray[j] = false
                j += i
            }
            i += 1
        } else {
            i += 1
        }
    }
    var primeArray = [Int]()
    for (index, value) in trueArray.enumerated() where value && index > 1 {
        primeArray.append(index)
    }
    return primeArray
}
