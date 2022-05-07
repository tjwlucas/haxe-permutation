package permutation;

using permutation.Util;

/**
    Iterable class returning successive permutations of a provided array, covering every possible permutation.
    Uses Heap's algorithm to generate the permutations.

    WARNING:
    Any given array of length n will have n! permutations. As a result, looping through all permutations will
    get *very* heavy for all but the shortest arrays (e.g. 6! = 720, 7! = 5040, 8! = 40320, 10! = 3628800 etc.).
**/
class Permuter<K> {
    var original : Array<K>;
    var itemLength : Int;
    var numberOfPermutations : Int;

    var currentItemIndex : Int = 0;
    var nextItem : Array<K>;

    var c : Array<Int> = [];

    public function new(array:Array<K>) {
        original = array;
        nextItem = original.copy();
        itemLength = array.length;
        numberOfPermutations = itemLength.factorial();

        for (i in 0...(itemLength + 1)) {
            c[i] = 0;
        }
    }

    /**
        The number of possible permutations covered by this permuter
    **/
    public var length(get, never) : Int;
    function get_length() : Int {
        return numberOfPermutations;
    }

    /**
        Returns true if there is next permutation.
    **/
    public function hasNext() : Bool {
        return currentItemIndex < numberOfPermutations;
    }

    var i : Int = 0;

    /**
        Returns the next permutation
    **/
    public function next() : Array<K> {
        var currentItem = nextItem.copy();

        if (c[i] < i) {
            if (i % 2 == 0) {
                nextItem.swap(0, i);
            } else {
                nextItem.swap(c[i], i);
            }
            c[i]++;
            i = 0;
            currentItemIndex++;
        } else {
            c[i] = 0;
            i++;
            next();
        }

        return currentItem;
    }
}