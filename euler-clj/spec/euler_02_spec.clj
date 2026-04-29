; https://projecteuler.net/problem=2
(ns euler_02_spec
  (:require [speclj.core :refer :all]))

(defn fibonacci-sequence []
  (map first
       (iterate (fn [[a b]] [b (+ a b)])
                [1 2])))

(defn sum-even-fibonaccis-less-than [n]
    (reduce + (filter even?
                      (take-while #(< % n)
                                  (fibonacci-sequence)))))

(describe "Problem 2: Even Fibonacci Numbers"
          (it "works in test cases"
              (should= 44 (sum-even-fibonaccis-less-than 35))
              (should= 10 (sum-even-fibonaccis-less-than 9))
              (should= 2 (sum-even-fibonaccis-less-than 4)))
          (it "solves the problem"
              (should= 4613732 (sum-even-fibonaccis-less-than 4000000))))
