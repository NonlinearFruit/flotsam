; https://projecteuler.net/problem=1
(ns euler_01_spec
  (:require [speclj.core :refer :all]))

(defn sum-multiples-less-than [n]
  (reduce + (filter #(or
                       (= 0 (mod % 3))
                       (= 0 (mod % 5)))
                    (range n))))

(describe "Problem 1: Multiples of 3 or 5"
          (it "works in test cases"
              (should= 3 (sum-multiples-less-than 4))
              (should= 8 (sum-multiples-less-than 6))
              (should= 14 (sum-multiples-less-than 7))
              (should= 23 (sum-multiples-less-than 10)))
          (it "solves the problem"
              (should= 233168 (sum-multiples-less-than 1000))))
