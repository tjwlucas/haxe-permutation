package permutations;

function swap<T>(arr: Array<T>, a:Int, b:Int) {   
    // TODO: Use more efficient swapping mechanism
    // e.g. Bitwise swap for relevant types
    var item_a = arr[a];
    arr[a] = arr[b];
    arr[b] = item_a;
    return arr;
}

function factorial(n:Int) {
    var value = 1;
    for(i in 0...n) {
        value *= i+1;
    }
    return value;
}