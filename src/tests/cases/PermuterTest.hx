package tests.cases;

import utest.Assert;
import permutation.Permuter;
import utest.Test;

using permutation.Util;

@:depends(tests.cases.UtilTest)
class PermuterTest extends Test {
    /**
        Checks that for a list on length `n`, there
        are returned `n!` permutations.
    **/
    function specNumberOfPermutations() {
        var testArray = [0];
        var permuter = new Permuter(testArray);
        var allPermutations = [for (p in permuter) p];
        allPermutations.length == 1.factorial();
        permuter.length == allPermutations.length;

        var testArray = [1];
        var permuter = new Permuter(testArray);
        var allPermutations = [for (p in permuter) p];
        allPermutations.length == 1.factorial();
        permuter.length == allPermutations.length;

        var testArray = [1, 2, 3];
        var permuter = new Permuter(testArray);
        var allPermutations = [for (p in permuter) p];
        allPermutations.length == 3.factorial();
        permuter.length == allPermutations.length;

        var testArray = [1, 2, 3, 4];
        var permuter = new Permuter(testArray);
        var allPermutations = [for (p in permuter) p];
        allPermutations.length == 4.factorial();
        permuter.length == allPermutations.length;

        var testArray = ['a', 'b', 'c', 'd'];
        var permuter = new Permuter(testArray);
        var allPermutations = [for (p in permuter) p];
        allPermutations.length == 4.factorial();
        permuter.length == allPermutations.length;
    }

    /**
        Assuming the full number of permutations (in previous test), 
        if there are no repetitions, all cases *must* therefore be covered.

        Examples in the tests all use *unique* array elements, and permutations will be considered distinct, 
        based on original position, even with repeated elements. (i.e. `[1, 1, 1]` will still be considered to have 6 permutations, all `[1, 1, 1]`)

        TODO: Add (configurable) handling for repeated elements.
    **/
    @:depends(specNumberOfPermutations)
    function specNoRepetitions() {
        var testArray = [1, 2, 3, 4, 5];
        var permuter = new Permuter(testArray);
        var allPermutations = [for (p in permuter) p];
        var allPermutationsAsStrings = [for (p in allPermutations) p.toString()];

        while (allPermutationsAsStrings.length > 0) {
            var permutation = allPermutationsAsStrings.pop();
            // Pop removes a single element. There should not be another matching element.
            Assert.notContains(permutation, allPermutationsAsStrings);
        }

        var testArray = [1, 2];
        var permuter = new Permuter(testArray);
        var allPermutations = [for (p in permuter) p];
        var allPermutationsAsStrings = [for (p in allPermutations) p.toString()];

        while (allPermutationsAsStrings.length > 0) {
            var permutation = allPermutationsAsStrings.pop();
            Assert.notContains(permutation, allPermutationsAsStrings);
        }
    }
}