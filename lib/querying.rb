def selects_guests_names_from_guests_for_any_episode
"SELECT DISTINCT guests.name
FROM guests
INNER JOIN show_guests
ON guests.id = show_guests.guests_id
INNER JOIN shows
ON shows.id = show_guests.shows_id
WHERE shows.show = ?;"
end

def selects_guests_occupations_which_were_most_popular
"SELECT guests.occupation 
FROM guests 
GROUP BY occupation
ORDER BY COUNT(occupation) DESC LIMIT 1;"
end

def selects_guests_names_which_had_the_most_appearances
"SELECT guests.name 
FROM guests 
INNER JOIN show_guests
ON guests.id = show_guests.guests_id
GROUP BY name ORDER BY COUNT(name) DESC LIMIT 1;"
end

def selects_the_average_number_of_guests_per_year_for_the_years_listed
"SELECT COUNT(show_guests.guests_id) / COUNT(DISTINCT shows.year)
FROM show_guests
INNER JOIN shows
ON show_guests.shows_id = shows.id;"
end

def selects_guests_names_for_a_given_occupation_that_match
"SELECT DISTINCT guests.name
FROM guests
WHERE occupation = ?;"
end