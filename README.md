# online_marketplace

This is a Ruby app that calculates the total price of items from an online marketplace. Given items are scanned into the checkout, and there are attached promotional rules, the total price is returned.

[![Build Status](https://travis-ci.org/DaveLawes/online_marketplace.svg?branch=master)](https://travis-ci.org/DaveLawes/online_marketplace)

## How to Use

#### How to Install

The application was built using Ruby 2.5.1 and this Ruby version is specified as part of the build.

Clone this repo to your local machine. Run `bundle install` to make sure all gemfiles (dependencies) are correctly installed.

#### How to Test

From the root of the project directory run rspec. This will run all feature and unit tests.

#### How to Run


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


