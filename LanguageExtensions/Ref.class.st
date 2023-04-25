Class {
	#name : #Ref,
	#superclass : #Object,
	#instVars : [
		'weakContextAndVar'
	],
	#category : #LanguageExtensions
}

{ #category : #streaming }
Ref >> << anObject [

	(weakContextAndVar at: 2)
		write: anObject
		inContext: (weakContextAndVar at: 1)
]

{ #category : #accessing }
Ref >> context: anObject [

	weakContextAndVar at: 1 put: anObject
]

{ #category : #accessing }
Ref >> deRef [

	^ self value
]

{ #category : #initialization }
Ref >> initialize [

	weakContextAndVar := WeakArray new: 2
]

{ #category : #evaluating }
Ref >> value [

	^ (weakContextAndVar at: 2) readInContext: (weakContextAndVar at: 1)
]

{ #category : #accessing }
Ref >> var: anObject [

	weakContextAndVar at: 2 put: anObject
]
