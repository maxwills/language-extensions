Extension { #name : #Number }

{ #category : #'*LanguageExtensions' }
Number >> += aNumber [

	"increments self by a number"

	| senderContext node result |
	result := self + aNumber.
	senderContext := thisContext sender.
	node := senderContext method ast sourceNodeForPC:
		        senderContext pc - 1.
	(node isMessage and: [ node selector = #+= ]) ifFalse: [ ^ result ].
	node receiver isVariable ifFalse: [ ^ result ].
	senderContext
		writeVariableNamed: node receiver variable name
		value: result.
	^ result
]
