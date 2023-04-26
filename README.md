# language-extensions
A set of new language features for Pharo 9.0, 10, 11 and 12

```Smalltalk
Metacello new
    baseline: 'LanguageExtensions';
    repository: 'github://maxwills/language-extensions:main';
    load.
```

Currently adds

```Smalltalk
"I. #+= operator"
a := 1.
a += 1.
"a value is 2"

"II. #<< (unpacking operator)"
|a b|
{a . b . nil } << { 10. 20 . 30}.
"can also be used directly with method calls return"
"{a . b . nil } << anObject aMethodThatReturnsAnArrayOf3Objects"
"a value is 10, b value is 20"


"III. #asRef and #<< (assignment byRef)"
|a block|
a := 1.
block := [:r| r << 99 "we assign this value to the variable referenced by r"].
self assert: a value equals:1.
"we pass the a variable as reference"
block value: a asRef.
self assert: a value equals: 99.

"#asRef enables outgoing(or whatever they are called"
|a|
a:= ''.
MyObject myMethod: a asRef.
"a value is 'setByMyMethod'"

"This is the method"
MyObject>> #myMethod: outVar1
  outVar1 << 'setByMyMethod'.
  
"IV. #switch. A clean switch-case notation that uses cascade."
| res |
res := 1 switch
  case: 1 do: [ #one ];
  case: 2 do: [ #two ];
  defaultCase: #three.
self assert: res = #one.

"use Valuables in cases"
res := true switch
  case: [ 1 < 0 ] do: [ #one ];
  case: [ 1 < 2 ] do: [ #two ];
  defaultCase: #three.
self assert: res = #two.
"cases expressions and do are evaluated one after the other until finding the matching case.
The switch condition (receiver of the #switch method call) is evaluated on every case, until finding the matching one."
```

## Obsolete info (Ignore from this point and forth)

Stored here as a reminder.

If you manually load the package (Without using the baseline), the you will need to install the extensions executing:

```Smalltalk
LanguageExtensions installLanguageExtensions
```

It will override some methods that will allow the AutoProperty traits to work.


### Known issues:

To be Fixed asap: The current code compilation to generate the traits does dont includes package info, and browsing code will throw an exeception.
