"
As Characters are an object, we can ask them if they are a letter, and compare on that.
"
Class {
	#name : #Pangram,
	#superclass : #Object,
	#category : #'Exercism-Pangram'
}

{ #category : #exercism }
Pangram >> isPangramSentence: aString [ 
	| testString |
	testString := aString asLowercase onlyLetters.
	^ testString asSet = Character alphabet asSet
	
]
