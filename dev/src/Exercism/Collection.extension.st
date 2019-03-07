Extension { #name : #Collection }

{ #category : #'*Exercism' }
Collection >> discard: aBlockClosure [
	<exercism: #StrainTest>
	
	^ self keep: [ :item | (aBlockClosure value: item) not ]
]

{ #category : #'*Exercism' }
Collection >> keep: aBlockClosure [
	<exercism: #StrainTest>
	
	| result |
	result := OrderedCollection new.
	self
		do: [ :item | 
			(aBlockClosure value: item)
				ifTrue: [ result add: item ] ].
			
	^ result as: self species
]
