primes = [1, 2, 3, 5, 7]

output = for i <- primes, j <- [:a, :b] do
          {j, i}
        end

IO.inspect output
