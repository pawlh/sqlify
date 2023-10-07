DROP TABLE IF EXISTS Team;
CREATE TABLE Team
(
    id     INTEGER PRIMARY KEY AUTOINCREMENT,
    name   varchar(40),
    city   varchar(40),
    mascot varchar(40),
    color  varchar(40)
);

DROP TABLE IF EXISTS Game;
CREATE TABLE Game
(
	id INTEGER PRIMARY KEY AUTOINCREMENT,
    homeTeamId INTEGER,
    awayTeamId INTEGER,
    homeTeamScore INT,
    awayTeamScore INT,
    overtime      BOOLEAN,
    FOREIGN KEY (homeTeamId) REFERENCES Team (id)
        ON DELETE SET NULL
    FOREIGN KEY (awayTeamId) REFERENCES Team (id)
        ON DELETE SET NULL
);

DROP TABLE IF EXISTS Player;
CREATE TABLE Player
(
    id       INTEGER PRIMARY KEY AUTOINCREMENT,
    name     varchar(40) NOT NULL,
    teamId   INT,
    position varchar(30) NOT NULL,
    number   INT,
    FOREIGN KEY (teamId) REFERENCES Team (id)
        ON DELETE SET NULL
);

DROP TABLE IF EXISTS Coach;
CREATE TABLE Coach
(
    id     INTEGER PRIMARY KEY AUTOINCREMENT,
    name   varchar(40) NOT NULL,
    teamId INT,
    FOREIGN KEY (teamId) REFERENCES Team (id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

DROP TABLE IF EXISTS Stadium;
CREATE TABLE Stadium
(
    id       INTEGER PRIMARY KEY AUTOINCREMENT,
    teamId   INT,
    name     varchar(40) NOT NULL,
    capacity INT         NOT NULL,
    FOREIGN KEY (teamId) REFERENCES Team (id)
        ON UPDATE CASCADE
        ON DELETE SET NULL
);


-- TEAMS ---
INSERT INTO Team (name, city, mascot, color)
VALUES ('Buffalo Bills', 'Buffalo', 'Bills', 'Blue, Red, White'),
       ('Miami Dolphins', 'Miami', 'Dolphins', 'Aqua, Orange'),
       ('New England Patriots', 'Foxborough', 'Patriots', 'Navy, Silver, Red, White'),
       ('New York Jets', 'New York', 'Jets', 'Green, White'),
       ('Baltimore Ravens', 'Baltimore', 'Ravens', 'Purple, Black, Gold'),
       ('Cincinnati Bengals', 'Cincinnati', 'Bengals', 'Orange, Black, White'),
       ('Cleveland Browns', 'Cleveland', 'Browns', 'Orange, Brown, White'),
       ('Pittsburgh Steelers', 'Pittsburgh', 'Steelers', 'Black, Gold'),
       ('Houston Texans', 'Houston', 'Texans', 'Navy, Red, White'),
       ('Indianapolis Colts', 'Indianapolis', 'Colts', 'Royal Blue, White'),
       ('Jacksonville Jaguars', 'Jacksonville', 'Jaguars', 'Teal, Black, Gold'),
       ('Tennessee Titans', 'Nashville', 'Titans', 'Navy, Titans Blue, Red, Silver'),
       ('Denver Broncos', 'Denver', 'Broncos', 'Orange, Navy, White'),
       ('Kansas City Chiefs', 'Kansas City', 'Chiefs', 'Red, Gold'),
       ('Las Vegas Raiders', 'Las Vegas', 'Raiders', 'Black, Silver'),
       ('Los Angeles Chargers', 'Los Angeles', 'Chargers', 'Powder Blue, Gold, Navy'),
       ('Dallas Cowboys', 'Dallas', 'Cowboys', 'Navy, Silver, White'),
       ('New York Giants', 'East Rutherford', 'Giants', 'Blue, Red, White'),
       ('Philadelphia Eagles', 'Philadelphia', 'Eagles', 'Midnight Green, Black, Silver, White'),
       ('Washington Football Team', 'Washington, D.C.', 'Football Team', 'Burgundy, Gold'),
       ('Chicago Bears', 'Chicago', 'Bears', 'Navy, Orange, White'),
       ('Detroit Lions', 'Detroit', 'Lions', 'Blue, Silver'),
       ('Green Bay Packers', 'Green Bay', 'Packers', 'Green, Gold'),
       ('Minnesota Vikings', 'Minneapolis', 'Vikings', 'Purple, Gold, White'),
       ('Atlanta Falcons', 'Atlanta', 'Falcons', 'Red, Black, White'),
       ('Carolina Panthers', 'Charlotte', 'Panthers', 'Black, Panther Blue, Silver'),
       ('New Orleans Saints', 'New Orleans', 'Saints', 'Black, Gold'),
       ('Tampa Bay Buccaneers', 'Tampa Bay', 'Buccaneers', 'Red, Pewter, Black, Orange'),
       ('Arizona Cardinals', 'Glendale', 'Cardinals', 'Red, Black, White'),
       ('Los Angeles Rams', 'Los Angeles', 'Rams', 'Royal Blue, Gold'),
       ('San Francisco 49ers', 'Santa Clara', '49ers', 'Scarlet, Gold'),
       ('Seattle Seahawks', 'Seattle', 'Seahawks', 'Navy, Action Green, Wolf Grey');


INSERT
	INTO
	Coach (name,
	teamId)
VALUES ('Bill Belichick',
1),
('Andy Reid',
2),
('Sean McVay',
3);
('Mike Tomlin', 4),
('John Harbaugh', 5),
('Sean Payton', 6),
('Kyle Shanahan', 7),
('Pete Carroll', 8),
('Matt LaFleur', 9),
('Bruce Arians', 10),
('Mike McCarthy', 11),
('Frank Reich', 12),
('Brian Flores', 13),
('Mike Vrabel', 14),
('Ron Rivera', 15),
('Kliff Kingsbury', 16),
('Zac Taylor', 17),
('Jon Gruden', 18),
('Vic Fangio', 19),
('Arthur Smith', 20),
('Robert Saleh', 21),
('Urban Meyer', 22),
('Nick Sirianni', 23),
('Dan Campbell', 24),
('David Culley', 25),
('Matt Nagy', 26),
('Joe Judge', 27),
('Brandon Staley', 28),
('Mike Zimmer', 29),
('Sean McDermott', 30),
('Kevin Stefanski', 31),
('Matt Rhule', 32),
   ('Dan Campbell', 24),
   ('David Culley', 25),
   ('Matt Nagy', 26),
   ('Joe Judge', 27),
   ('Brandon Staley', 28),
   ('Mike Zimmer', 29),
   ('Sean McDermott', 30),
   ('Kevin Stefanski', 31),
   ('Matt Rhule', 32);

INSERT INTO Stadium (teamId, name, capacity)
VALUES (1, 'Gillette Stadium', 65656),
       (2, 'Arrowhead Stadium', 76416),
       (3, 'SoFi Stadium', 70240),
       (4, 'Heinz Field', 68400),
       (5, 'M&T Bank Stadium', 71008),
       (6, 'Caesars Superdome', 73208),
       (7, "Levi's Stadium", 68500),
      (8, 'Lumen Field', 68000), (9, 'Lambeau Field', 81441), (10, 'Raymond James Stadium', 65618), (11, 'AT&T Stadium', 80000), (12, 'Lucas Oil Stadium', 67000), (13, 'Hard Rock Stadium', 64767), (14, 'Nissan Stadium', 69143), (15, 'FedExField', 82000), (16, 'State Farm Stadium', 63400), (17, 'Paul Brown Stadium', 65515), (18, 'Allegiant Stadium', 65000), (19, 'Empower Field at Mile High', 76125), (20, 'Mercedes-Benz Stadium', 71000), (21, 'MetLife Stadium', 82500), (22, 'TIAA Bank Field', 67124), (23, 'Lincoln Financial Field', 69029), (24, 'Ford Field', 65000), (25, 'NRG Stadium', 72220), (26, 'Soldier Field', 61500), (27, 'MetLife Stadium', 82500), (28, 'Dignity Health Sports Park', 27000), (29, 'U.S. Bank Stadium', 66655), (30, 'Highmark Stadium', 55000), (31, 'FirstEnergy Stadium', 67895), (32, 'Bank of America Stadium', 75523);


INSERT INTO Player (name, teamId, position, number)
VALUES
('John Smith', (SELECT id FROM Team ORDER BY RANDOM() LIMIT 1), 'QB', 1),
('Michael Johnson', (SELECT id FROM Team ORDER BY RANDOM() LIMIT 1), 'RB', 22),
('William Brown', (SELECT id FROM Team ORDER BY RANDOM() LIMIT 1), 'WR', 81),
('David Miller', (SELECT id FROM Team ORDER BY RANDOM() LIMIT 1), 'TE', 87),
('Robert Davis', (SELECT id FROM Team ORDER BY RANDOM() LIMIT 1), 'OT', 77),
('Richard Wilson', (SELECT id FROM Team ORDER BY RANDOM() LIMIT 1), 'OG', 65),
('Joseph Taylor', (SELECT id FROM Team ORDER BY RANDOM() LIMIT 1), 'C', 55),
('Thomas Anderson', (SELECT id FROM Team ORDER BY RANDOM() LIMIT 1), 'DE', 91),
('Christopher White', (SELECT id FROM Team ORDER BY RANDOM() LIMIT 1), 'DT', 97),
('Daniel Harris', (SELECT id FROM Team ORDER BY RANDOM() LIMIT 1), 'OLB', 53),
('Matthew Martin', (SELECT id FROM Team ORDER BY RANDOM() LIMIT 1), 'MLB', 59),
('Paul Thompson', (SELECT id FROM Team ORDER BY RANDOM() LIMIT 1), 'CB', 29),
('Mark Walker', (SELECT id FROM Team ORDER BY RANDOM() LIMIT 1), 'SS', 37),
('Donald Hall', (SELECT id FROM Team ORDER BY RANDOM() LIMIT 1), 'FS', 20),
('Steven Allen', (SELECT id FROM Team ORDER BY RANDOM() LIMIT 1), 'K', 3),
('Edward Wright', (SELECT id FROM Team ORDER BY RANDOM() LIMIT 1), 'P', 9),
('William Clark', (SELECT id FROM Team ORDER BY RANDOM() LIMIT 1), 'KR', 23),
('James Young', (SELECT id FROM Team ORDER BY RANDOM() LIMIT 1), 'PR', 15),
('John Lewis', (SELECT id FROM Team ORDER BY RANDOM() LIMIT 1), 'LS', 48),
('Robert Evans', (SELECT id FROM Team ORDER BY RANDOM() LIMIT 1), 'QB', 12),
('Michael Walker', (SELECT id FROM Team ORDER BY RANDOM() LIMIT 1), 'RB', 28),
('William Davis', (SELECT id FROM Team ORDER BY RANDOM() LIMIT 1), 'WR', 80),
('David Williams', (SELECT id FROM Team ORDER BY RANDOM() LIMIT 1), 'TE', 82),
('Robert Miller', (SELECT id FROM Team ORDER BY RANDOM() LIMIT 1), 'OT', 79),
('Richard Moore', (SELECT id FROM Team ORDER BY RANDOM() LIMIT 1), 'OG', 67),
('Joseph Thompson', (SELECT id FROM Team ORDER BY RANDOM() LIMIT 1), 'C', 52),
('Thomas Brown', (SELECT id FROM Team ORDER BY RANDOM() LIMIT 1), 'DE', 99),
('Christopher Wilson', (SELECT id FROM Team ORDER BY RANDOM() LIMIT 1), 'DT', 95),
('Daniel Martin', (SELECT id FROM Team ORDER BY RANDOM() LIMIT 1), 'OLB', 50),
('Matthew Johnson', (SELECT id FROM Team ORDER BY RANDOM() LIMIT 1), 'MLB', 56),
('Paul Anderson', (SELECT id FROM Team ORDER BY RANDOM() LIMIT 1), 'CB', 26),
('Mark Harris', (SELECT id FROM Team ORDER BY RANDOM() LIMIT 1), 'SS', 33),
('Donald Davis', (SELECT id FROM Team ORDER BY RANDOM() LIMIT 1), 'FS', 21),
('Steven Taylor', (SELECT id FROM Team ORDER BY RANDOM() LIMIT 1), 'K', 8),
('Edward Smith', (SELECT id FROM Team ORDER BY RANDOM() LIMIT 1), 'P', 4),
('William Wilson', (SELECT id FROM Team ORDER BY RANDOM() LIMIT 1), 'KR', 27),
('James Thompson', (SELECT id FROM Team ORDER BY RANDOM() LIMIT 1), 'PR', 19),
('John Clark', (SELECT id FROM Team ORDER BY RANDOM() LIMIT 1), 'LS', 44);

--- GAMES ---
INSERT INTO Game (homeTeamId, awayTeamId, homeTeamScore, awayTeamScore, overtime) VALUES (1, 2, 28, 21, TRUE), (3, 4, 35, 31, FALSE), (5, 6, 24, 17, FALSE), (7, 8, 17, 14, TRUE), (9, 10, 21, 20, FALSE), (11, 12, 28, 27, FALSE), (13, 14, 38, 35, TRUE), (15, 16, 31, 28, FALSE), (17, 18, 42, 38, FALSE), (19, 20, 27, 24, FALSE), (21, 22, 24, 21, TRUE), (23, 24, 21, 20, FALSE), (25, 26, 35, 31, FALSE), (27, 28, 28, 27, FALSE), (29, 30, 31, 28, FALSE), (31, 32, 38, 35, TRUE), (2, 1, 21, 28, FALSE), (4, 3, 31, 35, FALSE), (6, 5, 17, 24, TRUE), (8, 7, 14, 17, FALSE), (10, 9, 20, 21, FALSE), (12, 11, 27, 28, FALSE), (14, 13, 35, 38, TRUE), (16, 15, 28, 31, FALSE), (18, 17, 38, 42, FALSE), (20, 19, 24, 27, FALSE), (22, 21, 21, 24, TRUE), (24, 23, 20, 21, FALSE), (26, 25, 31, 35, FALSE), (28, 27, 27, 28, FALSE), (30, 29, 28, 31, FALSE), (32, 31, 35, 38, TRUE),(2, 3, 28, 24, FALSE), (4, 5, 31, 17, FALSE), (6, 7, 24, 21, TRUE), (8, 9, 17, 14, FALSE), (10, 11, 28, 21, FALSE), (12, 13, 35, 28, FALSE), (14, 15, 38, 31, TRUE), (16, 17, 28, 24, FALSE), (18, 19, 35, 20, FALSE), (20, 21, 27, 24, FALSE), (22, 23, 21, 17, TRUE), (24, 25, 28, 21, FALSE), (26, 27, 31, 28, FALSE), (28, 29, 24, 21, FALSE), (30, 31, 38, 35, TRUE), (1, 2, 21, 28, FALSE), (3, 4, 24, 31, FALSE), (5, 6, 17, 24, TRUE), (7, 8, 14, 17, FALSE), (9, 10, 21, 20, FALSE), (11, 12, 27, 28, FALSE), (13, 14, 35, 38, TRUE), (15, 16, 31, 28, FALSE), (17, 18, 42, 38, FALSE), (19, 20, 27, 24, FALSE), (21, 22, 24, 21, TRUE), (23, 24, 20, 21, FALSE), (25, 26, 35, 31, FALSE), (27, 28, 27, 28, FALSE), (29, 30, 28, 31, FALSE), (31, 32, 35, 38, TRUE),
(2, 1, 28, 21, FALSE), (3, 2, 31, 28, FALSE), (4, 3, 27, 24, FALSE), (5, 4, 24, 21, TRUE), (6, 5, 21, 17, FALSE), (7, 6, 38, 35, TRUE), (8, 7, 31, 28, FALSE), (9, 8, 28, 24, FALSE), (10, 9, 35, 31, FALSE), (11, 10, 28, 21, FALSE), (12, 11, 24, 20, FALSE), (13, 12, 38, 35, TRUE), (14, 13, 31, 28, FALSE), (15, 14, 24, 21, TRUE), (16, 15, 28, 24, FALSE), (17, 16, 35, 31, FALSE), (18, 17, 21, 17, FALSE), (19, 18, 31, 28, FALSE), (20, 19, 24, 21, TRUE), (21, 20, 38, 35, TRUE), (22, 21, 28, 24, FALSE), (23, 22, 35, 31, FALSE), (24, 23, 21, 17, FALSE), (25, 24, 31, 28, FALSE), (26, 25, 24, 21, TRUE), (27, 26, 38, 35, TRUE), (28, 27, 28, 24, FALSE), (29, 28, 35, 31, FALSE), (30, 29, 21, 17, FALSE), (31, 30, 31, 28, FALSE), (32, 31, 24, 21, TRUE), (1, 2, 28, 21, FALSE), (2, 3, 31, 28, FALSE), (3, 4, 27, 24, FALSE), (4, 5, 24, 21, TRUE), (5, 6, 21, 17, FALSE), (6, 7, 38, 35, TRUE), (7, 8, 31, 28, FALSE), (8, 9, 28, 24, FALSE), (9, 10, 35, 31, FALSE), (10, 11, 28, 21, FALSE), (11, 12, 24, 20, FALSE), (12, 13, 38, 35, TRUE), (13, 14, 31, 28, FALSE), (14, 15, 24, 21, TRUE), (15, 16, 28, 24, FALSE), (16, 17, 35, 31, FALSE), (17, 18, 21, 17, FALSE), (18, 19, 31, 28, FALSE), (19, 20, 24, 21, TRUE), (20, 21, 38, 35, TRUE), (21, 22, 28, 24, FALSE), (22, 23, 35, 31, FALSE), (23, 24, 21, 17, FALSE), (24, 25, 31, 28, FALSE), (25, 26, 24, 21, TRUE), (26, 27, 38, 35, TRUE), (27, 28, 28, 24, FALSE), (28, 29, 35, 31, FALSE), (29, 30, 21, 17, FALSE), (30, 31, 31, 28, FALSE), (31, 32, 24, 21, TRUE),
(2, 3, 28, 24, FALSE), (4, 5, 31, 17, FALSE), (6, 7, 24, 21, TRUE), (8, 9, 17, 14, FALSE), (10, 11, 28, 21, FALSE), (12, 13, 35, 28, FALSE), (14, 15, 38, 31, TRUE), (16, 17, 28, 24, FALSE), (18, 19, 35, 20, FALSE), (20, 21, 27, 24, FALSE), (22, 23, 21, 17, TRUE), (24, 25, 28, 21, FALSE), (26, 27, 31, 28, FALSE), (28, 29, 24, 21, FALSE), (30, 31, 38, 35, TRUE), (1, 2, 21, 28, FALSE), (3, 4, 24, 31, FALSE), (5, 6, 17, 24, TRUE), (7, 8, 14, 17, FALSE), (9, 10, 21, 20, FALSE), (11, 12, 27, 28, FALSE), (13, 14, 35, 38, TRUE), (15, 16, 31, 28, FALSE), (17, 18, 42, 38, FALSE), (19, 20, 27, 24, FALSE), (21, 22, 24, 21, TRUE), (23, 24, 20, 21, FALSE), (25, 26, 35, 31, FALSE), (27, 28, 27, 28, FALSE), (29, 30, 28, 31, FALSE), (31, 32, 35, 38, TRUE), (1, 3, 21, 17, FALSE), (2, 4, 28, 24, FALSE), (3, 5, 31, 28, TRUE), (4, 6, 24, 21, FALSE), (5, 7, 17, 14, FALSE), (6, 8, 28, 21, FALSE), (7, 9, 38, 35, TRUE), (8, 10, 31, 28, FALSE), (9, 11, 24, 21, FALSE), (10, 12, 35, 28, FALSE), (11, 13, 28, 24, FALSE), (12, 14, 21, 17, FALSE), (13, 15, 35, 31, TRUE), (14, 16, 31, 28, FALSE), (15, 17, 24, 21, TRUE), (16, 18, 28, 24, FALSE), (17, 19, 35, 31, FALSE), (18, 20, 21, 17, FALSE), (19, 21, 31, 28, FALSE), (20, 22, 24, 21, TRUE), (21, 23, 38, 35, TRUE), (22, 24, 28, 24, FALSE), (23, 25, 35, 31, FALSE), (24, 26, 21, 17, FALSE), (25, 27, 31, 28, FALSE), (26, 28, 24, 21, TRUE), (27, 29, 38, 35, TRUE), (28, 30, 28, 24, FALSE), (29, 31, 35, 31, FALSE), (30, 32, 21, 17, FALSE), (1, 2, 28, 21, FALSE), (2, 3, 31, 28, FALSE), (3, 4, 27, 24, FALSE), (4, 5, 24, 21, TRUE), (5, 6, 21, 17, FALSE), (6, 7, 38, 35, TRUE), (7, 8, 31, 28, FALSE), (8, 9, 28, 24, FALSE), (9, 10, 35, 31, FALSE), (10, 11, 28, 21, FALSE), (11, 12, 24, 20, FALSE), (12, 13, 38, 35, TRUE), (13, 14, 31, 28, FALSE), (14, 15, 24, 21, TRUE), (15, 16, 28, 24, FALSE), (16, 17, 35, 31, FALSE), (17, 18, 21, 17, FALSE), (18, 19, 31, 28, FALSE), (19, 20, 24, 21, TRUE), (20, 21, 38, 35, TRUE), (21, 22, 28, 24, FALSE), (22, 23, 35, 31, FALSE), (23, 24, 21, 17, FALSE), (24, 25, 31, 28, FALSE), (25, 26, 24, 21, TRUE), (26, 27, 38, 35, TRUE), (27, 28, 28, 24, FALSE), (28, 29, 35, 31, FALSE), (29, 30, 21, 17, FALSE), (30, 31, 31, 28, FALSE), (31, 32, 24, 21, TRUE), (1, 2, 28, 21, FALSE), (2, 3, 31, 28, FALSE), (3, 4, 27, 24, FALSE), (4, 5, 24, 21, TRUE), (5, 6, 21, 17, FALSE), (6, 7, 38, 35, TRUE), (7, 8, 31, 28, FALSE), (8, 9, 28, 24, FALSE), (9, 10, 35, 31, FALSE), (10, 11, 28, 21, FALSE), (11, 12, 24, 20, FALSE), (12, 13, 38, 35, TRUE), (13, 14, 31, 28, FALSE), (14, 15, 24, 21, TRUE)




