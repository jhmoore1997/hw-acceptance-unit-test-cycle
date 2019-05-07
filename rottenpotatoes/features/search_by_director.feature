Feature: search by director

  As a movie watcher
  So that I can find movies from a specific director that I know
  I want to be able to search movies made just by that director

Background: movies in database

  Given the following movies exist:
  | title  | rating | director | release_date |
  | US  | PG-13 | Jordan Peele | 2019-03-25 |
  | Gone With The Wind | PG | George Lucas | 1982-06-25 |
  | Rocky | R | Michael Lewis | 1979-05-25 |
  | Star Wars | PG-13 |  |   1971-03-11 |

Scenario: adding director to already added movie
  When I go to the edit page for "Star Wars"
  And  I fill in "Director" with "George Lucas"
  And  I press "Update Movie Info"
  Then the director of "Star Wars" should be "George Lucas"

Scenario: find movie(s) with same director
  Given I am on the details page for "Star Wars"
  When  I follow "Find Movies With Same Director"
  Then  I should be on the Similar Movies page for "Star Wars"
  And   I should see "Gone With The Wind"
  But   I should not see "US"

Scenario: trying to find similar movies without director
  Given I am on the details page for "Star Wars"
  Then  I should not see "George Lucas"
  When  I follow "Find Movies With Same Director"
  Then  I should be on the home page
  And   I should see "'Star Wars' has no director info"