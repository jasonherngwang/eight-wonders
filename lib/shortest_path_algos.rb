require "set"

# Test Data
coords = [
  # Correct order
  # [33.942501,   -118.407997],    # LAX
  # [34.78549957,  135.4380035],   # ITM
  # [22.308901,    113.915001],    # HKG
  # [55.61790085,   12.65600014],  # CPH
  # [51.4706,       -0.461941],    # LHR
  # [49.012798,      2.55],        # CDG
  # [43.356499,     -1.79061],     # EAS
  # [40.639801,    -73.7789]       # JFK
  # Incorrect order
  [33.942501,   -118.407997],   # LAX
  [40.639801,    -73.7789],     # JFK
  [55.61790085,   12.65600014], # CPH
  [49.012798,      2.55],       # CDG
  [22.308901,    113.915001],   # HKG
  [43.356499,     -1.79061],    # EAS
  [51.4706,       -0.461941],   # LHR
  [34.78549957,  135.4380035]   # ITM
]

=begin
Find Shortest Flight Path Connecting Eight Airports, and Returning to the First
AKA the Traveling Salesman Problem (TSP)
--------------------------------------------------------------------------------

Launch School PEDAC Process
https://medium.com/launch-school/solving-coding-problems-with-pedac-29141331f93f

Problem
------------------------------------------
You are given the latitude/longitude coordinates of 8 airports. The first one 
is the starting airport. Find the shortest flight path that:
- Starts from the starting airport.
- Visits the other 7 airports, without revisiting any.
- Ends by flying back to the start.

Input
------------------------------------------
Array of coordinate pairs (latitude, longitude), each representing an airport 
location.

Output
------------------------------------------
Hash of index mappings, with Integers as keys and values. This will be used to 
sort some other collection containing the airport data.
- Format: { original_idx => new_idx, ... }
- Since this is a round-the-world flight, forward and reverse directions are 
  both acceptable answers.

Clarification of Problem Domain
------------------------------------------
Longitude represents the position (in degrees) east or west from the 
Prime Meridian, a vertical line running from the North Pole to South Pole, 
passing through Greenwich in England. Starting at the Prime Meridian, longitude 
values go from 0 to +180 traveling eastward, and 0 to -180 traveling westward 
around the hemisphere. The Antimeridian is the +/-180 degree longitude line.
The Prime Meridian and Antimeridian together divide the earth into the Western
and Eastern Hemispheres

Rules/Requirements
------------------------------------------
- It's not necessary to fly in a circle around the globe. The primary objective
  is to minimize distance traveled.
- There will always be 8 airports.
- The distance from the last airport #8 back to the starting airport must be 
  considered in the calculation.

Examples, Test Cases
------------------------------------------
Input: Array of coordinates that IS NOT ordered in the shortest path
[
  [33.942501,   -118.407997],   # LAX
  [40.639801,    -73.7789],     # JFK
  [55.61790085,   12.65600014], # CPH
  [49.012798,      2.55],       # CDG
  [22.308901,    113.915001],   # HKG
  [43.356499,     -1.79061],    # EAS
  [51.4706,       -0.461941],   # LHR
  [34.78549957,  135.4380035]   # ITM
]

This is the shortest path:
[
  [33.942501,   -118.407997],   # LAX
  [34.78549957,  135.4380035],  # ITM
  [22.308901,    113.915001],   # HKG
  [55.61790085,   12.65600014], # CPH
  [51.4706,       -0.461941],   # LHR
  [49.012798,      2.55],       # CDG
  [43.356499,     -1.79061],    # EAS
  [40.639801,    -73.7789]      # JFK
]

Output should be this Hash, which maps original to new index.
- For example, JFK was in index 1, but is mapped to index 7.
- The first index always maps to 0, since it is the starting airport.
- This results in a westward round-the-world flight.
- We first fly across the Pacific Ocean from Los Angeles to Osaka, before
  continuing westward around the world.

{
  0 => 0,
  1 => 7,
  2 => 3,
  3 => 5,
  4 => 2,
  5 => 6,
  6 => 4,
  7 => 1,
}

The reverse, an eastward round-the-world flight, is also acceptable.
- In this example, we first fly eastward trans-continent from Los Angeles to 
  New York, before continuing around the world.

{
  0 => 0,
  1 => 1,
  2 => 5,
  3 => 3,
  4 => 6,
  5 => 2,
  6 => 4,
  7 => 7,
}

Data Structure
------------------------------------------
Arrays will be used to store and order data.
Hashes will be used for lookup tables and structuring data for the output.


Approach 1: Sort Longitudes
------------------------------------------
Note: This algorithm is not an exact solution to the problem, but it is faster.

Since longitude represents the east/west position, if we sort the coordinates by
the longitude, it yields a path that takes us around the globe in one direction.

The input longitude values are in the range [0, 180] or [0, -180], so we cannot
directly sort them until they are normalized.

Algorithm
------------------------------------------
- Subtract the longitude of the starting airport from all longitude values,
  including itself. This sets the starting airport to 0 degrees.
- Add 360 degrees to all negative longitude values. This will make all values
  positive and fall in the range [0, 360]. Now the starting airport is 0 deg,
  and all other airports are greater than it.
- Sort in ascending order by this normalized longitude.
- Store and return the initial and sorted indices in a Hash. Create and return 
  this index mapping Hash, as required by the problem.
=end

def sort_longitude(coords)
  # Extract longitudes out of coordinate lat/lon pairs.
  longitudes = coords.map { |c| c[1] }
  # Subtract starting airport's longitude from all.
  shifted_lon = longitudes.map { |lon| lon - longitudes.first }
  # Add 360 degrees to all negative longitudes.
  normalized_lon = shifted_lon.map { |lon| lon < 0 ? lon + 360 : lon }
  # Pair original index with normalized longitude, 
  # each as a 2-element Array: [idx, lon].
  initial_idx = (0...longitudes.size).zip(normalized_lon)
  # Freeze first pair, and sort remaining pairs by normalized longitude.
  sorted_idx = [initial_idx.first] + 
               initial_idx[1..-1].sort_by do |(_, normalized_lon)|
                 normalized_lon
               end
  # Pair the sorted indices with an new index that will be used for sorting.
  index_mapping = sorted_idx.map.with_index do |(current_idx, normalized_lon), new_idx|
    [current_idx, new_idx]
  end.to_h
end

=begin
Approach 2: Naive Implementation for Traveling Salesman Problem (TSP)
------------------------------------------
Fix in place the starting airport, and find all possible permutations for the
remaining 7 airports. Calculate the total distance for each flight path, 
including the 2 segments starting from and returning to the starting airport.

This yields an exact solution to the problem, but is slow. The time complexity
is O(n!), or O((n-1)!) since we don't consider the starting airport.
(8-1)! = 5,040

Algorithm
------------------------------------------
- Find all possible permutations of flying among the remaining 7 airports.
- Add the starting airport at the beginning and at the end of each path.
- Calculate the total flight distance for each permutation.
  - Use helper method for haversine distance.
- Select the path with the smallest distance.
- Create and return an index mapping Hash, as required by the problem.

Helper Method: Calculate the haversine (great-circle) distance.
=end

# Haversine Formula: Returns distance between 2 lat/lon pairs, in km or mi
# https://community.esri.com/t5/coordinate-reference-systems-blog/distance-on-a-sphere-the-haversine-formula/ba-p/902128
# Input: coords = [latitude, longitude]

def haversine_distance(coords1, coords2, units="km")
  earth_radius = case units
                 when "km" then 6_357
                 when "mi" then 3_950
                 end

  # Convert degrees to radians
  lat1, lon1 = coords1.map { |x| x * Math::PI / 180 }
  lat2, lon2 = coords2.map { |x| x * Math::PI / 180 }

  a = Math.sin((lat2 - lat1) / 2) ** 2 +
      Math.cos(lat1) *
      Math.cos(lat2) *
      Math.sin((lon2 - lon1) / 2) ** 2
  c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a))
  d = earth_radius * c
end

def sort_tsp_naive(coords)
  # Pair initial index with coordinates: [0, [lat, lon]]
  coords = (0...coords.size).zip(coords)
  start = coords.first
  remaining = coords[1..-1]

  all_paths = remaining.permutation(remaining.size).map do |path|
    # Add starting airport to beginning and end
    path.unshift(start)
    path.push(start)
    total_distance = path.each_cons(2).map do |elem1, elem2|
      haversine_distance(
        [elem1[1][0], elem1[1][1]],
        [elem2[1][0], elem2[1][1]],
        "mi"
      )
    end.sum
    [
      path,
      total_distance
    ]
  end
  shortest_path = all_paths.min_by { |path| path[1] }
  shortest_distance = shortest_path[1]
  # Remove last element (starting airport) before constructing Hash.
  shortest_path_indices = shortest_path[0].map { |p| p[0] }[0...-1]
  index_mapping = shortest_path_indices.zip([*0...shortest_path_indices.size]).to_h
end


=begin
Approach 3: Solve TSP using Held-Karp Dynamic Programming Algorithm
AKA Find the lowest-cost Hamiltonian cycle for an undirected symmetric graph.
------------------------------------------
This solution is my Ruby adaptation of this iterative Python implementation:
https://github.com/rameziophobia/Travelling_Salesman_Optimization/blob/master/dynamic_programming.py

This yields an exact solution to the problem, and is faster than the naive
implementation for large n. The time complexity is O(2^n * n^2).

The Traveling Salesman Problem
------------------------------------------
From Wikipedia:
"Given a list of cities and the distances between each pair of cities, what is 
the shortest possible route that visits each city exactly once and returns to 
the origin city?"

Dynamic Programming
------------------------------------------
From https://www.educative.io/courses/grokking-dynamic-programming-patterns-for-coding-interviews/m2G1pAq0OO0
Dynamic programming is the use of breaking down a problem into simpler 
sub-problems. The optimal solution to the problem depends on the optimal
solution to its sub-problems. A problem has overlapping sub-problems if solving
it requires solving the same sub-problem multiple times.
- This implementation uses an iterative bottom-up approach with tabulation,
  which solves the sub-problems first, and stores the results in a table. At the
  end, we use the table to find the solution to the top-level problem.
- This is in contrast to a top-down approach with memoization, which recursively
  finds solutions to sub-problems and caches the results so they can be used 
  later on in the problem.

Requirements and Clarifications
------------------------------------------
- "City" = "Airport"
- Cities are represented as integers 0 through 7.
- Distances are symmetric, meaning that traveling from Los Angeles to Paris is
  the same distance as traveling from Paris to Los Angeles. We ignore the
  effects of wind, earth rotation, etc.
- We are finding a cycle in a graph, meaning that it doesn't matter where we
  start. Since distances are symmetric, it doesn't matter which direction we
  travel in.


High-level Description of Algorithm
------------------------------------------
The algorithm calculates the minimum distance for the route which:
1. Starts at city 0
2. Passes through 0 or more cities, denoted as the Set S.
3. Ends at city `e`, or `end_city` in this implementation.

0 -> { 0 or more cities } -> end_city

This minimum distance function is denoted g(S, e).

Null Set: S = {}
----------------------
We start with the null set S = {}, meaning that only traveling 1 city away.
There are 7 possible paths:
0 -> {} -> 1 which is the same as 0 -> 1
0 -> {} -> 2
...
0 -> {} -> 7
We calculate the distance between these city pairs and store the result in the
DP table.

Set Size of 1: S = {1}, {2}, ..., or {7}
----------------------
There are 7 * 6 = 42 possible paths:
0 -> {1} -> 2
0 -> {1} -> 3
0 -> {1} -> 4
0 -> {1} -> 5
0 -> {1} -> 6
0 -> {1} -> 7
...
0 -> {7} -> 5
0 -> {7} -> 6

Set Size of 2: S = {1, 2}, {1, 3}, {7, 6}, ...
----------------------
For the null set and set of size 1, there has always been only 1 possible path.
Starting with a set size of 2, now there are multiple permutations that can
be created from the set:
0 -> {1, 2} -> 3 could be: (0 -> 1 -> 2 -> 3) or (0 -> 2 -> 1 -> 3)
0 -> {1, 2} -> 4
...
0 -> {7, 6} -> 4
0 -> {7, 6} -> 5

For each permutation, we find the distances of the paths and store the smaller
one in our DP table. For example, we might find that:
0 -> 1 -> 2 -> 3 has a distance of 99 (discard this result)
0 -> 2 -> 1 -> 3 has a distance of 42 (choose this shorter one)

So in our DP table we record the following:
{ [ Set[cities],     end_city ]: [ distance,       [path] ] }
{ [ Set[0, 1, 2, 3],        3 ]: [       42, [0, 2, 1, 3] ] }

We can say:
"If I start from 0 and need to pass through 1 and 2, and end my trip in 3, 
I know that the minimum distance is 42, and the exact path to get there is
0 -> 2 -> 1 -> 3."

Set Size of 3
----------------------
Starting from a set size of 3, the number of permutations rapidly increases.
0 -> {1, 2, 3} -> 4 has 6 permutations:
  0 -> 2 -> 3 -> 1 -> 4
  0 -> 3 -> 2 -> 1 -> 4
  0 -> 1 -> 3 -> 2 -> 4
  0 -> 3 -> 1 -> 2 -> 4
  0 -> 1 -> 2 -> 3 -> 4 (pay attention to this)
  0 -> 2 -> 1 -> 3 -> 4 (pay attention to this)

It is not necessary to perform a brute-force search through all these
permutations to find the shortest path, as we did for the naive implementation.
We take advantage of the fact that we have already solved the sub-problem for
sets of smaller sizes.

Previously, we found that the shortest path to get to from 0 to 3, passing
through 1 and 2, was: 0 -> 2 -> 1 -> 3. Examining the 6 permutations above, the
last two simply add city 4 to the result of the sub-problem we already solved:
0 -> 1 -> 2 -> 3 (this is longer)  -> 4
0 -> 2 -> 1 -> 3 (this is shorter) -> 4

This reduces the number of computations we need to perform, since we no longer
need to consider the path 0 -> 1 -> 2 -> 3 -> 4.

Greater Set Sizes
----------------------
The logic we have discussed extends to greater set sizes, increasing by 1 at a
time. For this problem, we ultimately end up 7 solutions:
0 -> { the other 6 cities, in a specific order } -> 1
0 -> { the other 6 cities, in a specific order } -> 2
0 -> { the other 6 cities, in a specific order } -> 3
0 -> { the other 6 cities, in a specific order } -> 4
0 -> { the other 6 cities, in a specific order } -> 5
0 -> { the other 6 cities, in a specific order } -> 6
0 -> { the other 6 cities, in a specific order } -> 7

Our DP table will be filled with entries such as:
{ [ Set[0, 1, 2, 3, 4, 5, 6, 7], 4 ]: [ 18,372, [0, 5, 3, 7, 6, 1, 2, 3] ] }

So we can say:
"If I start at city 0 and need to visit all the remaining cities and end at 4,
the shortest possible path is (0, 5, 3, 7, 6, 1, 2, 3) and has length 18,372."

The Last Step: Returning Home
----------------------
The TSP requires that the trip return back to city 0. To do this, we add the
distance required to travel home:
0 -> { the other 6 cities, in a specific order } -> 1 -> 0
0 -> { the other 6 cities, in a specific order } -> 2 -> 0
0 -> { the other 6 cities, in a specific order } -> 3 -> 0
0 -> { the other 6 cities, in a specific order } -> 4 -> 0
0 -> { the other 6 cities, in a specific order } -> 5 -> 0
0 -> { the other 6 cities, in a specific order } -> 6 -> 0
0 -> { the other 6 cities, in a specific order } -> 7 -> 0

The solution is the minimum travel distance out of these 7.
Example: 0 -> 5 -> 3 -> 7 -> 6 -> 1 -> 2 -> 4 -> 0


Algorithm
------------------------------------------
- Create an n x n distance matrix containing haversine distances between cities.
  - Use the helper method for calculating haversine distance.
- Initialize a Hash to serve as a dynamic programming table (DP table) to store 
  the result of the sub-problems we have solved. Examples of the key/value
  format are shown in the discussion.
- Starting with the null set, store the minimum distance and associated path in
  the DP table.

Iterate through Sets of size 1 up to n-1
- Create a new DP table which we will populate during this iteration. Each DP
  table will replace the previous one because it contains information for 
  longer paths, and supersedes the previous.
  - E.g. we do not need to keep the minimum path info for Set size 3, since it
    is only used for finding the minimum path for Set size 4, and then never
    used again.
- Find all combinations (sets) of cities that would fit in the current Set size.
  - E.g. if size = 2, this would yield {1, 2}, {5, 7}, and so forth.
  - Iterate through all these sets of cities.
    - Iterate through all cities in the set, treating each as the end city.
      - Lookup in the DP table the minimum paths for traveling from 0 to
        any city in the set, except the end city.
      - Add the distance for the final segment to arrive in the end city.
      - Take the shortest of all these paths, and store it in the new DP table.
- Replace the old DP table with the new one.
- Proceed to the next size of Set (1 size larger)

The DP table is now complete.
- Add to each path the distance to return back to city 0.
- Find the shortest of these paths.
- Create and return an index mapping Hash, as required by the problem.

Size of the DP Table for Each Set Size
------------------------------------------
Set Size    DP Table Size
       0                7
       1               42
       2              105
       3              140
       4              105
       5               42
       6                7
=end

def sort_tsp_dp(coords)
  # Create n x n distance matrix
  distance_matrix = coords.map do |c1|
    coords.map do |c2|
      haversine_distance(c1, c2, units="mi")
    end
  end

  # Initialize DP table to store minimum cost and associated travel path
  # for each possible Set and end vertex.
  dp_table = Hash.new

  # Null Set. Store min distances from 0 to adjacent vertices in DP table.
  # Key: [ Set[0, {vertices}, end_vertex], end_vertex ], Value: [min_distance, path]
  # Example - Key: [ Set[0, 5], 5 ], Value: [5241, [0, 5]]
  distance_matrix[0][1..-1].each_with_index do |dist, idx|
    dp_table[ [Set[0, idx + 1], idx + 1] ] = [dist, [0, idx + 1]]
  end

  # puts "DP Table for null set:"
  # p dp_table

  # Consider Sets of size 1 and greater.
  (2...coords.size).each do |m|
    # puts "-" * 80
    # puts "Set size: #{m - 1}"

    # New DP table will replace previous.
    new_dp_table = Hash.new
    
    # Find all possible Sets of size `m`.
    cities_sets = [*1...coords.size].combination(m).map do |combo|
      Set[*combo].union(Set[0])
    end
    # p cities_sets

    # Evalute each Set.
    cities_sets.each do |cities_set|
      # puts "Set being evaluted:"
      # p cities_set
      
      # Temporarily remove 0 from the Set.
      cities_set_without_zero = cities_set.difference(Set[0])

      # Iterate through the Set, choosing each vertex as the ending vertex.
      # For each end vertex, find the minimum path going from 0 through Set S, arriving at end vertex.
      cities_set_without_zero.each do |end_city|
        # Remove end vertex from Set.
        sets_without_end_vertex = cities_set.select do |city|
          city != 0 && city != end_city
        end
        # puts "Intermediate cities: #{sets_without_end_vertex}"
        
        # Lookup min paths from memo table, and create new entries for the new, longer paths.
        # Elements are in the form [distance, path_array]. Array comparison is performed element-by-element.
        # Same distance in multiple elements is OK.
        dp_value = sets_without_end_vertex.map do |city|
          # Construct lookup key
          lookup_key = [cities_set - Set[end_city], city]
          min_dist_zero_to_city = dp_table[lookup_key][0]
          new_dist_zero_to_city_to_end_city = min_dist_zero_to_city + distance_matrix[city][end_city]
          min_path_zero_to_city = dp_table[lookup_key][1]
          new_path_zero_to_city_to_end_city = min_path_zero_to_city + [end_city]
          
          # New distance and new travel path
          [new_dist_zero_to_city_to_end_city, new_path_zero_to_city_to_end_city]
        end.min

        # Store computed results for sub-problem, in DP table
        dp_key = [cities_set, end_city]
        new_dp_table[dp_key] = dp_value
        # puts "Storing in DP table. Key: #{dp_key}, Value: #{dp_value}"
        # puts "-" * 50
      end
    end
    
    # puts "Current DP table:"
    # p new_dp_table
    # puts "Length: #{new_dp_table.size}"
    dp_table = new_dp_table  
  end

  # puts "Completed DP table:"
  # p dp_table

  # For each minimum path, add an edge returning back to the start.
  # Then select the minimum path.
  shortest_path = dp_table.map do |(city_set, end_city), (distance, path)|
    [
      distance + distance_matrix[0][end_city], # Distance to return to start
      path + [0]
    ]
  end.min
  p "Shortest path: #{shortest_path[1]} (#{shortest_path[0]} miles)"

  shortest_path_indices = shortest_path[1][0...-1]
  
  index_mapping = shortest_path_indices.zip([*0...shortest_path_indices.size]).to_h
end


# Compare the Algorithms
def time_it
  before = Time.now
  yield
  after = Time.now
  puts "Completed in #{after - before} sec."
end


# p sort_longitude(coords2)
# p sort_tsp_naive(coords2)
# p sort_tsp_dp(coords2)
# time_it { sort_longitude(coords) } # => Completed in 1.1e-05 sec.
# time_it { sort_tsp_naive(coords) } # => Completed in 0.044559 sec.
# time_it { sort_tsp_dp(coords) }    # => Completed in 0.006426 sec.
