package tests;

import utest.Runner;

/**
	Base to run all tests
**/
class TestLoader {
    static function main() : Void {
        var runner = new Runner();
        new NoExitReport(runner);
        runner.addCases(tests.cases);
        runner.run();
    }

    static function __init__() : Void {
        #if php
		// PHP 8.1 compatibility workaround https://github.com/HaxeFoundation/haxe/issues/10502
            untyped if (version_compare(PHP_VERSION, "8.1.0", ">=")) error_reporting(error_reporting() & ~E_DEPRECATED);
        #end
    }
}

/**
	Custom Exit report for test runner
**/
class NoExitReport extends utest.ui.text.PrintReport {
    override function complete(result:utest.ui.common.PackageResult) : Void {
        this.result = result;

        #if js
            js.html.Console.log(this.getResults());
        #elseif sys
        Sys.println(this.getResults());
        #end

        #if instrument
            instrument.coverage.Coverage.endCoverage();
        #end
        if (!result.stats.isOk) {
            #if sys
                Sys.exit(1);
            #elseif js
            js.Syntax.code("process.exit(1)");
            #end
        }
    }
}
