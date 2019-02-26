"
# Book Store

To try and encourage more sales of different books from a popular 5 book
series, a bookshop has decided to offer discounts on multiple book purchases.

One copy of any of the five books costs $8.

If, however, you buy two different books, you get a 5%
discount on those two books.

If you buy 3 different books, you get a 10% discount.

If you buy 4 different books, you get a 20% discount.

If you buy all 5, you get a 25% discount.

Note: that if you buy four books, of which 3 are
different titles, you get a 10% discount on the 3 that
form part of a set, but the fourth book still costs $8.

Your mission is to write a piece of code to calculate the
price of any conceivable shopping basket (containing only
books of the same series), giving as big a discount as
possible.

For example, how much does this basket of books cost?

- 2 copies of the first book
- 2 copies of the second book
- 2 copies of the third book
- 1 copy of the fourth book
- 1 copy of the fifth book

One way of grouping these 8 books is:

- 1 group of 5 --> 25% discount (1st,2nd,3rd,4th,5th)
- +1 group of 3 --> 10% discount (1st,2nd,3rd)

This would give a total of:

- 5 books at a 25% discount
- +3 books at a 10% discount

Resulting in:

- 5 x (8 - 2.00) == 5 x 6.00 == $30.00
- +3 x (8 - 0.80) == 3 x 7.20 == $21.60

For a total of $51.60

However, a different way to group these 8 books is:

- 1 group of 4 books --> 20% discount  (1st,2nd,3rd,4th)
- +1 group of 4 books --> 20% discount  (1st,2nd,3rd,5th)

This would give a total of:

- 4 books at a 20% discount
- +4 books at a 20% discount

Resulting in:

- 4 x (8 - 1.60) == 4 x 6.40 == $25.60
- +4 x (8 - 1.60) == 4 x 6.40 == $25.60

For a total of $51.20

And $51.20 is the price with the biggest discount.

## Hint

TBD

"
Class {
	#name : #BookStoreTest,
	#superclass : #ExercismTest,
	#instVars : [
		'bookStoreCalculator'
	],
	#category : #'ExercismWIP-BookStore'
}

{ #category : #config }
BookStoreTest class >> uuid [
	"Answer a unique id for this exercise"
	^'af88dcd9-2b3f-0d00-a2b4-cd8409f0590c'
]

{ #category : #config }
BookStoreTest class >> version [
	"Generated from specification: 26 February 2019"
	^'1.4.0'
]

{ #category : #setup }
BookStoreTest >> setUp [
	bookStoreCalculator := BookStore new
]

{ #category : #test }
BookStoreTest >> testReturnTheTotalBasketPriceAfterApplyingTheBestDiscountEmptyBasket [
	| result |

	result := bookStoreCalculator totalBasket: #() .
	self assert: result equals: 0
]

{ #category : #test }
BookStoreTest >> testReturnTheTotalBasketPriceAfterApplyingTheBestDiscountFiveDifferentBooks [
	| result |

	result := bookStoreCalculator totalBasket: #(1 2 3 4 5 ) .
	self assert: result equals: 3000
]

{ #category : #test }
BookStoreTest >> testReturnTheTotalBasketPriceAfterApplyingTheBestDiscountFourDifferentBooks [
	| result |

	result := bookStoreCalculator totalBasket: #(1 2 3 4 ) .
	self assert: result equals: 2560
]

{ #category : #test }
BookStoreTest >> testReturnTheTotalBasketPriceAfterApplyingTheBestDiscountFourGroupsOfFourAreCheaperThanTwoGroupsEachOfFiveAndThree [
	| result |

	result := bookStoreCalculator totalBasket: #(1 1 2 2 3 3 4 5 1 1 2 2 3 3 4 5 ) .
	self assert: result equals: 10240
]

{ #category : #test }
BookStoreTest >> testReturnTheTotalBasketPriceAfterApplyingTheBestDiscountGroupOfFourPlusGroupOfTwoIsCheaperThanTwoGroupsOfThree [
	| result |

	result := bookStoreCalculator totalBasket: #(1 1 2 2 3 4 ) .
	self assert: result equals: 4080
]

{ #category : #test }
BookStoreTest >> testReturnTheTotalBasketPriceAfterApplyingTheBestDiscountOnlyASingleBook [
	| result |

	result := bookStoreCalculator totalBasket: #(1 ) .
	self assert: result equals: 800
]

{ #category : #test }
BookStoreTest >> testReturnTheTotalBasketPriceAfterApplyingTheBestDiscountThreeCopiesOfFirstBookAnd2EachOfRemaining [
	| result |

	result := bookStoreCalculator totalBasket: #(1 1 2 2 3 3 4 4 5 5 1 ) .
	self assert: result equals: 6800
]

{ #category : #test }
BookStoreTest >> testReturnTheTotalBasketPriceAfterApplyingTheBestDiscountThreeDifferentBooks [
	| result |

	result := bookStoreCalculator totalBasket: #(1 2 3 ) .
	self assert: result equals: 2160
]

{ #category : #test }
BookStoreTest >> testReturnTheTotalBasketPriceAfterApplyingTheBestDiscountThreeEachOfFirst2BooksAnd2EachOfRemainingBooks [
	| result |

	result := bookStoreCalculator totalBasket: #(1 1 2 2 3 3 4 4 5 5 1 2 ) .
	self assert: result equals: 7520
]

{ #category : #test }
BookStoreTest >> testReturnTheTotalBasketPriceAfterApplyingTheBestDiscountTwoCopiesOfEachBook [
	| result |

	result := bookStoreCalculator totalBasket: #(1 1 2 2 3 3 4 4 5 5 ) .
	self assert: result equals: 6000
]

{ #category : #test }
BookStoreTest >> testReturnTheTotalBasketPriceAfterApplyingTheBestDiscountTwoDifferentBooks [
	| result |

	result := bookStoreCalculator totalBasket: #(1 2 ) .
	self assert: result equals: 1520
]

{ #category : #test }
BookStoreTest >> testReturnTheTotalBasketPriceAfterApplyingTheBestDiscountTwoEachOfFirst4BooksAnd1CopyEachOfRest [
	| result |

	result := bookStoreCalculator totalBasket: #(1 1 2 2 3 3 4 4 5 ) .
	self assert: result equals: 5560
]

{ #category : #test }
BookStoreTest >> testReturnTheTotalBasketPriceAfterApplyingTheBestDiscountTwoGroupsOfFourIsCheaperThanGroupOfFivePlusGroupOfThree [
	| result |

	result := bookStoreCalculator totalBasket: #(1 1 2 2 3 3 4 5 ) .
	self assert: result equals: 5120
]

{ #category : #test }
BookStoreTest >> testReturnTheTotalBasketPriceAfterApplyingTheBestDiscountTwoGroupsOfFourIsCheaperThanGroupsOfFiveAndThree [
	| result |

	result := bookStoreCalculator totalBasket: #(1 1 2 3 4 4 5 5 ) .
	self assert: result equals: 5120
]

{ #category : #test }
BookStoreTest >> testReturnTheTotalBasketPriceAfterApplyingTheBestDiscountTwoOfTheSameBook [
	| result |

	result := bookStoreCalculator totalBasket: #(2 2 ) .
	self assert: result equals: 1600
]