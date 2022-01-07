Class {
	#name : #TaClassCompositionElementAutoProperty,
	#superclass : #TaCompositionElementAutoProperty,
	#category : #'LanguageExtensions-Compositions'
}

{ #category : #accessing }
TaClassCompositionElementAutoProperty >> methods [
	"As I am representing a ClassTrait I have to filter the methods that are in all the class traits"
	| innerClassLocalMethods |
	innerClassLocalMethods := innerClass localMethods collect: [:each | each selector].
	^ super methods reject: [ :e | (innerClassLocalMethods includes: e selector) not and: [TraitedClass selectors anySatisfy: [ :x | x = e selector ]] ]
]

{ #category : #accessing }
TaClassCompositionElementAutoProperty >> selectors [
	"As I am representing a ClassTrait I have to filter the methods that are in all the class traits"

	| innerClassLocalMethods |
	innerClassLocalMethods := innerClass localMethods collect: [:each | each selector].
	^ super selectors
		reject: [ :e | 
			(innerClassLocalMethods includes: e) not
				and: [ TraitedClass selectors includes: e ] ]
]

{ #category : #accessing }
TaClassCompositionElementAutoProperty >> slots [
	^ innerClass allSlots
		reject: [ :e | 
			(Trait slots , 
			TraitedClass allSlots) anySatisfy: [ :x | x name = e name ] ]
		
]

{ #category : #printing }
TaClassCompositionElementAutoProperty >> traitCompositionExpression [

	^ super traitCompositionExpression , ' classTrait'
]
