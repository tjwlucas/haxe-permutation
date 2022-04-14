package permutations;

using permutations.ArrayTools;

class Permuter<K> {
    var original : Array<K>;
    var itemLength : Int;
    var numberOfPermutations : Int;

    var currentItemIndex : Int = 0;
    var currentItem : Array<K>;

    var c : Array<Int> = [];

    public function new(array:Array<K>) {
        original = array;
        currentItem = original;
        itemLength = array.length;
        numberOfPermutations = factorial(itemLength);

        for(i in 0...itemLength) {
            c[i] = 0;
        }
    }

    static function factorial(n:Int) {
        var value = 1;
        for(i in 0...n) {
            value *= i+1;
        }
        return value;
    }



    public function hasNext() {
        return currentItemIndex < numberOfPermutations;
    }

    var i = 0;
    public function next() {
        var nextItem = currentItem.copy();

        if(c[i] < i) {
            if(i % 2 == 0) {
                currentItem.swap(0, i);
            } else {
                currentItem.swap(c[i], i);
            }
            c[i]++;
            i = 0;
            currentItemIndex++;
        } else {
            c[i] = 0;
            i++;
            next();
        }        

        return nextItem;
    }
}