package jQuery.haxe.gen;

import sys.*;
import sys.io.*;
import haxe.xml.*;
import haxe.macro.*;
import haxe.macro.Expr;
using haxe.macro.ComplexTypeTools;
using StringTools;
using Lambda;
using Reflect;

typedef FuncConfig = { ?doc:String, ?added:String, ?deprecated:String, ?removed:String }

/**
* http://api.jquery.com/resources/api.xml
*/
@:native("CoreExternGenerator")
class CoreExternGenerator {
	/**
		Haxe keywords. Used to rename api function/variables names.
	**/
	static var keywords(default, null) = ["function", "true", "false", "if", "else", "switch", "class", "interface"];
	var api:Fast;
	
	public function new(apiXml:Xml):Void {
		this.api = new Fast(apiXml).node.api;
	}
	
	/**
		Maps a type in api.xml to one or more Haxe ComplexType.
		tag is the xml node where the type is listed.
	**/
	public function toComplexType(type:String, ?tag:Fast):Array<ComplexType> {		
		var tagStr = tag == null ? "" : tag.x.toString().ltrim();
		var tagName = tag == null ? "" : tag.att.name;
		var entryName = tag == null ? "" : switch (tag.name) {
			case "entry": tagName;
			case "argument": new Fast(tag.x.parent.parent).att.name;
			default: trace(tag.name); "";
		}
		if (type != null) type = type.trim();
		
		var simple = type == null ? [macro:Dynamic] : switch(type) {
			case "jQueryStatic":
				[macro:jQuery.JQueryStatic];
			case "jQuery", "jQuery object":
				[macro:jQuery.JQuery];
			case "event", "Event":
				[macro:jQuery.Event];
			case "callbacks", "Callbacks":
				[macro:jQuery.Callbacks];
			case "jQuery.deferred", "Deferred", "deferred":
				[macro:jQuery.Deferred];
			case "Promise":
				[macro:jQuery.Promise];
			case "jqXHR":
				[macro:jQuery.JqXHR];
			case "Selector", "selector":
				[macro:String];
			case "htmlString", "HTML":
				[macro:String];
			case "document", "XMLDocument":
				[macro:js.html.Document];
			case "Element":
				[macro:js.html.Node];
			/*case "Elements":
				[macro:Array<js.html.Node>];*/
			
			case "Boolean", "boolean":
				[macro:Bool];
			case "Number":
				[macro:Float];
			case "Integer":
				[macro:Int];
			case "String":
				[macro:String];
			case "Anything":
				[macro:Dynamic];
			case ("Object" | "PlainObject") if (!["offset", "position"].has(entryName) && !["jQuery object"].has(tagName)):
				[macro:Dynamic]; //should be {}, but jQuery doc uses "Object" for "Anything" :(
			case "undefined", "": 
				[macro:Void];
			
			case _ if (type.indexOf(",") >= 0):
				//older version of api.xml sometimes use , to list multiple types...
				trace(type);
				type.split(",")
					.map(toComplexType.bind(_, tag))
					.fold(function(ts,all:Array<ComplexType>) return all.concat(ts), []);
				
			default:
				null;
		}
		
		return simple != null ? simple : switch ([entryName, tagName, type]) {
			case ["jQuery.each", "callback(indexInArray, valueOfElement)", "Function"]:
				[macro:Int->Dynamic->Void];
			case ["jQuery.getScript", "success(script, textStatus, jqXHR)", "Function"]:
				[macro:String->String->jQuery.JqXHR->Void];
			case ["jQuery.parseHTML", "jQuery.parseHTML", "Array"]:
				[macro:Array<js.html.Node>];
			case ["add", "elements", "Elements"]:
				[macro:js.html.Node, macro:js.html.NodeList];
			case ["attr", "function(index, attr)", "Function"]:
				[macro:Int->String->String];
			case ["before", "function", "Function"]:
				[macro:Int->Dynamic];
			case ["css", "propertyNames", "Array"]:
				[macro:Array<String>];
			case ["jQuery.queue", "jQuery.queue" | "newQueue", "Array"]:
				[macro:Array<Void->Void>];
			case ["queue", "queue" | "newQueue", "Array"]:
				[macro:Array<Void->Void>];
			case ["queue", "callback( next )", "Function"]:
				[macro:(Void->Void)->Void];
			case ["jQuery.proxy", _, "Function"]:
				[macro:Dynamic];
			case ["each", "function(index, Element)", "Function"]:
				[macro:Int->js.html.Node->Void];
			case ["ajaxSend", "handler(event, jqXHR, ajaxOptions)", "Function"]:
				[macro:jQuery.Event->jQuery.JqXHR->Dynamic->Void];
			case ["ajaxError", "handler(event, jqXHR, ajaxSettings, thrownError)", "Function"]:
				[macro:jQuery.Event->jQuery.JqXHR->Dynamic->String->Void];
			case ["jQuery.Deferred", "beforeStart", "Function"]:
				[macro:jQuery.Deferred->Void];
			case ["serializeArray", "serializeArray", "Array"]:
				[macro:Array<Dynamic>];
			case ["triggerHandler", "extraParameters", "Array"]:
				[macro:Array<Dynamic>];
			case ["replaceWith", "function", "Function"]:
				[macro:Void->Dynamic];
			case ["pushStack", "elements", "Array"]:
				[macro:Array<js.html.Node>, macro:js.html.NodeList];
			case ["pushStack", "arguments", "Array"]:
				[macro:Array<Dynamic>];
			case ["not", "elements", "Elements"]:
				[macro:js.html.Node, macro:js.html.NodeList, macro:Array<js.html.Node>];
			case ["map", "callback(index, domElement)", "Function"]:
				[macro:Int->js.html.Node->jQuery.JQuery];
			case ["prop", "function(index, oldPropertyValue)", "Function"]:
				[macro:Int->String->String, macro:Int->Float->Float, macro:Int->Bool->Bool];
			case ["val", "value", "Array"]:
				[macro:Array<String>];
			case ["val", "val", "Array"]:
				[macro:Array<Dynamic>];
			case ["val", "function(index, value)", "Function"]:
				[macro:Int->Dynamic->Void];
			case ["closest", "selectors", "Array"]:
				[macro:String, macro:Array<String>, macro:jQuery.JQuery];
			case ["closest", "closest", "Array"]:
				[macro:Array<Dynamic>];
			case ["jQuery", "elementArray", "Array"]:
				[macro:js.html.NodeList, macro:Array<js.html.Node>];
			case ["jQuery", "callback", "Function"]:
				[macro:Void->Void, macro:Class<jQuery.JQuery>->Void];
			case ["toArray", "toArray", "Array"]:
				[macro:Array<js.html.Node>];
			case ["toggleClass", "function(index, class, switch)", "Function"]:
				[macro:Int->String->Bool->String];
			case ["trigger", "extraParameters", "Array"]:
				[macro:Array<Dynamic>];
			case ["removeData", "list", "Array"]:
				[macro:Array<String>];
			case ["jQuery.param", "obj", "Array"]:
				[macro:Array<Dynamic>];
			
			case [_, "callbacks", "Function"]:
				[macro:Dynamic];
			
			case [_, "callbacks", "Array"]:
				[macro:Array<Dynamic>];
			
			case [_, "content", "Array"]:
				[macro:Array<js.html.Node>, macro:js.html.NodeList, macro:Array<String>, macro:Array<jQuery.JQuery>];
			
			case [_, "jQuery object", _]:
				[macro:jQuery.JQuery];
			
			case ["offset" | "position", _, "Object" | "PlainObject"]:
				[macro:{top:Float, left:Float}];
			
			case ["offset", "function(index, coords)", "Function"]:
				[macro:Int->{left:Float, top:Float}->{left:Float, top:Float}];
					
			case [
				_,
				"complete" | "callback()" | "handler" | "handler()",
				"Function"
			]:
				[macro:Void->Void];
				
			case [
				_, 
				"doneCallbacks" | "failCallbacks" | "progressCallbacks" | "alwaysCallbacks", 
				"Function"
			]:
				[macro:Dynamic, macro:Array<Dynamic>];
			
			case [
				_, 
				"doneCallbacks" | "failCallbacks" | "progressCallbacks" | "alwaysCallbacks", 
				"Array"
			]:
				[macro:Array<Dynamic>];
			
			case [
				_, 
				"doneFilter" | "failFilter" | "progressFilter", 
				"Function"
			]:
				[macro:Dynamic];
					
			case [
				"deferred.resolveWith" | "deferred.rejectWith",
				"args",
				"Array"
			]:
				[macro:Array<Dynamic>];
					
			case [
				_,
				"handler(eventObject)" | "handlerIn(eventObject)" | "handlerOut(eventObject)" | "handlerInOut(eventObject)", 
				"Function"
			]:
				[macro:jQuery.Event->Void];
					
			case [_, "function(index)", "Function"]:
				[macro:Int->Void];
					
			case [
				_,
				"function(index, text)" | "function(index, html)" | "function(index, oldhtml)" | "function(index, class)" | "function(index, currentClass)",
				"Function"
			]:
				[macro:Int->String->Void];
					
			case ["callbacks.has", "callback", "Function"]:
				[macro:Dynamic];
					
			case ["jQuery.unique", _, "Array"]:
				[macro:Array<js.html.Node>];
			
			case ["get", "get", "Array"]:
				[macro:Array<js.html.Node>];
			
			case ["height", "function(index, height)", "Function"] | ["width", "function(index, width)", "Function"] | ["css", "function(index, value)", "Function"]:
				[macro:Int->String->Dynamic];
					
			case [_, "handler(options, originalOptions, jqXHR)", "Function"]:
				[macro:Dynamic->Dynamic->jQuery.JqXHR->Void];
					
			case [_, "success(data, textStatus, jqXHR)", "Function"]:
				[macro:Dynamic->String->jQuery.JqXHR->Void];
					
			case [_, "complete(responseText, textStatus, XMLHttpRequest)", "Function"]:
				[macro:Dynamic->String->js.html.XMLHttpRequest->Void];
					
			case [_, "handler(event, XMLHttpRequest, ajaxOptions)", "Function"]:
				[macro:jQuery.Event->js.html.XMLHttpRequest->Dynamic->Void];
					
			default:
				trace('["${entryName}", "${tagName}", "${type}"]');
				[macro:Dynamic];
		}
	}
	
	/**
		Compare function for Array.sort().
		Stricter ComplexType will come first (returns -ve); more dynamic one will come last (returns +ve).
	**/
	static public function compareComplexType(a:ComplexType, b:ComplexType):Int {
		return
			switch ([a, b]) {
				case [macro:Dynamic, macro:Dynamic]:
					0;
				case [macro:Dynamic, TPath({pack:[], name:"Dynamic", params:_})]:
					1;
				case [TPath({pack:[], name:"Dynamic", params:_}), macro:Dynamic]:
					-1;
				case [TPath({pack:[], name:"Dynamic", params:[TPType(paramA)]}), TPath({pack:[], name:"Dynamic", params:[TPType(paramB)]})]:
					compareComplexType(paramA, paramB);
				
				case [TPath({pack:[], name:"Dynamic", params:_}), _]:
					1;
				case [_, TPath({pack:[], name:"Dynamic", params:_})]:
					-1;
				
				case [macro:Float, macro:Int]:
					1;
				case [macro:Int, macro:Float]:
					-1;
				
				case [TPath(tpA), TPath(tpB)] if (tpA.name == tpB.name && tpA.pack.join(".") == tpB.pack.join(".")):
					var pdiff = tpA.params.length - tpB.params.length;
					if (pdiff != 0) {
						pdiff;
					} else {
						Reflect.compare(tpA.name, tpB.name);
					}
				
				case [_, TPath(_)]:
					1;
				case [TPath(_), _]:
					-1;
				
				case [TAnonymous(fieldsA), TAnonymous(fieldsB)]:
					fieldsB.length - fieldsA.length;
				case [TExtend(_, fieldsA), TExtend(_, fieldsB)]:
					fieldsB.length - fieldsA.length;
				
				case _:
					0;
			}
	}
	
	/**
		Compare function for Array.sort().
		Function with stricter arguments will come first (returns -ve); more dynamic one will come last (returns +ve).
	**/
	static public function compareFunctions(a:Function, b:Function):Int {
		if (a.args.length != b.args.length) {
			return a.args.length - b.args.length;
		} else {
			for (i in 0...a.args.length) {
				var aArg = a.args[i], bArg = b.args[i];
				switch([aArg, bArg]) {
					case [{opt:true}, {opt:false}]:
						return 1;
					case [{opt:false}, {opt:true}]:
						return -1;
					case _:
						var v = compareComplexType(aArg.type, bArg.type);
						if (v != 0)
							return v;
				}
			}
			return 0;
		}
	}
	
	/**
		Mutates the source to form all non-repeating sequence.
		Eg. compo([["a"], ["b0", "b1", "b2", "b3"], ["c0","c1"]]) => [[a,b0,c0],[a,b1,c0],[a,b2,c0],[a,b3,c0],[a,b3,c1],[a,b2,c1],[a,b1,c1],[a,b0,c1]]
	**/
	static function compo<T>(src:Array<Array<T>>, ?out:Array<Array<T>>, ?ind:Array<Int>, ?indMap:Map<String,Void>):Array<Array<T>> {
		if (ind == null) ind = [for (i in src) 0];
		if (indMap == null) indMap = new Map();
		if (out == null) out = [];
		
		var indKey = ind.join(",");
		if (indMap.exists(indKey)) return out;
		
		out.push([for (i in 0...ind.length) src[i][ind[i]]]);
		indMap.set(indKey, null);
		
		for (i in 0...ind.length) {
			if (ind[i]+1 < src[i].length) {
				var indNew = ind.copy();
				indNew[i]++;
				compo(src, out, indNew, indMap);
			}
		}
		
		return out;
	}
	
	macro static public function funcSig(e:Expr):ExprOf<Function> {
		switch(e.expr) {
			case EFunction(_, f):
				f.expr = null;
				return macro $v{f};
			default: 
				return throw "Input is not EFunction.";
		}
	}
	
	public function generate():Array<TypeDefinition> {
		var out = [];
		
		
		/*
			build a Map that is className => { statics: memberName => Array<entry>, instances: memberName => Array<entry> }
		*/
		
		var classEntryMap = new Map<String, { statics:Map<String,Array<Fast>>, instances:Map<String,Array<Fast>> }>();
		for (entry in api.node.entries.nodes.entry) {
			var name = switch(entry.att.name) {
				case "jQuery": "new";
				case name: name;
			};
			var names = name.split(".");
			var isJQueryStatic = name.startsWith("jQuery.");
			var owner = (isJQueryStatic || names.length == 1) ? "jQuery" : names[0];
			
			switch (names.length - (isJQueryStatic || owner != "jQuery" ? 1 : 0)) {
				case 1: //pass
				case 2: name = names[1];
				default: trace(name);
			}
			
			switch (entry.att.type) {
				case "method", "property":
					//ok
				case "selector":
					continue;
				default: 
					throw "unknown entry type: " + entry.att.type;
					continue;
			}
			
			var entryMaps = classEntryMap.get(owner);
			if (entryMaps == null) {
				entryMaps = { statics: new Map(), instances: new Map() }
				classEntryMap.set(owner, entryMaps);
			}
			
			var entryMap = isJQueryStatic ? entryMaps.statics : entryMaps.instances;
			
			if (entryMap.exists(name))
				entryMap.get(name).push(entry);
			else
				entryMap.set(name, [entry]);
		}
		
		/*
			put JQuery static fields into JQueryStatic
		*/
		
		var jQuery = classEntryMap.get("jQuery");
		var jQueryStatic = {
			statics: jQuery.statics,
			instances: new Map()
		}
		classEntryMap.set("jQueryStatic", jQueryStatic);
		jQuery.statics = new Map();
		
		
		/*
			start creating each class
		*/
		
		for (clsName in classEntryMap.keys()) {
			var entryMaps = classEntryMap.get(clsName);
			var type = {
				var types = toComplexType(clsName);
				types.length == 1 ? types[0] : throw clsName; //ensure it is mapped to a single haxe class
			}
		
			var fields:Array<Field> = [];
			
			// copy constructor function to its own class as "new"
			if (!entryMaps.instances.exists("new")) {
				var ctrName = "jQuery." + clsName.charAt(0).toUpperCase() + clsName.substring(1);
				if (jQueryStatic.statics.exists(ctrName)) {
					entryMaps.instances.set("new", jQueryStatic.statics.get(ctrName));
				}
			}
			
			for (isStatic in [true, false]) {
				var entryMap = isStatic ? entryMaps.statics : entryMaps.instances;
				for (memName in entryMap.keys()) {
					switch (memName) {
						case "browser":
							continue;
						default:
							//pass
					}
					
					var mem = entryMap.get(memName);
					var type = mem[0].att.type;
					
					var field:Field = {
						name: memName.substring(memName.indexOf(".")+1),
						doc: "",
						access: isStatic ? [AStatic, APublic] : [APublic],
						kind: null,
						pos: null,
						meta: []
					};
					
					//in case there is a name collision in static field and instance field
					if (isStatic && entryMaps.instances.exists(field.name)) {
						var nativeName = field.name;
						field.name = "static" + nativeName.charAt(0).toUpperCase() + nativeName.substr(1);
						field.meta.push({
							name: ":native",
							params: [{expr: EConst(CString(nativeName)), pos:null}],
							pos: null
						});
					}
					
					switch (type) {
						case "method":
							//ensure all are methods
							if (!mem.foreach(function(m) return m.att.type == "method")){
								throw memName + "is of types: " + [for (m in mem) m.att.type].join(", ");
							}
							
							var functions:Array<{
								func: Function,
								config: FuncConfig
							}> = [];
							
							switch(memName) {
								case "jQuery.makeArray":
									functions.push({ func: funcSig(
										function makeArray(obj:Dynamic):Array<Dynamic>{}
									), config: {}});
								case "jQuery.inArray":
									functions.push({ func: funcSig(
										function inArray<T>(value:T, array:Array<T>, ?fromIndex:Int):Int{}
									), config: {}});
								case "jQuery.map":
									functions.push({ func: funcSig(
										function map<T,T2>(array:Array<T>, callback:T->Int->T2):Array<T2>{}
									), config: {}});
									functions.push({ func: funcSig(
										function map<T,T2>(array:Array<T>, callback:T->Int->Array<T2>):Array<T2>{}
									), config: {}});
									functions.push({ func: funcSig(
										function map<T,T2>(obj:Dynamic<T>, callback:T->String->T2):Array<T2>{}
									), config: {}});
									functions.push({ func: funcSig(
										function map<T,T2>(obj:Dynamic<T>, callback:T->String->Array<T2>):Array<T2>{}
									), config: {}});
								case "jQuery.merge":
									functions.push({ func: funcSig(
										function merge<T>(first:Array<T>, second:Array<T>):Array<T>{}
									), config: {}});
								case "jQuery.grep":
									functions.push({ func: funcSig(
										function grep<T>(array:Array<T>, funct:T->Int->Bool, ?invert:Bool):Array<T>{}
									), config: {}});
								default:
									for (entry in mem) {
										for (sig in entry.nodes.signature) {
											var argss:Array<Array<FunctionArg>> = [for (arg in sig.nodes.argument)
												[
													for (type in 
														arg.has.type ?
															toComplexType(arg.att.type, arg)
														:
															arg.hasNode.type ?
																arg.nodes.type.fold(function(t, a:Array<ComplexType>) return a.concat(toComplexType(t.att.name, arg)), [])
															:
																toComplexType(null, arg)
													) {
														name: {
															var id = ~/(?:_*[a-z][_a-zA-Z0-9]*|_+[0-9][_a-zA-Z0-9]*|_*[A-Z][_a-zA-Z0-9]*|_+|\$[_a-zA-Z0-9]+)/;
															id.match(arg.att.name);
															var name = id.matched(0);
															if (keywords.indexOf(name) != -1)
																"_" + name;
															else
																name;
														},
														opt: arg.has.optional && (arg.att.optional == "true" ? true : throw arg.att.optional),
														type: type,
													}
												]
											];
											
											for (args in compo(argss))
												functions.push({ func:{
													args: args,
													ret: switch(memName) {
														case "new":
															macro:Void;
														default:
															var types = if (entry.has.resolve("return")) {
																toComplexType(entry.att.resolve("return"), entry);
															} else {
																[for (r in entry.nodes.resolve("return")) r.att.type]
																	.fold(
																		function(t:String, ts:Array<ComplexType>) return ts.concat(toComplexType(t, entry)), 
																		[]
																	);
															};
															
															if (types.length == 1)
																types[0];
															else
																macro:Dynamic;
													},
													expr: null,
													params: []
												}, config:{
													added: sig.hasNode.added ? sig.node.added.innerHTML : entry.has.added ? entry.att.added : null,
													deprecated: sig.hasNode.deprecated ? sig.node.deprecated.innerHTML : entry.has.deprecated ? entry.att.deprecated : null,
													removed: sig.hasNode.removed ? sig.node.removed.innerHTML : entry.has.removed ? entry.att.removed : null,
													doc: entry.node.desc.innerHTML
												}});
										}
									}
									
									switch (memName) {
										case "deferred.resolve":
											functions.push({ func:funcSig(
												function resolve():jQuery.Deferred{}
											), config:{}});
										default:
											
									}
							}
							
							//sort
							functions.sort(function(f0,f1) return compareFunctions(f0.func, f1.func));
							
							if (functions.length > 1) {
								field.meta.push({
									name:":overload",
									params:[],
									pos: null
								});
							}
							
							//create Field for individual signature
							//the Config build macro will put them back to @:overload metas
							for (f in functions) {
								var clonedField = field.copy();
								clonedField.kind = FFun(f.func);
								clonedField.doc = f.config.doc;
								clonedField.meta = field.meta.copy();
								
								var jQueryVersionFields = [];
								if (f.config.added != null) {
									jQueryVersionFields.push({ 
										field: "added", 
										expr : { expr: EConst(CString(f.config.added)), pos:null } 
									});
								}
								if (f.config.deprecated != null) {
									jQueryVersionFields.push({ 
										field: "deprecated", 
										expr : { expr: EConst(CString(f.config.deprecated)), pos:null } 
									});
								}
								if (f.config.removed != null) {
									jQueryVersionFields.push({ 
										field: "removed", 
										expr : { expr: EConst(CString(f.config.removed)), pos:null } 
									});
								}
								if (jQueryVersionFields.length > 0) {
									clonedField.meta.push({
										name:":jQueryVersion",
										params:[{ expr:EObjectDecl(jQueryVersionFields), pos: null }],
										pos: null
									});
								}
								fields.push(clonedField);
							}
						case "property":
							var entry = mem[0];
							if (mem.length == 1) {
								var types = switch (memName) {
									case "jQuery.support":
										var supportFields:Array<Field> = [];
										for (li in entry.node.longdesc.node.ul.nodes.li) {
											var itemName = li.node.code.innerHTML;
											supportFields.push({
												name: itemName.endsWith("()") ? itemName.substr(0, itemName.length-2) : itemName,
												doc: li.innerHTML,
												kind: FVar(itemName.endsWith("()") ? macro:Void->Bool : macro:Bool),
												pos : null
											});
										}
										[TAnonymous(supportFields)];
									default:
										toComplexType(entry.att.resolve("return"), entry);
								}
								field.kind = FVar(types.length == 1 ? types[0] : macro:Dynamic, null);
								field.doc = entry.node.desc.innerHTML;
							
								var sig = entry.node.signature;
								var added = sig.hasNode.added ? sig.node.added.innerHTML : entry.has.added ? entry.att.added : null;
								var deprecated = sig.hasNode.deprecated ? sig.node.deprecated.innerHTML : entry.has.deprecated ? entry.att.deprecated : null;
								var removed = sig.hasNode.removed ? sig.node.removed.innerHTML : entry.has.removed ? entry.att.removed : null;
							
								var jQueryVersionFields = [];
								if (added != null) {
									jQueryVersionFields.push({ 
										field: "added", 
										expr : { expr: EConst(CString(added)), pos:null } 
									});
								}
								if (deprecated != null) {
									jQueryVersionFields.push({ 
										field: "deprecated", 
										expr : { expr: EConst(CString(deprecated)), pos:null } 
									});
								}
								if (removed != null) {
									jQueryVersionFields.push({ 
										field: "removed", 
										expr : { expr: EConst(CString(removed)), pos:null } 
									});
								}
								if (jQueryVersionFields.length > 0) {
									field.meta.push({
										name:":jQueryVersion",
										params:[{ expr:EObjectDecl(jQueryVersionFields), pos: null }],
										pos: null
									});
								}
							} else {
								switch (memName) {
									case "fx":
										var fields = [];
										for (entry in mem) {
											var types = toComplexType(entry.att.resolve("return"), entry);
											var field = Reflect.copy(field);
											field.name = entry.att.name.split(".")[2];
											field.kind = FVar(types.length == 1 ? types[0] : macro:Dynamic, null);
											field.access = [];
											field.doc = entry.node.desc.innerHTML;
											fields.push(field);
										}
										field.kind = FVar(TAnonymous(fields), null);
										
									default: trace(memName);
								}
							}
							
							fields.push(field);
							
						default: 
							throw "unknown entry type: " + type;
							continue;
					}
				}
			}
			
			switch (type) {
				case TPath(tp):
					var td:TypeDefinition = {
						pack : tp.pack,
						name : tp.name,
						pos : null,
						meta : [],
						params : [],
						isExtern : true,
						kind : TDClass(),
						fields : fields
					};
					
					//fool-proof, one should not extends an extern class
					td.meta.push({
						name: ":final",
						params: [],
						pos: null
					});
					
					switch(tp.name) {
						case "JQuery":
							td.kind = TDClass(null, [{
								pack: [],
								name: "ArrayAccess",
								params: [TPType(macro : js.html.Node)]
							}]);
							
							fields.push({
								name: "_static",
								doc: "Compile-time short cut to JQueryStatic.",
								access: [AInline, AStatic, APublic],
								kind: FVar(null, macro jQuery.JQueryStatic),
								pos: null,
								meta: []
							});
						case "Event":
							td.kind = TDClass({
								pack: ["js", "html"],
								name: "Event",
								params: []
							});
						default:
							//pass
					}
					
					td.meta.push({
						name: ":build",
						params: [macro jQuery.haxe.Config.build()],
						pos: null
					});
					
					out.push(td);
				default: //TODO
					trace(type);
			}
			
		}
		
		return out;
	}
	
	#if sys
	static function main():Void {
		var args = Sys.args();
		if (args.length < 2) {
			Sys.println("Arguments: api.xml outputFolder");
			return;
		}
		
		var file = args[0];
		Sys.println('Generating jQuery core extern from "${file}".');
		var apiXml = Xml.parse(File.getContent(file));
		
		var outDir = args[1];
		if (!FileSystem.exists(outDir))
			FileSystem.createDirectory(outDir);
		Sys.setCwd(outDir);
		
		var tds = new CoreExternGenerator(apiXml).generate();
		var printer = new Printer();
		for (td in tds) {
			var clsStr = "/* This file is generated, do not edit! Visit http://api.jquery.com/ for API documentation. */\n" + printer.printTypeDefinition(td);
			var packDir = td.pack.join("/");
			FileSystem.createDirectory(packDir);
			File.saveContent(packDir + "/" + td.name + ".hx", clsStr);
		}
		Sys.println("Done.");
	}
	#end
}