# haxe-permutation

A simple libary tha provides a single `Permuter` class to generate all permutations for a provided array (Starting with the original).

Nothing target-specific has been used, so in theory, every haxe target should be supported. It is specifically tested in `php` (7 & 8), `neko`, `python` & `javascript`

> :warning: Any given array of length n will have n! permutations. As a result, looping through all permutations will get *very* heavy for all but the shortest arrays (e.g. 6! = 720, 7! = 5040, 8! = 40320, 10! = 3628800 etc.), so think very carefully about looping over all permutations without a break condition.

## Usage

```haxe
import permutation.Permuter;
var example_array = [1,2,3];
var permuter = new Permuter(example_array);
for (permutation in permuter) {
    trace(permutation);
}
```

Outputs:
```
Example.hx:5: [1,2,3]
Example.hx:5: [2,1,3]
Example.hx:5: [3,1,2]
Example.hx:5: [1,3,2]
Example.hx:5: [2,3,1]
Example.hx:5: [3,2,1]
```

Duplicate entries are not considered, so:
```haxe	
var example_array = [1,1,2];
var permuter = new permutation.Permuter(example_array);
for(permutation in permuter) {
    trace(permutation);
}
```
Will result in:
```
Example.hx:5: [1,1,2]
Example.hx:5: [1,1,2]
Example.hx:5: [2,1,1]
Example.hx:5: [1,2,1]
Example.hx:5: [1,2,1]
Example.hx:5: [2,1,1]
```