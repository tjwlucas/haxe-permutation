package permutations;

using permutations.Util;

/**
    Iterable class returning successive permutations of a provided array, covering every possible permutation.
    Uses Heap's algorithm to generate the permutations.

    WARNING:
    As may be obvious, any given 
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

        for(i in 0...itemLength+1) {
            c[i] = 0;
        }
    }

    public function hasNext() {
        return currentItemIndex < numberOfPermutations;
    }

    var i = 0;
    public function next() {
        var currentItem = nextItem.copy();

        if(c[i] < i) {
            if(i % 2 == 0) {
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