# online_marketplace

[![Build Status](https://travis-ci.org/DaveLawes/online_marketplace.svg?branch=master)](https://travis-ci.org/DaveLawes/online_marketplace)

This is a Ruby app that calculates the total price of items from an online marketplace. Given items are scanned into the checkout the total price is returned. If any promotional rules are available, these are also applied before returning the total.

The app has 100% test coverage and no linter offenses.

<img src="/public/coverage.png">
<img src="/public/linter.png">

## How to Use

#### How to Install

The application was built using Ruby 2.5.1 and this Ruby version is specified as part of the build.

Clone this repo to your local machine. Run `bundle install` to make sure all gemfiles (dependencies) are correctly installed.

#### How to Test

From the root of the project directory run `rspec`. This will run all feature and unit tests.

#### How to Run

The app can be run from a REPL, I chose irb. Below describes the steps to run, and the expected output, from within irb.

- Require all files
<img src="/public/require_files.png">
          
- Define the items available on the marketplace
<img src="/public/define_items.png">

- Define the promotional rules. In an attempt to make my design flexible to changing promotions, the rules are defined as an object that takes 4 parameters:
1. The total amount the user has to spend before a discount is applied
2. The percentage discount to be applied (expressed as a decimal)
3. A hash containing keys = product_code, values = quantity in basket before unit cost changes
4. A hash containing keys = product_code, values = new unit price
<img src="/public/define_rules.png">
     
- Define the items you want to scan and request the total
<img src="/public/checkout.png">

## User Stories

From the requirements I generated the following user stories:

```
As an online marketplace
So I can give the correct price to my customers
I want my checkout to calculate the total price of their basket

As an online marketplace
So I can provide offers to my customers
I want my checkout to use promotional rules when calculating the total price

As an online marketplace
So I can provide the best offers to my customers
I want my promotional rules to be easily changed
```

## Domain Model

```
╔════════════╗  
║             ║ Takes promotional_rules as an argument upon instantiation
║  Checkout   ║ Scans items (adds item to basket)    
║             ║ Calcualtes total
╚════════════╝
       |
       |
       |
       |                (Class)
       |            ╔════════════╗
       |            ║             ║ Calcualtes discounted unit prices
       |------------║ Promotional ║ Calcualtes discounted total price
       |            ║    Rules    ║ 
       |            ╚════════════╝
       |                   
       |                   
       |                (Class)              
       |            ╔════════════╗     
       |            ║             ║ Has product code 
       |------------║    Item     ║ Has unit price
                    ║             ║ Has name   
                    ╚════════════╝ 
                                         
```

## Design Process

The following describes my steps when creating the solution:

- Read the requirements and ensure I have understood them
- Create user stories for core requirements
- Create a domain model (having thought about what classes and architecture I want)
- Setup my project (github repo, TravisCI, rubocop, simplecov)
- Follow a red-green-refactor flow (starting with a feature test for my first user story)
- If edge cases are identified when working: add these as features/user stories to be completed after all core user stories have been satisfied
- When design is finished: update documentation

## Areas of Improvement

I tried to make my design easy to change by specifying the rules upon instantiation of the 'PromotionalRules' class. Perhaps this could be improved to account for an increase in discount percentage for greater total values (currently there is just one threshold for which a discount is applied).

The state of my items are defined within objects of the Item class. I think the state of the items would be better saved within a database. It feels a bit clunky when setting up the app in irb (having to define each item...), saving the items in a database would make the user interaction with the app a little easier.
