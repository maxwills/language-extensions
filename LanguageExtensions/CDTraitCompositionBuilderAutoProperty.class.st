Class {
	#name : #CDTraitCompositionBuilderAutoProperty,
	#superclass : #CDTraitCompositionBuilder,
	#category : #'LanguageExtensions-Model'
}

{ #category : #testing }
CDTraitCompositionBuilderAutoProperty >> isAutoPropertyDeclarationMessageNode: aRBMessageNode [

	^ aRBMessageNode receiver isLiteralNode and: [ 
		  aRBMessageNode selector = #asAutoProperty ]
]

{ #category : #visiting }
CDTraitCompositionBuilderAutoProperty >> visitMessageNode: aRBMessageNode [

	"Overrides the base method so it can support AutoProperty expression messages"

	| receiver traitCompNode |
	(self isAutoPropertyDeclarationMessageNode: aRBMessageNode) ifFalse: [ 
		^ super visitMessageNode: aRBMessageNode ].

	receiver := aRBMessageNode receiver acceptVisitor: self.

	traitCompNode := CDTraitNode new
		                 originalNode: aRBMessageNode;
		                 name: aRBMessageNode asString;
		                 yourself.
	^ traitCompNode
]
