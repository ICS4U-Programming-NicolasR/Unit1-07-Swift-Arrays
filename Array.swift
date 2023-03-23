//
// Array.swift
//
//  Created by Nicolas Riscalas
//  Created on 2023-03-22
//  Version 1.0
//  Copyright (c) 2023 Nicolas Riscalas. All rights reserved.
//
//  Calculates the mean median and mode
import Foundation

// Define the path to the input text file
let inputFilePath = "Unit1-06-Set.txt"

// Read the dataset from the input text file
guard let inputData = try? String(contentsOfFile: inputFilePath) else {
    fatalError("Failed to read input data from file at path: \(inputFilePath)")
}

// Parse the input data into an array of numbers
let dataset = inputData.split(separator: "\n").compactMap { Int($0) }

// Define a function to calculate the mean
func calculateMean(dataset: [Int]) -> Double {
    let sum = dataset.reduce(0, +)
    return Double(sum) / Double(dataset.count)
}

// Define a function to calculate the median
func calculateMedian(dataset: [Int]) -> Double {
    let sortedDataset = dataset.sorted()
    let middleIndex = dataset.count / 2
    if dataset.count % 2 == 0 {
        return Double(sortedDataset[middleIndex] + sortedDataset[middleIndex - 1]) / 2
    } else {
        return Double(sortedDataset[middleIndex])
    }
}

// Define a function to calculate the mode
func calculateMode(_ numsUnsorted: [Int]) -> [Int] {
    let nums = numsUnsorted.sorted()
    var maxNumRep = 0
    var numRep = -1
    var timesRep = 0
    // create a mode list
    var mode = [Int]()
    // for loop to see if num repeats
    for counter in 0..<nums.count {
        if counter == nums.count - 1 {
            if nums[counter] == nums[counter - 1] {
                numRep = nums[counter]
                if timesRep > maxNumRep {
                    mode.removeAll()
                    mode.append(numRep)
                    maxNumRep = timesRep
                } else if timesRep == maxNumRep {
                    mode.append(numRep)
                }
                timesRep = 0
            }
        } else {
            if nums[counter] == nums[counter + 1] {
                numRep = nums[counter]
                timesRep += 1
            } else {
                if timesRep > maxNumRep {
                    mode.removeAll()
                    mode.append(numRep)
                    maxNumRep = timesRep
                } else if timesRep == maxNumRep {
                    mode.append(numRep)
                }
                timesRep = 0
            }
        }
    }
    return mode

}

// Call the functions and print the results
let mean = calculateMean(dataset: dataset)
let median = calculateMedian(dataset: dataset)
let mode = calculateMode(dataset)

print("Mean: \(mean)")
print("Median: \(median)")
print("Mode: \(mode)")
