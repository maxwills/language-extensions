Class {
	#name : #TaCompositionElementAutoProperty,
	#superclass : #TaCompositionElement,
	#instVars : [
		'propertyName'
	],
	#category : #'LanguageExtensions-Compositions'
}

{ #category : #'as yet unclassified' }
TaCompositionElementAutoProperty class >> for: aClass propertyName: symbol [

	^ (self for: aClass)
		  propertyName: symbol;
		  yourself
]

{ #category : #accessing }
TaCompositionElementAutoProperty >> classComposition [

	^ TaClassCompositionElementAutoProperty
		  for: innerClass class
		  propertyName: propertyName
]

{ #category : #initialization }
TaCompositionElementAutoProperty >> initialize [

	propertyName := #unnamedProperty.
	super initialize
]

{ #category : #accessing }
TaCompositionElementAutoProperty >> propertyName [

	^ propertyName
]

{ #category : #accessing }
TaCompositionElementAutoProperty >> propertyName: anObject [

	propertyName := anObject
]

{ #category : #printing }
TaCompositionElementAutoProperty >> traitCompositionExpression [

	^ '#' , propertyName , ' asAutoProperty'
]
