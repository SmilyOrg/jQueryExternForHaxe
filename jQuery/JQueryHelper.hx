package jQuery;
import js.html.DOMWindow;
import js.html.Element;

extern class JQueryHelper {
	@:overload(function(j:JQuery):JQuery{})
	@:overload(function(j:DOMWindow):JQuery{})
	@:overload(function(j:Element):JQuery{})
	public static inline function J( html : String ) : JQuery {
		return new JQuery(html);
	}

	public static var JTHIS(get, null) : JQuery;

	static inline function get_JTHIS() : JQuery {
		return untyped __js__("$(this)");
	}
}
