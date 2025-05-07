; https://projecteuler.net/problem=3
(ns euler_03_spec
  (:require [speclj.core :refer :all]))

(defn largest-possible-factor [n]
  (let [root (Math/sqrt n)]
    (if (zero? (mod n root))
      (inc root)
      root)))

(defn smallest-prime-factor [n]
  (some #(when (zero? (mod n %)) %)
        (range 2 (largest-possible-factor n))))

(defn largest-prime-factor [n]
  (let [smaller_prime (smallest-prime-factor n)]
    (cond (nil? smaller_prime) n
          :else (recur (quot n smaller_prime)))))

(describe "Problem 3: Largest Prime Factor"
          (it "works in test cases"
              (should= 29 (largest-prime-factor 13195))
              (should= 5 (largest-prime-factor 25))
              (should= 3 (largest-prime-factor 12))
              (should= 5 (largest-prime-factor 10))
              (should= 3 (largest-prime-factor 9))
              (should= 3 (largest-prime-factor 6))
              (should= 5 (largest-prime-factor 5))
              (should= 2 (largest-prime-factor 4))
              (should= 3 (largest-prime-factor 3))
              (should= 2 (largest-prime-factor 2)))
          (it "solves the problem"
              (should= 6857 (largest-prime-factor 600851475143))))
