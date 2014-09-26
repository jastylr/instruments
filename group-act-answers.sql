 
# GET the first name, last name and email address of the user who has a user id of 2
SELECT first_name, last_name, email FROM users WHERE id = 2;

# Get a list of each user and the number of instruments that they own. Display the
# user's full nameinstruments as a single field instead of separate first and last names.
SELECT CONCAT(first_name, " ", last_name) as username, instrument_types.type, COUNT(instruments.id) FROM users
JOIN instruments ON users.id = instruments.user_id
JOIN instrument_types ON instruments.instrument_type_id = instrument_types.id
GROUP BY username;

# Get the total number of drum sets used by users
SELECT COUNT(instrument_types.id) as total FROM instruments
JOIN instrument_types ON instruments.instrument_type_id = instrument_types.id
WHERE instrument_types.type = 'Drums';

# Get the full names of all people who play piano
SELECT CONCAT(first_name, " ", last_name) as full_name FROM users
JOIN instruments ON users.id = instruments.user_id
JOIN instrument_types on instruments.instrument_type_id = instrument_types.id
WHERE instrument_types.type = "Piano"
GROUP BY full_name;

# Get the sum of the purchase price for all guitars
SELECT SUM(purchase_price) as sum FROM instruments 
JOIN instrument_types ON instruments.instrument_type_id = instrument_types.id
WHERE instrument_types.type = 'Guitar';

# Get type and sum of the purchase price for all instruments purchased between January 1, 1987 and today's date
SELECT instrument_types.type, SUM(purchase_price) as sum FROM instruments
JOIN instrument_types ON instruments.instrument_type_id = instrument_types.id
WHERE purchase_date BETWEEN '1987-01-01' AND NOW()
GROUP BY instrument_types.type;

# Get the make, model and price of each guitar
SELECT instruments.make, instruments.model, instruments.purchase_price
FROM instruments
JOIN instrument_types ON instruments.instrument_type_id = instrument_types.id
WHERE instrument_types.type = 'Guitar';

SELECT CONCAT(users.first_name, " ", users.last_name) FROM users
JOIN instruments ON users.id = instruments.user_id
JOIN instrument_types ON instruments.instrument_type_id = instrument_types.id
WHERE instrument_types.type = 'Saxophone';
