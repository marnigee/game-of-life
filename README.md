# Method memoization module code exercise

This is a code exercise. Here is the assignment:

> Assume you're working with a codebase that has a bunch of interactor-like classes.
> Those classes have an API much like a Proc.
>
> ```
> module Interactors
> class ImportantThing < Base
> def initialize(*args)
> # .... some setup
> end
>
> def call(*args)
> # .... some work
> end
> end
> end
> ```
>
> In this magical realm our `call` methods are pure functions. Design a library
> or patch that will allow us to memoize calls to `call`
>
> Please submit a code sample with your solution.
> Will be looking at the API of the solution most.
> Do you use inclusion, inheritance, wrapping, or something we haven't thought of?
> Do you use metaprogramming, and if so, how much?
>
> You don't need to worry about storage or persistence feel free to just use memory
> backed variables.
>
> Feel free to explain as much about your implementation choices as you would like.

I did some research and looked at the Ruby memoizers out there to see what I could learn.

I favored composition over inheritance so that the memoizer functionality would be more modular and wouldn't "automagically" apply to all Base classes but rather to any class as long as it included Memoizer (here's my lunch and learn presentation of Sandi Metz's POODNYC 2016 course that speaks to the "composition over inheritance" approach: http://bit.ly/poodnyc-marnigee).

I wanted my solution to cover any method (not just "call"), so I used some metaprogramming. At first I tried using method aliasing which worked, but ultimately was a less elegant solution than the one I settled on since it had confusing method names that would be difficult to debug. I used prepend so that when the existing call method in ImportantThing (or any object that includes Memoizer) gets called, Memoizer's call method would get called first, and then calling super within the Memoizer method would call ImportantThing's original call method.

I used a TDD approach. Please note: These specs do not provide full coverage. If I was going to spend more time on this, next steps would include fixing the test failures that would occur if the methods in ImportantThing return values other than strings,  slimming down the specs and unit test the Memoizer on its own, and ensuring that the test provide  full coverage.

## Tests

To test the module, run the following command:

```
$ rspec spec/memoizer_spec.rb
```

This should be the output:

```
......

Finished in 0.00581 seconds (files took 0.15588 seconds to load)

6 examples, 0 failures
```
