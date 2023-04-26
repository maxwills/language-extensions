Class {
	#name : #BaselineOfLanguageExtensions,
	#superclass : #BaselineOf,
	#category : #BaselineOfLanguageExtensions
}

{ #category : #baselines }
BaselineOfLanguageExtensions >> baseline: spec [

	<baseline>
	spec for: #common do: [ 
		spec package: 'LanguageExtensions'.
		spec
			package: 'LanguageExtensions-Tests'
			with: [ spec requires: #( 'LanguageExtensions' ) ] ].
	spec postLoadDoIt: #postload:package:
]

{ #category : #actions }
BaselineOfLanguageExtensions >> postload: loader package: packageSpec [
	" Old code. Required for using autoproperties which are discontinued."

	"(self class environment at: #LanguageExtensions)
		installLanguageExtensions"

	
]
