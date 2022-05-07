package permutation;

/**
    Swaps two elements on an array by index.
    Mutates provided array, as well as returning it.
**/
function swap<T>(arr: Array<T>, a:Int, b:Int) {
    // TODO: Use more efficient swapping mechanism
    // e.g. Bitwise swap for relevant types
    var item_a = arr[a];
    arr[a] = arr[b];
    arr[b] = item_a;
    return arr;
}

/**
    Returns the factorial (!) of provided integer.
    e.g.
    ```
    4! = 4 * 3 * 2 * 1
    ```
**/
@:ignoreCoverage
macro function factorial(n:ExprOf<Int>) : ExprOf<Int> {
    switch (n.expr) {
        case EConst(CInt(v)): {
                var value = factorialRuntime(Std.parseInt(v));
                return macro $v{ value };
            }
        default:
            return macro @:privateAccess permutation.Util.factorialRuntime($n);
    }
}

private function factorialRuntime(n:Int) {
    var value = 1;
    for (i in 0...n) {
        value *= i + 1;
    }
    return value;
}