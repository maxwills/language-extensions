Extension { #name : #Object }

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
