Extension { #name : #Symbol }

{ #category : #'*LanguageExtensions' }
Symbol >> asAutoProperty [

	SystemAnnouncer uniqueInstance suspendAllWhile: [ 
		| t |
		t := Trait
			     named: 'TAutoProperty_' , self
			     uses: {  }
			     slots: { (#_ , self) }
			     package: ''
			     env: self class environment.
		self flag: 'getter'.
		t compile: self , ' 
^ _' , self.
		self flag: 'setter'.
		t compile: self , ': anObject 
 _' , self , ' := anObject'.

		^ TaCompositionElementAutoProperty for: t propertyName: self ]
]
