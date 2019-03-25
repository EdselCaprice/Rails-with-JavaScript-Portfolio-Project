# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship - User has_many Destinations
- [x] Include at least one belongs_to relationship - Destination belongs_to User
- [x] Include at least two has_many through relationships - User has_many Experiences through Destinations; Experiences has_many Users through destination
- [x] Include at least one many-to-many relationship - User has_many Experiences through Destinations; Experiences has_many Users through destination
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user - Location must be submitted in the Destinations table
- [x] Include reasonable validations for simple model objects (User, Destination, Experience)
- [x] Include a class level ActiveRecord scope method ( Destination.locations URL: /users/:id)
- [x] Include signup (how e.g. Devise)
- [x] Include login (how e.g. Devise)
- [x] Include logout (how e.g. Devise)
- [x] Include third party signup/login (Github - OmniAuth)
- [x] Include nested resource show or index (/users/23/destinations/37)
- [x] Include nested resource "new" form (/users/23/destinations/37/experiences/new)
- [x] Include form display of validation errors (form URL /users/23/destinations/new)

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
