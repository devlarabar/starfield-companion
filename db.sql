CREATE TABLE IF NOT EXISTS Family (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS Resource (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    symbol TEXT,
    rarity INTEGER NOT NULL,
    category INTEGER NOT NULL,
    state INTEGER,
    mass DECIMAL(5, 2) NOT NULL,
    family_id INTEGER,
    planet_ids TEXT,
    is_favourite BOOLEAN NOT NULL DEFAULT 0,
    is_anomaly_dependent BOOLEAN NOT NULL DEFAULT 0,
    FOREIGN KEY (family_id) REFERENCES Family(id)
);

CREATE TABLE IF NOT EXISTS ResourceSubtype (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    resource_id INTEGER,
    name TEXT NOT NULL,
    mass DECIMAL(5, 2),
    FOREIGN KEY (resource_id) REFERENCES Resource(id)
);

CREATE TABLE IF NOT EXISTS Faction (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    category INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS System (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    faction_id INTEGER,
    coords TEXT,
    level INTEGER NOT NULL,
    FOREIGN KEY (faction_id) REFERENCES Faction(id)
);

CREATE TABLE IF NOT EXISTS Planet (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    system_id INTEGER,
    icon TEXT,
    category INTEGER NOT NULL,
    FOREIGN KEY (system_id) REFERENCES System(id)
);