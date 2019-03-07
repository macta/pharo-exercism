"
# Strain

Implement the `keep` and `discard` operation on collections. Given a collection
and a predicate on the collection's elements, `keep` returns a new collection
containing those elements where the predicate is true, while `discard` returns
a new collection containing those elements where the predicate is false.

For example, given the collection of numbers:

- 1, 2, 3, 4, 5

And the predicate:

- is the number even?

Then your keep operation should produce:

- 2, 4

While your discard operation should produce:

- 1, 3, 5

Note that the union of keep and discard is all the elements.

## Restrictions

Keep your hands off the select/reject/whatchamacallit functionality
provided by your standard library!  Solve this one yourself using other
basic tools instead.

## Hint

This one calls for an understanding of how to use extension methods so that your methods can live on a collection class but be owned by your Strain class.

"
Class {
	#name : #StrainTest,
	#superclass : #ExercismTest,
	#category : #'Exercism-Strain'
}

{ #category : #config }
StrainTest class >> uuid [
	"Answer a unique id for this exercise"
	^'7c1b1ebe-4a3f-0d00-bb11-67a0071d6982'
]

{ #category : #config }
StrainTest class >> version [
	"Generated from specification: 28 February 2019"
	^'1.0.0'
]

{ #category : #tests }
StrainTest >> pragmas [ 
	"self new pragmas"
	"Pragma allNamed: #exercism: in: Collection >>> #()"
	
	^(Pragma allNamed: #exercism: in: Collection) select: [ :p |
		p arguments first = self class name asSymbol ]
]

{ #category : #tests }
StrainTest >> test01_KeepEmpty [
    self assert: (#() keep: [ :e| true ]) equals: #()
]

{ #category : #tests }
StrainTest >> test02_KeepEverything [
    
	self assert: (#(1 2 3) keep: [ :e| e < 10 ]) equals: #(1 2 3)
]

{ #category : #tests }
StrainTest >> test03_KeepOdd [
   
	self assert: (#(1 2 3) keep: [ :e| e odd ]) equals: #(1 3)
]

{ #category : #tests }
StrainTest >> test04_KeepEven [
   
	self assert: (#(1 2 3 4 5) keep: [ :e| e even ]) equals: #(2 4)
]

{ #category : #tests }
StrainTest >> test05_KeepVowelsInString [
	| result |
	
	result := Character alphabet keep: [ :char | char isVowel ].
	self assert: result equals: 'aeiou'
]

{ #category : #tests }
StrainTest >> test06_DiscardEmpty [
    self assert: (#() discard: [ :e| true ]) equals: #()
]

{ #category : #tests }
StrainTest >> test07_DiscardEverything [
    
	self assert: (#(1 2 3) discard: [ :e| e < 10 ]) equals: #()
]

{ #category : #tests }
StrainTest >> test08_DiscardBeginsWith [
	| words result |
	
	words := #('apple' 'zebra' 'banana' 'zombies' 'cherimoya' 'zelot').
	result := words discard: [ :word | word beginsWith: 'z' ].
	
	self assert: result equals: #('apple' 'banana' 'cherimoya')
]

{ #category : #tests }
StrainTest >> test09_DiscardEndsWith [
	| words result |
	
	words := #('dough' 'cash' 'plough' 'though' 'through' 'enough').
	result := words discard: [ :word | word endsWith: 'ough' ].
	
	self assert: result equals: #('cash')
]

{ #category : #tests }
StrainTest >> test10_KeepAndDiscardIsEverything [
	| source result |
	
	source := #(1 2 3 4 5) asSet.
	
	result := (source keep: [ :e | e odd ])
		, (source discard: [ :e | e odd ]).
		
	self assert: result equals: source
]
