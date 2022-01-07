Class {
	#name : #LanguageExtensions,
	#superclass : #Object,
	#category : #'LanguageExtensions-Core'
}

{ #category : #'as yet unclassified' }
LanguageExtensions class >> installLanguageExtensions [

	"Install patches that prevent bugs related to the extensions"

	| authorName classToPatch1 classToPatch2 |
	authorName := Author uniqueInstance fullNamePerSe.
	Author uniqueInstance fullName: 'LanguageExtensions'.

	classToPatch1 := self class environment at:
		                 #CDAbstractClassDefinitionParser.
	classToPatch2 := self class environment at: #CDClassDefinitionParser.

	self patchTraitCompositionBuilderInstantiationIn:
		classToPatch1 >> #handleTraitUsesFromNode:.
	self patchTraitCompositionBuilderInstantiationIn:
		classToPatch2 >> #handleTraitDefinitionFromNode:.
	Author uniqueInstance fullName: authorName
]

{ #category : #'as yet unclassified' }
LanguageExtensions class >> patchTraitCompositionBuilderInstantiationIn: method [

|source patchedSource|
source := method sourceCode.
patchedSource  := source copyReplaceAll: #CDTraitCompositionBuilder asString with: #CDTraitCompositionBuilderAutoProperty asString.
method methodClass compile: patchedSource.

]
