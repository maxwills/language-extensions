Extension { #name : #BlockClosure }

{ #category : #'*LanguageExtensions' }
BlockClosure >> case: caseBlock do: doBlock [

	^ self value: caseBlock value: doBlock
]

{ #category : #'*LanguageExtensions' }
BlockClosure >> defaultCase: aValuable [

	"used for switch case do"

	^ self value: #performDefaultCase value: aValuable
]
