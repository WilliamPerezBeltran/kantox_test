# Kantox Test

This document provides the solution to the problem described in the project documentation located at docs/Technical_evaluation_Ruby. 
This readme will give us a basic understanding of the principles, patterns, and methodologies applied to solve the problem proposed 

## Project Description

The project is a shopping cart that organizes products and calculates totals by applying pricing rules. To do this, products (Product class) 
are created with a code, name, and price. Each product's data is validated upon creation, ensuring consistency and error prevention.

When a product is added to the cart using Checkout#scan, it is stored in the cart's internal list. The total is calculated with 
Checkout#total, grouping the products by code and checking if a pricing rule (PricePolicy) exists for the code. If there is a rule, 
it is executed; if not, the prices are added together. This is an important point since the code allows us to apply different strategies 
in a modular way. The documentation shows three rules implemented in rules.rb, where the shopping cart rules reside in the project. Each 
rule is associated with a product with different characteristics implemented in this file.

This architecture allows for a fairly clear flow of information, as the cart groups by code, applying the corresponding rule and calculating 
its total, allowing rules to be applied independently without affecting its composition. We can also see in the code the application of 
the solid principle, clean architecture, and pattern design.

## Stack
- ruby 3.3.0

## Architecture Explanation

The SRP assigns each class a clear function: the Product class represents products, the PricePolicy class defines pricing rules,
and the Checkout class manages the cart and calculates totals. Here, we can see the independence of each class. The OCP allows us to 
add new rules without modifying Checkout. At this point, we can see that the Checkout class is open to extension through new rules provided 
by PricePolice, without needing to modify the class. If we want to add more rules, we only need to add them to PRICING_RULES. The ISP exposes 
only the necessary methods, as we can see in the PricePolicy class, which only exposes assigned_to? and call. On the other hand, the DIP principle 
decouples the Checkout class from specific rules, depending on the abstraction of the PricePolicy class.

## SOLID Principles Explanation

The implementation of Clean Architecture can be clearly seen by separating responsibilities: product.rb defines the domain entities, 
price_policy.rb contains the business logic, checkout.rb acts as an application service coordinating products and rules, and rules.rb 
configures the pricing policies. Dependencies flow correctly: entities (Product) do not depend on Checkout or rules, while Checkout depends 
on abstractions (PricePolicy) rather than concrete implementations. Furthermore, PRICING_RULES is immutable (freeze), ensuring secure and 
consistent rules.

## Design Patterns Explanation

The design patterns that were applied explicitly and implicitly were: Strategy, which is the main pattern applied, implemented through the 
PricePolicy class, where each instance defines a different way to calculate the product price. An important part here is the connection that 
must be maintained between the Checkout class and the existing pricing rules, and the connecting bridge between the products in the cart and 
the pricing rules, which was established in the Checkout#apply_to method. Now, the concept of the Command pattern was enforced in PricePolicy 
objects as objects that encapsulate behavior. The concept of the Factory Method pattern is lightly applied when instantiating PricePolicy with 
different blocks. And finally, grouping and delegation are performed in Checkout#total, leveraging an idea similar to Composite.

## Glossary

Definitions of terms and acronyms used in the Readme:

- SRP (Single Responsibility Principle)
- OCP (Open/Closed Principle)
- LSP (Liskov Substitution Principle)
- ISP (Interface Segregation Principle)
- DIP (Dependency Inversion Principle)

## What's Included

```tree
.
├── Gemfile
├── Gemfile.lock
├── lib
│   ├── checkout.rb
│   ├── price_policy.rb
│   ├── product.rb
│   └── rules.rb
├── README.md
└── spec
    ├── checkout_spec.rb
    ├── price_policy_spec.rb
    ├── product_spec.rb
    ├── rules_spec.rb
    └── spec_helper.rb
```
## Folder Description

- lib                  -> Code where the heart of the application is hosted
- spec                 -> Code where the tests are hosted

## File Description

- checkout.rb          -> Class with two attributes: rules and elements
- price_policy.rb      -> Class with two attributes: code and calculate_rule
- product.rb           -> Struct with three attributes: code, name, and price
- rules.rb             -> Price rule set
- checkout_spec.rb     -> Code where the checkout tests are hosted
- price_policy_spec.rb -> Code where the price_policy tests are hosted
- product_spec.rb      -> Code where the product tests are hosted
- rules_spec.rb        -> Code where the rules tests are hosted

## Development Practices

This project follows best practices for code quality and maintainability:

- **RuboCop** was used to ensure consistent Ruby style and follow community conventions.  
- **TDD (Test-Driven Development)** was applied to guarantee reliable and maintainable code through **RSpec** tests.  
- **Pre-commit hooks** were configured to automatically run **RuboCop**, blocking commits that do not meet style or linting standards.  
- **GitHub Actions (RuboCop Linter)** was implemented to automate continuous integration (CI), ensuring code quality on every push and pull request.

## Author
**William Pérez**  
- [GitHub profile](https://github.com/WilliamPerezBeltran)






