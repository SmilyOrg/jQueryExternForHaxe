# jQueryExtern [![Build Status](https://travis-ci.org/andyli/jQueryExternForHaxe.png?branch=master)](https://travis-ci.org/andyli/jQueryExternForHaxe)

[![Support via Gittip](https://rawgithub.com/twolfson/gittip-badge/0.2.1/dist/gittip.png)](https://www.gittip.com/AndyLi/)

[jQuery](http://jquery.com/) extern for [Haxe](http://haxe.org/).

Currently supports jQuery version up to *1.11.1* / *2.1.1*. Requires Haxe 3.0+.

You may check my [blog](http://blog.onthewings.net/) for updates.

## Download and Install

Install via [haxelib](http://haxe.org/doc/haxelib/using_haxelib):
`haxelib install jQueryExtern`

Then put `-lib jQueryExtern` into your hxml.

##Usage

Typically:
```haxe
import jQuery.*;
 
class Main {
	static public function main():Void {
		new JQuery(function():Void { //when document is ready
			//your magic
		});
	}
}
```
It is same as how you use jQuery in JS. But instead of `$`, you refer jQuery as `JQuery`.

eg. Hiding all *li* object:
```haxe
new JQuery("li").hide(); //same as $("li").hide() in JS
```

Static methods of jQuery can be accessed from `JQuery._static`.

eg. A ajax example:
```haxe
JQuery._static.get("ajax/test.html", function(data) {
	js.Lib.alert(data);
});
```
Remember **jQueryExtern** is simply an extern, you have to link jQuery in your html file.

eg. In your `<head>`:
```html
<!-- from jQuery's CDN (http://jquery.com/download/#using-jquery-with-a-cdn) -->
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<!-- Your haxe compiled script: -->
<script type="text/javascript" src="Main.js"></script>
```

## *js.JQuery* in haxe std lib VS *jQueryExtern*

<table>
	<tr>
		<td></td>
		<th scope="col">js.JQuery</th>
		<th scope="col">jQueryExtern</th>
	</tr>
	<tr>
		<th scope="row">import statement</th>
		<td>"import js.JQuery;"</td>
		<td>"import jQuery.*;"</td>
	</tr>
	<tr>
		<th scope="row">jQuery API version</th>
		<td>partial 1.6.4</td>
		<td>complete 1.11.1 / 2.1.1</td>
	</tr>
	<tr>
		<th scope="row">refer jQuery in output as</th>
		<td>"js.JQuery"</td>
		<td>"$" (or "jQuery" if <i>--macro jQuery.haxe.Config.setNative('jQuery')</i>)</td>
	</tr>
	<tr>
		<th scope="row">include jQuery in output</th>
		<td>no (can be opt-in by -D embed-js)</td>
		<td>no, <a href="http://jquery.com/download/#using-jquery-with-a-cdn" target="_blank">use CDN instead</a></td>
	</tr>
</table>

In fact, since both *js.JQuery* in haxe std lib and *jQueryExtern* are just extern files, they can be used in same project.

The following will compile and run perfectly.

```haxe
function takesJQueryExtern(j:jQuery.JQuery):Void {
	trace(j);
}
function takesJsJQuery(j:js.JQuery):Void {
	trace(j);
}

var div = new js.JQuery("<div></div>");
takesJQueryExtern(untyped div);
takesJQueryExtern(cast div);

var div = new jQuery.JQuery("<div></div>");
takesJsJQuery(untyped div);
takesJsJQuery(cast div);
```

## License

jQueryExtern is released in the public domain. NO WARRANTY EXPRESSED OR IMPLIED. USE AT YOUR OWN RISK.

jQuery's license can be found at http://jquery.org/license.
