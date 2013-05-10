/* This file is generated, do not edit! Visit http://api.jquery.com/ for API documentation. */
package jQuery;
@:final @:build(jQuery.haxe.Config.build()) extern class JQueryStatic {
	/**
		Set default values for future Ajax requests. Its use is not recommended.
	**/
	@:jQueryVersion({added:"1.1"}) static public function ajaxSetup(options:Dynamic):Void;
	/**
		Creates an object that handles the actual transmission of Ajax data.
	**/
	@:jQueryVersion({added:"1.5"}) static public function ajaxTransport(dataType:String,handler:Dynamic->Dynamic->jQuery.JqXHR->Void):Void;
	/**
		Check to see if a DOM element is a descendant of another DOM element.
	**/
	@:jQueryVersion({added:"1.4"}) static public function contains(container:js.html.Node,contained:js.html.Node):Bool;
	/**
		Check to see if a DOM node is within an XML document (or is an XML document).
	**/
	@:jQueryVersion({added:"1.1.4"}) static public function isXMLDoc(node:js.html.Node):Bool;
	/**
		Returns value at named data store for the element, as set by <code>jQuery.data(element, name, value)</code>, or the full data store for the element.
	**/
	@:overload @:jQueryVersion({added:"1.4"}) static public function data(element:js.html.Node):Dynamic;
	/**
		Returns value at named data store for the element, as set by <code>jQuery.data(element, name, value)</code>, or the full data store for the element.
	**/
	@:overload @:jQueryVersion({added:"1.2.3"}) static public function data(element:js.html.Node,key:String):Dynamic;
	/**
		Store arbitrary data associated with the specified element. Returns the value that was set.
	**/
	@:overload @:jQueryVersion({added:"1.2.3"}) static public function data(element:js.html.Node,key:String,value:Dynamic):Dynamic;
	/**
		Determine whether the argument is a window.
	**/
	@:jQueryVersion({added:"1.4.3"}) static public function isWindow(obj:Dynamic):Bool;
	/**
		Remove a previously-stored piece of data.
	**/
	@:jQueryVersion({added:"1.2.3"}) static public function removeData(element:js.html.Node,?name:String):jQuery.JQuery;
	/**
		Provides a way to execute callback functions based on one or more objects, usually <a href="/category/deferred-object/">Deferred</a> objects that represent asynchronous events.
	**/
	@:jQueryVersion({added:"1.5"}) static public function when(deferreds:jQuery.Deferred):jQuery.Promise;
	/**
		A generic iterator function, which can be used to seamlessly iterate over both objects and arrays. Arrays and array-like objects with a length property (such as a function's arguments object) are iterated by numeric index, from 0 to length-1. Other objects are iterated via their named properties.
	**/
	@:jQueryVersion({added:"1.0"}) static public function each(collection:Dynamic,callback:Int->Dynamic->Void):Dynamic;
	/**
		Execute the next function on the queue for the matched element.
	**/
	@:jQueryVersion({added:"1.3"}) static public function dequeue(element:js.html.Node,?queueName:String):Void;
	/**
		Search for a specified value within an array and return its index (or -1 if not found).
	**/
	@:jQueryVersion({added:"1.2"}) static public function inArray(value:Dynamic,array:Array<Dynamic>,?fromIndex:Float):Float;
	/**
		Load a JavaScript file from the server using a GET HTTP request, then execute it.
	**/
	@:jQueryVersion({added:"1.0"}) static public function getScript(url:String,?success:String->String->jQuery.JqXHR->Void):jQuery.JqXHR;
	/**
		Relinquish jQuery's control of the <code>$</code> variable.
	**/
	@:jQueryVersion({added:"1.0"}) static public function noConflict(?removeAll:Bool):Dynamic;
	/**
		Create a serialized representation of an array or object, suitable for use in a URL query string or Ajax request. 
	**/
	@:overload @:jQueryVersion({added:"1.2"}) static public function param(obj:Array<Dynamic>):String;
	/**
		Create a serialized representation of an array or object, suitable for use in a URL query string or Ajax request. 
	**/
	@:overload @:jQueryVersion({added:"1.2"}) static public function param(obj:Dynamic):String;
	/**
		Create a serialized representation of an array or object, suitable for use in a URL query string or Ajax request. 
	**/
	@:overload @:jQueryVersion({added:"1.4"}) static public function param(obj:Array<Dynamic>,traditional:Bool):String;
	/**
		Create a serialized representation of an array or object, suitable for use in a URL query string or Ajax request. 
	**/
	@:overload @:jQueryVersion({added:"1.4"}) static public function param(obj:Dynamic,traditional:Bool):String;
	/**
		Determine if the argument passed is a Javascript function object. 
	**/
	@:jQueryVersion({added:"1.2"}) static public function isFunction(obj:Dynamic):Bool;
	/**
		Takes a function and returns a new one that will always have a particular context.
	**/
	@:overload @:jQueryVersion({added:"1.4"}) static public function proxy(context:Dynamic,name:String):Dynamic;
	/**
		Takes a function and returns a new one that will always have a particular context.
	**/
	@:overload @:jQueryVersion({added:"1.4"}) static public function proxy(_function:Dynamic,context:Dynamic):Dynamic;
	/**
		Takes a function and returns a new one that will always have a particular context.
	**/
	@:overload @:jQueryVersion({added:"1.6"}) static public function proxy(context:Dynamic,name:String,?additionalArguments:Dynamic):Dynamic;
	/**
		Takes a function and returns a new one that will always have a particular context.
	**/
	@:overload @:jQueryVersion({added:"1.6"}) static public function proxy(_function:Dynamic,context:Dynamic,?additionalArguments:Dynamic):Dynamic;
	/**
		Remove the whitespace from the beginning and end of a string.
	**/
	@:jQueryVersion({added:"1.0"}) static public function trim(str:String):String;
	/**
		Hook directly into jQuery to override how particular CSS properties are retrieved or set, normalize CSS property naming, or create custom properties.
	**/
	@:jQueryVersion({added:"1.4.3"}) static public var cssHooks:Dynamic;
	/**
		Determine whether the argument is an array.
	**/
	@:jQueryVersion({added:"1.3"}) static public function isArray(obj:Dynamic):Bool;
	/**
		Convert an array-like object into a true JavaScript array.
	**/
	@:jQueryVersion({added:"1.2"}) static public function makeArray(obj:Dynamic):Array<Dynamic>;
	/**
		Holds or releases the execution of jQuery's ready event.
	**/
	@:jQueryVersion({added:"1.6"}) static public function holdReady(hold:Bool):Void;
	/**
		Translate all items in an array or object to new array of items.
	**/
	@:overload @:jQueryVersion({added:"1.0"}) static public function map(array:Array<Dynamic>,callback:Dynamic->Int->Dynamic):Array<Dynamic>;
	/**
		Translate all items in an array or object to new array of items.
	**/
	@:overload @:jQueryVersion({added:"1.6"}) static public function map(arrayOrObject:Array<Dynamic>,callback:Dynamic->Int->Dynamic):Array<Dynamic>;
	/**
		Translate all items in an array or object to new array of items.
	**/
	@:overload @:jQueryVersion({added:"1.6"}) static public function map(arrayOrObject:Array<Dynamic>,callback:Dynamic->String->Dynamic):Array<Dynamic>;
	/**
		Translate all items in an array or object to new array of items.
	**/
	@:overload @:jQueryVersion({added:"1.6"}) static public function map(arrayOrObject:{},callback:Dynamic->Int->Dynamic):Array<Dynamic>;
	/**
		Translate all items in an array or object to new array of items.
	**/
	@:overload @:jQueryVersion({added:"1.6"}) static public function map(arrayOrObject:{},callback:Dynamic->String->Dynamic):Array<Dynamic>;
	/**
		Translate all items in an array or object to new array of items.
	**/
	@:overload @:jQueryVersion({added:"1.6"}) static public function map(arrayOrObject:Dynamic,callback:Dynamic->Int->Dynamic):Array<Dynamic>;
	/**
		Translate all items in an array or object to new array of items.
	**/
	@:overload @:jQueryVersion({added:"1.6"}) static public function map(arrayOrObject:Dynamic,callback:Dynamic->String->Dynamic):Array<Dynamic>;
	/**
		Show the queue of functions to be executed on the matched element.
	**/
	@:overload @:jQueryVersion({added:"1.3"}) static public function queue(element:js.html.Node,?queueName:String):Array<Void->Void>;
	/**
		Manipulate the queue of functions to be executed on the matched element.
	**/
	@:overload @:jQueryVersion({added:"1.3"}) static public function queue(element:js.html.Node,queueName:String,newQueue:Array<Void->Void>):jQuery.JQuery;
	/**
		Manipulate the queue of functions to be executed on the matched element.
	**/
	@:overload @:jQueryVersion({added:"1.3"}) static public function queue(element:js.html.Node,queueName:String,callback:Void->Void):jQuery.JQuery;
	/**
		Parses a string into an array of DOM nodes.
	**/
	@:jQueryVersion({added:"1.8"}) static public function parseHTML(data:String,?context:js.html.Node,?keepScripts:Bool):Array<js.html.Node>;
	/**
		Perform an asynchronous HTTP (Ajax) request.
	**/
	@:overload @:jQueryVersion({added:"1.0"}) static public function ajax(?settings:Dynamic):jQuery.JqXHR;
	/**
		Perform an asynchronous HTTP (Ajax) request.
	**/
	@:overload @:jQueryVersion({added:"1.5"}) static public function ajax(url:String,?settings:Dynamic):jQuery.JqXHR;
	/**
		Takes a string and throws an exception containing it.
	**/
	@:jQueryVersion({added:"1.4.1"}) static public function error(message:String):Void;
	/**
		Merge the contents of two arrays together into the first array. 
	**/
	@:jQueryVersion({added:"1.0"}) static public function merge(first:Array<Dynamic>,second:Array<Dynamic>):Array<Dynamic>;
	/**
		Parses a string into an XML document.
	**/
	@:jQueryVersion({added:"1.5"}) static public function parseXML(data:String):js.html.Document;
	/**
		Check to see if an object is empty (contains no enumerable properties).
	**/
	@:jQueryVersion({added:"1.4"}) static public function isEmptyObject(object:Dynamic):Bool;
	/**
		Handle custom Ajax options or modify existing options before each request is sent and before they are processed by <code>$.ajax()</code>.
	**/
	@:jQueryVersion({added:"1.5"}) static public function ajaxPrefilter(?dataTypes:String,handler:Dynamic->Dynamic->jQuery.JqXHR->Void):Void;
	/**
		Contains flags for the useragent, read from navigator.userAgent. <strong>This property was removed in jQuery 1.9</strong> and is available only through the jQuery.migrate plugin. Please try to use feature detection instead.
	**/
	@:jQueryVersion({added:"1.0",deprecated:"1.3",removed:"1.9"}) static public var browser:Dynamic;
	/**
		Creates a new copy of jQuery whose properties and methods can be modified without affecting the original jQuery object.
	**/
	@:jQueryVersion({added:"1.5",deprecated:"1.7",removed:"1.9"}) static public function sub():jQuery.JQuery;
	/**
		Execute some JavaScript code globally.
	**/
	@:jQueryVersion({added:"1.0.4"}) static public function globalEval(code:String):Void;
	/**
		<strong>Deprecated in jQuery 1.3 (see <a href="/jQuery.support">jQuery.support</a>)</strong>. States if the current page, in the user's browser, is being rendered using the <a href="http://www.w3.org/TR/REC-CSS2/box.html">W3C CSS Box Model</a>.
	**/
	@:jQueryVersion({added:"1.0",deprecated:"1.3"}) static public var boxModel:Bool;
	/**
		Load JSON-encoded data from the server using a GET HTTP request.
	**/
	@:jQueryVersion({added:"1.0"}) static public function getJSON(url:String,?data:Dynamic,?success:Dynamic->String->jQuery.JqXHR->Void):jQuery.JqXHR;
	/**
		Finds the elements of an array which satisfy a filter function. The original array is not affected.
	**/
	@:jQueryVersion({added:"1.0"}) static public function grep(array:Array<Dynamic>,_function:Dynamic->Int->Bool,?invert:Bool):Array<Dynamic>;
	/**
		Load data from the server using a HTTP POST request.
	**/
	@:overload @:jQueryVersion({added:"1.0"}) static public function post(url:String,?data:String,?success:Dynamic->String->jQuery.JqXHR->Void,?dataType:String):jQuery.JqXHR;
	/**
		Load data from the server using a HTTP POST request.
	**/
	@:overload @:jQueryVersion({added:"1.0"}) static public function post(url:String,?data:Dynamic,?success:Dynamic->String->jQuery.JqXHR->Void,?dataType:String):jQuery.JqXHR;
	/**
		 A constructor function that returns a chainable utility object with methods to register multiple callbacks into callback queues, invoke callback queues, and relay the success or failure state of any synchronous or asynchronous function.
	**/
	@:jQueryVersion({added:"1.5"}) static public function Deferred(?beforeStart:jQuery.Deferred->Void):jQuery.Deferred;
	/**
		A multi-purpose callbacks list object that provides a powerful way to manage callback lists.
	**/
	@:jQueryVersion({added:"1.7"}) static public function Callbacks(flags:String):jQuery.Callbacks;
	/**
		An empty function.
	**/
	@:jQueryVersion({added:"1.4"}) static public function noop():Void;
	/**
		Determines whether its argument is a number.
	**/
	@:jQueryVersion({added:"1.7"}) static public function isNumeric(value:Dynamic):Bool;
	/**
		Check to see if an object is a plain object (created using "{}" or "new Object").
	**/
	@:jQueryVersion({added:"1.4"}) static public function isPlainObject(object:Dynamic):Bool;
	/**
		Takes a well-formed JSON string and returns the resulting JavaScript object.
	**/
	@:jQueryVersion({added:"1.4.1"}) static public function parseJSON(json:String):Dynamic;
	/**
		A collection of properties that represent the presence of different browser features or bugs. Primarily intended for jQuery's internal use; specific properties may be removed when they are no longer needed internally to improve page startup performance.
	**/
	@:jQueryVersion({added:"1.3"}) static public var support:{/**
		<code>ajax</code> is equal to true if a browser is able to create an <code>XMLHttpRequest</code> object.
	**/
	var ajax:Bool;/**
		<code>boxModel</code> is equal to true if the page is rendering according to the <a href="http://www.w3.org/TR/REC-CSS2/box.html">W3C CSS Box Model</a> (is currently false in IE 6 and 7 when they are in Quirks Mode). This property is null until document ready occurs.
	**/
	var boxModel:Bool;/**
		<code>changeBubbles</code> is equal to true if the change event bubbles up the DOM tree, as required by the <a href="http://www.w3.org/TR/DOM-Level-2-Events/events.html#Events-eventgroupings-htmlevents">W3C DOM event model</a>. (It is currently false in IE, and jQuery simulates bubbling).
	**/
	var changeBubbles:Bool;/**
		<code>checkClone</code> is equal to true if a browser correctly clones the checked state of radio buttons or checkboxes in document fragments.
	**/
	var checkClone:Bool;/**
		<code>checkOn</code> is equal to true if the value of a checkbox defaults to "on" when no value is specified.
	**/
	var checkOn:Bool;/**
		<code>cors</code> is equal to true if a browser can create an <code>XMLHttpRequest</code> object and if that <code>XMLHttpRequest</code> object has a <code>withCredentials</code> property. To enable cross-domain requests in environments that do not support cors yet but do allow cross-domain <abbr title="XMLHttpRequest">XHR</abbr> requests (windows gadget, etc), set <code>$.support.cors = true;</code>.
		      <a href="http://www.w3.org/TR/cors/">CORS WD</a>
	**/
	var cors:Bool;/**
		<code>cssFloat</code> is equal to true if the name of the property containing the CSS float value is .cssFloat, as defined in the <a href="http://www.w3.org/TR/DOM-Level-2-Style/css.html#CSS-CSS2Properties-cssFloat">CSS Spec</a>. (It is currently false in IE, it uses styleFloat instead).
	**/
	var cssFloat:Bool;/**
		<code>hrefNormalized</code> is equal to true if the <code>.getAttribute()</code> method retrieves the <code>href</code> attribute of elements unchanged, rather than normalizing it to a fully-qualified URL. (It is currently false in IE, the URLs are normalized).
		      <div><a href="http://www.w3.org/TR/DOM-Level-3-Core/core.html#ID-666EE0F9">DOM l3 spec</a></div>
	**/
	var hrefNormalized:Bool;/**
		<code>htmlSerialize</code> is equal to true  if the browser is able to serialize/insert <code>&amp;lt;link&amp;gt;</code> elements using the <code>.innerHTML</code> property of elements. (is currently false in IE). <div><a href="http://www.w3.org/TR/2008/WD-html5-20080610/serializing.html#html-fragment">HTML5 WD</a></div>
	**/
	var htmlSerialize:Bool;/**
		<code>leadingWhitespace</code> is equal to true if the browser inserts content with .innerHTML exactly as provided—specifically, if leading whitespace characters are preserved. (It is currently false in IE 6-8). <div><a href="http://www.w3.org/TR/2008/WD-html5-20080610/dom.html#innerhtml0">HTML5 WD</a></div>
	**/
	var leadingWhitespace:Bool;/**
		<code>noCloneChecked</code> is equal to true if cloned DOM elements copy over the state of the <code>.checked</code> expando. (It is currently false in IE). (Added in jQuery 1.5.1)
	**/
	var noCloneChecked:Bool;/**
		<code>noCloneEvent</code> is equal to true  if cloned DOM elements are created without event handlers (that is, if the event handlers on the source element are not cloned). (It is currently false in IE). <div><a href="http://www.w3.org/TR/DOM-Level-2-Events/events.html#Events-Registration-interfaces-h3">DOM l2 spec</a></div>
	**/
	var noCloneEvent:Bool;/**
		<code>opacity</code> is equal to true if a browser can properly interpret the opacity style property. (It is currently false in IE, it uses alpha filters instead). <div><a href="http://www.w3.org/TR/css3-color/#transparency">CSS3 spec</a></div>
	**/
	var opacity:Bool;/**
		<code>optDisabled</code> is equal to true if option elements within disabled select elements are not automatically marked as disabled. <div><a href="http://dev.w3.org/html5/spec/the-button-element.html#attr-option-disabled">HTML5 WD</a></div>
	**/
	var optDisabled:Bool;/**
		<code>optSelected</code> is equal to true if an <code>&amp;lt;option&amp;gt;</code> element that is selected by default has a working <code>selected</code> property. <div><a href="http://dev.w3.org/html5/spec/the-button-element.html#attr-option-selected">HTML5 WD</a></div>
	**/
	var optSelected:Bool;/**
		<code>scriptEval()</code> is equal to true if inline scripts are automatically evaluated and executed when inserted into the document using standard DOM manipulation methods such as <code>.appendChild()</code> and <code>.createTextNode()</code>. (It is currently false in IE, it uses <code>.text</code> to insert executable scripts).
		      <div><strong>Note: No longer supported; removed in jQuery 1.6. Prior to jQuery 1.5.1</strong>, the <code>scriptEval()</code> method was the static <code>scriptEval</code> property. The change to a method allowed the test to be deferred until first use to prevent content security policy inline-script violations. </div>
		      <div><a href="http://www.w3.org/TR/2008/WD-html5-20080610/tabular.html#script">HTML5 WD</a></div>
	**/
	var scriptEval:Void->Bool;/**
		<code>style</code> is equal to true if inline styles for an element can be accessed through the DOM attribute called style, as required by the DOM Level 2 specification. In this case, <code>.getAttribute('style')</code> can retrieve this value; in Internet Explorer, <code>.cssText</code> is used for this purpose. <div><a href="http://www.w3.org/TR/DOM-Level-2-Style/css.html#CSS-ElementCSSInlineStyle">DOM l2 Style spec</a></div>
	**/
	var style:Bool;/**
		<code>submitBubbles</code> is equal to true if the submit event bubbles up the DOM tree, as required by the <a href="http://www.w3.org/TR/DOM-Level-2-Events/events.html#Events-eventgroupings-htmlevents">W3C DOM event model</a>. (It is currently false in IE, and jQuery simulates bubbling).
	**/
	var submitBubbles:Bool;/**
		<code>tbody</code> is equal to true if an empty <code>&amp;lt;table&amp;gt;</code> element can exist without a <code>&amp;lt;tbody&amp;gt;</code> element. According to the HTML specification, this sub-element is optional, so the property should be true in a fully-compliant browser. If false, we must account for the possibility of the browser injecting <code>&amp;lt;tbody&amp;gt;</code> tags implicitly. (It is currently false in IE, which automatically inserts <code>tbody</code> if it is not present in a string assigned to <code>innerHTML</code>). <div><a href="http://dev.w3.org/html5/spec/Overview.html#the-table-element">HTML5 spec</a></div>
	**/
	var tbody:Bool;};
	/**
		Sorts an array of DOM elements, in place, with the duplicates removed. Note that this only works on arrays of DOM elements, not strings or numbers.
	**/
	@:jQueryVersion({added:"1.1.3"}) static public function unique(array:Array<js.html.Node>):Array<js.html.Node>;
	/**
		Determine whether an element has any jQuery data associated with it.
	**/
	@:jQueryVersion({added:"1.5"}) static public function hasData(element:js.html.Node):Bool;
	/**
		Merge the contents of two or more objects together into the first object.
	**/
	@:overload @:jQueryVersion({added:"1.0"}) static public function extend(target:Dynamic,?object1:Dynamic,?objectN:Dynamic):Dynamic;
	/**
		Merge the contents of two or more objects together into the first object.
	**/
	@:overload @:jQueryVersion({added:"1.1.4"}) static public function extend(?deep:Bool,target:Dynamic,object1:Dynamic,?objectN:Dynamic):Dynamic;
	static public var fx:{/**
		The rate (in milliseconds) at which animations fire.
	**/
	var interval:Float;/**
		Globally disable all animations.
	**/
	var off:Bool;};
	/**
		Load data from the server using a HTTP GET request.
	**/
	@:overload @:jQueryVersion({added:"1.0"}) static public function get(url:String,?data:String,?success:Dynamic->String->jQuery.JqXHR->Void,?dataType:String):jQuery.JqXHR;
	/**
		Load data from the server using a HTTP GET request.
	**/
	@:overload @:jQueryVersion({added:"1.0"}) static public function get(url:String,?data:Dynamic,?success:Dynamic->String->jQuery.JqXHR->Void,?dataType:String):jQuery.JqXHR;
	/**
		Return a number representing the current time.
	**/
	@:jQueryVersion({added:"1.4.3"}) static public function now():Float;
	/**
		Determine the internal JavaScript [[Class]] of an object.
	**/
	@:jQueryVersion({added:"1.4.3"}) static public function type(obj:Dynamic):String;
}