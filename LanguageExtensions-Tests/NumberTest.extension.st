Extension { #name : #NumberTest }

{ #category : #'*LanguageExtensions-Tests' }
NumberTest >> testPlusEqualsSign [

	| a |
	a := 1.
	a += 1.
	self assert: a equals: 2
]
