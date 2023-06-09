Extension { #name : #String }

{ #category : #'*LanguageExtensions' }
String >> autoFormat [

	| ctx |
	ctx := thisContext sender.

	^ self species new: self size streamContents: [ :result |
		  | stream compiler |
		  compiler := OpalCompiler new.
		  stream := self readStream.
		  [ stream atEnd ] whileFalse: [
			  | currentChar |
			  (currentChar := stream next) == ${
				  ifTrue: [
					  | expression val |
					  expression := stream upTo: $}.
					  val := [
					         (compiler
						          source: expression;
						          context: ctx) evaluate ] onErrorDo: [ expression ].
					  result nextPutAll: val asString ]
				  ifFalse: [
					  currentChar == $\
						  ifTrue: [
						  stream atEnd ifFalse: [ result nextPut: stream next ] ]
						  ifFalse: [ result nextPut: currentChar ] ] ] ]
]