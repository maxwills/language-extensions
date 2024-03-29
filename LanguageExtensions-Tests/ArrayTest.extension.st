Extension { #name : #ArrayTest }

{ #category : #'*LanguageExtensions-Tests' }
ArrayTest >> returnTestSequenceOfLengh: n [

	^ (1 to: n)
]

{ #category : #'*LanguageExtensions-Tests' }
ArrayTest >> testLessThanLessThan [

	"Test the unpacking operator"

	| a b c |
	{ a . b . c } << { 1. 2. 3 }.
	self assert: a equals: 1.
	self assert: b equals: 2.
	self assert: c equals: 3.
	a := nil.
	b := nil.
	c := nil.

	{ a . nil. c } << { 1. 2. 3 }.
	self assert: a equals: 1.
	self assert: b isNil.
	self assert: c equals: 3.

	{ a . b . c } << { nil. nil. nil }.
	self assert: a isNil.
	self assert: b isNil.
	self assert: c isNil.
	
   "with methods".
   { a . b . c } << (self returnTestSequenceOfLengh: 3).
	self assert: a equals: 1.
	self assert: b equals: 2.
	self assert: c equals: 3.
	
   "Number of arguments should match"
	self should: [ { a . b . c } << { nil. nil. nil .nil}. ] raise: Exception
]
