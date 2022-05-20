# Eight Wonders

https://eight-wonders.fly.dev/

**Eight Wonders** is a flight path optimizer which calculates the shortest path connecting up to 8 airports, anywhere in the world.

Have you ever dreamt about flying around the world to visit your bucket list destinations? We'll help you create an itinerary that minimizes time spent on the plane.
You can start an itinerary from scratch, or customize one of our favorites such as *Michelin Star Dining* or *Festivals!*. All you have to do is select 8 airport codes, and we'll automatically sort the airports in the optimal flight order. You can also make notes on the attractions you want to see at each place. Bon voyage! :airplane:

![Eight Wonders Home Page](public/images/eight_wonders_homepage.png)


## Features

### :earth_americas: Customize an Itinerary

![Eight Wonders - Favorite Itineraries](public/images/eight_wonders_favorites.png)

### :pencil2: Edit Your Itinerary

![Eight Wonders - Create Itinerary](public/images/eight_wonders_itinerary.png)

### :iphone: Take a Screenshot and Share

![Eight Wonders - Share](public/images/eight_wonders_sharing.png)

## How it Works

Eight Wonders is an optional project built halfway through the [Launch School](https://launchschool.com/) Core Curriculum, Ruby track. The material covered by this point includes fundamental Ruby syntax, OOP, closures, regex, testing, application packaging, deployment, networking, databases, HTML & CSS, and problem solving. I built this project to use what I've learned to make something fun.

### :gem: Technologies Used

* Ruby application written with the Rack-based Sinatra framework
* ERB view templates
* Puma web server
* PostgreSQL database
* Tests written in MiniTest
* Vanilla HTML, CSS, and JS
* [autoComplete.js](https://tarekraafat.github.io/autoComplete.js/#/) search
* ID generation with [Nano ID](https://github.com/ai/nanoid)
* Deployed on [fly.io](https://fly.io/)

### :1234: Sorting Methodology

This is an example of the Traveling Salesman Problem (TSP), which asks:

>"Given a list of cities and the distances between each pair of cities, what is the shortest possible route that visits each city exactly once and returns to the origin city?"

The solution involves finding the lowest-cost Hamiltonian cycle for an undirected symmetric graph. Of three algorithms considered, the dynamic programming solution was selected due to a desire for an exact solution. Since `n ≤ 8`, the computation speed was acceptable.

| Algorithm | Description | Accuracy | Time Complexity |
| --- | --- | --- | --- |
| [Sort by longitude](https://github.com/jasonherngwang/eight-wonders/blob/main/lib/shortest_path_algos.rb#L136) | Normalize airport longitudes to positive numbers, and sort in ascending order. Results in an eastward round-the-world trip. | Approximate | Fast: $O(n*log(n))$ for Quicksort used by `#sort_by` |
| [Naive approach](https://github.com/jasonherngwang/eight-wonders/blob/main/lib/shortest_path_algos.rb#L180) | Compute travel distances for all possible routes, and select the shortest. | Exact | Slow: $O(n!)$ |
| [Dynamic programming (Held-Karp)](https://github.com/jasonherngwang/eight-wonders/blob/main/lib/shortest_path_algos.rb#L260) | Iteratively find the shortest travel path from the starting location to cities that are `1` through `n-1` nodes away, storing results in a table for use in subsequent iterations. Add the "return home" segment to all paths in the final table, and select the shortest. Code adapted from [rameziophobia](https://github.com/rameziophobia/Travelling_Salesman_Optimization/blob/master/dynamic_programming.py). | Exact | Faster than naive: $O(2^n*n^2)$ |

Distance between locations around the world are calculated using the [haversine formula](https://community.esri.com/t5/coordinate-reference-systems-blog/distance-on-a-sphere-the-haversine-formula/ba-p/902128).