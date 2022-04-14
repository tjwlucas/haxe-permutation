package tests.cases;
import utest.Assert;
import utest.Test;
using permutations.Util;

class UtilTest extends Test {
    function specFactorialRuntime() {
        @:privateAccess 1.factorialRuntime() == 1;
        @:privateAccess 2.factorialRuntime() == 2;
        @:privateAccess 3.factorialRuntime() == 6;
        @:privateAccess 4.factorialRuntime() == 24;
        @:privateAccess 5.factorialRuntime() == 120;

        var testInt = 3;
        testInt.factorial() == 6;
    }

    @:depends(specFactorialRuntime)
    function specFactorialMacro() {
        1.factorial() == @:privateAccess 1.factorialRuntime();
        2.factorial() == @:privateAccess 2.factorialRuntime();
        3.factorial() == @:privateAccess 3.factorialRuntime();
        4.factorial() == @:privateAccess 4.factorialRuntime();
        5.factorial() == @:privateAccess 5.factorialRuntime();

        var testInt = 3;
        testInt.factorial() == @:privateAccess 3.factorialRuntime();
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