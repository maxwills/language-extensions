"
A RefTest is a test class for testing the behavior of Ref
"
Class {
	#name : #RefTest,
	#superclass : #TestCase,
	#category : #'LanguageExtensions-Tests'
}

{ #category : #tests }
RefTest >> testAsRef [

	| obj |
	obj := OrderedCollection new.
	
	[ :r |
	r value add: 1.
	self assert: obj size equals: 1.
	r << nil ] value: obj asRef.
	self assert: obj isNil
]

{ #category : #tests }
RefTest >> testLessThanLessThan [

	^ self testAsRef
]
