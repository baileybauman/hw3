Feature: manipulate movies

  As a movie buff
  So that I can enter and see movies
  I want to include and search on movie information for movies I enter

Background: movies in database

  Given the following movies exist:
  | title        | rating | director     | release_date |
  | Star Wars    | PG     | George Lucas |   1977-05-25 |
  | Blade Runner | PG     | Ridley Scott |   1982-06-25 |
  | Alien        | R      |              |   1979-05-25 |
  | THX-1138     | R      | George Lucas |   1971-03-11 |

Scenario: add movie that doesn't already exist
  Given I am on the home page
  When  I follow "Add new movie"
  And   I fill in "Title" with "Gladiator"
  And   I fill in "Director" with "Ridley Scott"
  And   I press "Save Changes"
  And   I should see "Gladiator was successfully created."

Scenario: delete movie
  Given I am on the details page for "Alien"
  And   I press "Delete"
  And   I should see "Movie 'Alien' deleted."

Scenario: restrict ratings
  Given I am on the home page
  When  I uncheck "ratings_PG"
  And   I press "Refresh"
  And   I should not see "Star Wars"

Scenario: sort by title
  Given I am on the home page
  When  I follow "Movie Title"
  Then   I should see "Alien" before "THX-1138"