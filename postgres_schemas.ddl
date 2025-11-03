CREATE TABLE Club (
  ID_club INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR(55) NOT NULL,
  city VARCHAR(55) NOT NULL
);

CREATE TABLE National_Team (
  ID_national_team INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  Country VARCHAR(50) NOT NULL
);

CREATE TABLE Sponsor (
  ID_sponsor INT PRIMARY KEY,
  city VARCHAR(55) NOT NULL,
  name VARCHAR(100) NOT NULL,
  Person INT,
  Company INT,
  CONSTRAINT chk_sponsor_xor CHECK(
    (Person IS NOT NULL AND Company IS NULL)
    OR (Person IS NULL AND Company IS NOT NULL)
  )
);

CREATE TABLE Player (
  ID_player INT PRIMARY KEY,
  Name VARCHAR(55) NOT NULL,
  Date_of_birth DATE NOT NULL,
  Height NUMERIC(5,2) NOT NULL
);

CREATE TABLE Competition (
  ID_Competition INT PRIMARY KEY,
  League INT,
  Championship INT,
  CONSTRAINT chk_competition_xor CHECK(
    (League IS NOT NULL AND Championship IS NULL)
    OR (League IS NULL AND Championship IS NOT NULL)
  )
);

CREATE TABLE Game (
  ID_game INT PRIMARY KEY,
  ID_Competition INT NOT NULL REFERENCES Competition(ID_Competition)
);



CREATE TABLE Team (
  ID_Team INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  ID_national_team INT UNIQUE,
  ID_club INT UNIQUE,
  CONSTRAINT fk_team_national FOREIGN KEY (ID_national_team)
      REFERENCES National_Team(ID_national_team),
  CONSTRAINT fk_team_club FOREIGN KEY (ID_club)
      REFERENCES Club(ID_club),
  CONSTRAINT chk_team_xor CHECK(
    (ID_national_team IS NOT NULL AND ID_club IS NULL)
    OR (ID_national_team IS NULL AND ID_club IS NOT NULL)
  )
);

CREATE TABLE Citizenship (
  ID_player INT NOT NULL,
  Citizenship VARCHAR(55) NOT NULL,
  PRIMARY KEY (ID_player, Citizenship),
  FOREIGN KEY (ID_player) REFERENCES Player(ID_player)
);

CREATE TABLE Person (
  ID_sponsor INT PRIMARY KEY,
  FOREIGN KEY (ID_sponsor) REFERENCES Sponsor(ID_sponsor)
);

CREATE TABLE Company (
  ID_sponsor INT PRIMARY KEY,
  FOREIGN KEY (ID_sponsor) REFERENCES Sponsor(ID_sponsor)
);



CREATE TABLE Season (
  ID_season INT PRIMARY KEY,
  Start_Date DATE NOT NULL,
  End_Date DATE NOT NULL,
  ID_Competition INT NOT NULL REFERENCES Competition(ID_Competition)
);

CREATE TABLE Hosts (
  ID_Team INT NOT NULL,
  ID_game INT NOT NULL,
  PRIMARY KEY (ID_game, ID_Team),
  FOREIGN KEY (ID_game) REFERENCES Game(ID_game),
  FOREIGN KEY (ID_Team) REFERENCES Team(ID_Team)
);

CREATE TABLE Plays (
  ID_Team INT NOT NULL,
  ID_player INT NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE,
  PRIMARY KEY (ID_Team, ID_player),
  FOREIGN KEY (ID_player) REFERENCES Player(ID_player),
  FOREIGN KEY (ID_Team) REFERENCES Team(ID_Team)
);


CREATE TABLE Players_performance (
  ID_game INT NOT NULL,
  ID_player INT NOT NULL,
  throws_3pts INT NOT NULL,
  throws_2pts INT NOT NULL,
  free_throws INT NOT NULL,
  assists INT NOT NULL,
  rebounds INT NOT NULL,
  blocks INT NOT NULL,
  PRIMARY KEY (ID_player, ID_game),
  FOREIGN KEY (ID_player) REFERENCES Player(ID_player),
  FOREIGN KEY (ID_game) REFERENCES Game(ID_game)
);

CREATE TABLE Successfull (
  ID_player INT NOT NULL,
  ID_game INT NOT NULL,
  PRIMARY KEY (ID_player, ID_game),
  FOREIGN KEY (ID_player, ID_game)
    REFERENCES Players_performance(ID_player, ID_game)
);

CREATE TABLE All_stats (
  ID_player INT NOT NULL,
  ID_game INT NOT NULL,
  Fouls INT NOT NULL,
  PRIMARY KEY (ID_player, ID_game),
  FOREIGN KEY (ID_player, ID_game)
    REFERENCES Players_performance(ID_player, ID_game)
);



CREATE TABLE League (
  ID_Competition INT PRIMARY KEY,
  FOREIGN KEY (ID_Competition) REFERENCES Competition(ID_Competition)
);

CREATE TABLE Championship (
  ID_Competition INT PRIMARY KEY,
  FOREIGN KEY (ID_Competition) REFERENCES Competition(ID_Competition)
);



CREATE TABLE Sponsoring_contract (
  ID_Team INT NOT NULL,
  ID_sponsor INT NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE,
  amount NUMERIC(12,2) NOT NULL,
  PRIMARY KEY (ID_Team, ID_sponsor),
  FOREIGN KEY (ID_sponsor) REFERENCES Sponsor(ID_sponsor),
  FOREIGN KEY (ID_Team) REFERENCES Team(ID_Team)
);
