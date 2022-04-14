package tests.cases;

import utest.Assert;
import permutations.Permuter;
import utest.Test;

using permutations.Util;

class BasicTest extends Test {
    function specFactorial() {
        1.factorial() == 1;
        2.factorial() == 2;
        3.factorial() == 6;
        4.factorial() == 24;
        5.factorial() == 120;
    }

    function specNumberOfPermutations() {
        var testArray = [0];
        var permuter = new Permuter(testArray);
        var allPermutations = [for(p in permuter) p];
        allPermutations.length == 1;

        var testArray = [1];
        var permuter = new Permuter(testArray);
        var allPermutations = [for(p in permuter) p];
        allPermutations.length == 1;

        var testArray = [1,2,3];
        var permuter = new Permuter(testArray);
        var allPermutations = [for(p in permuter) p];
        allPermutations.length == 6;

        var testArray = [1,2,3,4];
        var permuter = new Permuter(testArray);
        var allPermutations = [for(p in permuter) p];
        allPermutations.length == 24;

        var testArray = ['a', 'b', 'c', 'd'];
        var permuter = new Permuter(testArray);
        var allPermutations = [for(p in permuter) p];
        allPermutations.length == 24;
    }

    function specNoRepetitions() {
        var testArray = [1,2,3,4,5];
        var permuter = new Permuter(testArray);
        var allPermutations = [for(p in permuter) p];
        var allPermutationsAsStrings = [for(p in allPermutations) p.toString()];

        while(allPermutationsAsStrings.length > 0) {
            var permutation = allPermutationsAsStrings.pop();
            // Pop removes a single element. There should not be another matching element.
            Assert.notContains(permutation, allPermutationsAsStrings);
        }

        var testArray = [1,2];
        var permuter = new Permuter(testArray);
        var allPermutations = [for(p in permuter) p];
        var allPermutationsAsStrings = [for(p in allPermutations) p.toString()];

        while(allPermutationsAsStrings.length > 0) {
            var permutation = allPermutationsAsStrings.pop();
            Assert.notContains(permutation, allPermutationsAsStrings);
        }
    }

    function specSwap() {
        var test1 = [1,2,3,4,5];
        test1.swap(0,3);
        Assert.same([4,2,3,1,5], test1);
        Assert.same([2,4,3,1,5], test1.swap(0,1));

        var test2 = ['a', 'b', 'c', 'd', 'e'];
        test2.swap(0,3);
        Assert.same(['d', 'b', 'c', 'a', 'e'], test2);
    }
}