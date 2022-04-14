package tests;

import utest.Runner;

class TestLoader {
	static function main() {
		var runner = new Runner();
		new NoExitReport(runner);
		runner.addCases(tests.cases);
		runner.run();
	}

	static function __init__() {
		#if php
		// PHP 8.1 compatibility workaround https://github.com/HaxeFoundation/haxe/issues/10502
		untyped if (version_compare(PHP_VERSION, "8.1.0", ">=")) error_reporting(error_reporting() & ~E_DEPRECATED);
		#end
	}
}

class NoExitReport extends utest.ui.text.PrintReport {
	override function complete(result:utest.ui.common.PackageResult) {
		this.result = result;

		#if js
		js.html.Console.log(this.getResults());
		#elseif sys
		Sys.println(this.getResults());
		#end

		instrument.coverage.Coverage.endCoverage();
		if (!result.stats.isOk) {			
			#if sys
			Sys.exit(1);
			#elseif js
			js.Syntax.code('process.exit(1)');
			#end
		}
	}
}
