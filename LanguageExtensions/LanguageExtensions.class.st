Class {
	#name : #LanguageExtensions,
	#superclass : #Object,
	#category : #'LanguageExtensions-Core'
}

{ #category : #'as yet unclassified' }
LanguageExtensions class >> installLanguageExtensions [

	"Install patches that prevent bugs related to the extensions"
	"Call this only if using AutoProperties"
	<script>
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
	self patchIceRepository.
	Author uniqueInstance fullName: authorName
]

{ #category : #'as yet unclassified' }
LanguageExtensions class >> patchIceRepository [
	"Fixes a bug related to browsing a method that was compiled with announer disabled"

	| method originalSourceCode newSourceCode |
	method := IceRepository class
	          >> #registeredRepositoryIncludingPackage:.
	method ifNil: [ ^ self "we are in trouble" ].
	originalSourceCode := method sourceCode.

	newSourceCode := originalSourceCode
		                 copyReplaceAll: 'aPackage ifNil: [ ^ nil ].
'
		                 with: ''.
	newSourceCode := newSourceCode
		                 copyReplaceAll: '^ self registry'
		                 with: 'aPackage ifNil: [ ^ nil ].
	^ self registry'.
	IceRepository class compile: newSourceCode
]

{ #category : #'as yet unclassified' }
LanguageExtensions class >> patchTraitCompositionBuilderInstantiationIn: method [

	| source patchedSource |
	source := method sourceCode.
	patchedSource := source
		                 copyReplaceAll: #CDTraitCompositionBuilder asString
		                 with:
		                 #CDTraitCompositionBuilderAutoProperty asString.
	method methodClass compile: patchedSource
]
