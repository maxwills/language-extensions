Extension { #name : #Context }

{ #category : #'*LanguageExtensions' }
Context >> readAnyVariableNamed: aName [
	(self method argumentNames includes:aName) ifTrue: [^ self readArgumentNamed: aName  ].
	^ (self lookupVar: aName) readInContext: self
]

{ #category : #'*LanguageExtensions' }
Context >> readArgumentNamed: aSymbol [

	| names |
	names := self method argumentNames.
	(1 to: self numArgs) do: [ :i |
		(aSymbol = (names at: i)) ifTrue: [ ^ self tempAt: i ] ].
	VariableNotDeclared new signal
]
