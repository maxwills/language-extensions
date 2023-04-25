Extension { #name : #Object }

{ #category : #'*LanguageExtensions' }
Object >> asRef [

	| ctx var messageNode |
	ctx := thisContext sender.
	messageNode := ctx method sourceNodeForPC: ctx pc - 1.
	var := messageNode receiver. "this is a node"
	var isVariable ifFalse: [
		^ self error: '#asRef can only be used on writable variables' ].
	var := var variable. "This is a variable"
	var isSelfVariable ifTrue: [
		^ self error: '#asRef can only be used on writable variables' ].
	^ Ref new
		  var: var;
		  context: ctx;
		  yourself
]

{ #category : #'*LanguageExtensions' }
Object >> switch [

	| switchBlock found foundVal |
	found := false.
	foundVal := nil.
	^ switchBlock := [ :caseBlock :doBlock | 
	                 found
		                 ifTrue: [ foundVal ]
		                 ifFalse: [ 
			                 | caseVal |
			                 caseVal := caseBlock value.
			                 (#performDefaultCase == caseVal or: [ 
				                  self value = caseVal ])
				                 ifTrue: [ 
					                 found := true.
					                 foundVal := doBlock value ]
				                 ifFalse: [ switchBlock ] ] ]
]
